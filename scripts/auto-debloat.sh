#!/bin/bash
# Automated Debloat Script for Samsung Galaxy S25 Edge
# Automates the entire debloating process with user selection

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}Samsung Galaxy S25 Edge Auto-Debloat${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# Check if ADB is installed
if ! command -v adb &> /dev/null; then
    echo -e "${RED}Error: ADB is not installed${NC}"
    echo "Please install ADB first. See ADB-SETUP-GUIDE.md"
    exit 1
fi

# Check ADB connection
echo -e "${YELLOW}Checking ADB connection...${NC}"
adb devices | grep -q "device$"
if [ $? -ne 0 ]; then
    echo -e "${RED}Error: No device connected${NC}"
    echo "Please:"
    echo "1. Enable USB debugging on your phone"
    echo "2. Connect via USB or wireless ADB"
    echo "3. Run: adb devices"
    exit 1
fi

echo -e "${GREEN}✓ Device connected${NC}"
echo ""

# Create backup directory
BACKUP_DIR="$HOME/samsung-debloat-backups"
mkdir -p "$BACKUP_DIR"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="$BACKUP_DIR/packages_before_debloat_$TIMESTAMP.txt"

# Backup current packages
echo -e "${YELLOW}Creating backup of current packages...${NC}"
adb shell pm list packages > "$BACKUP_FILE"
echo -e "${GREEN}✓ Backup saved to: $BACKUP_FILE${NC}"
echo ""

# Device info
DEVICE_MODEL=$(adb shell getprop ro.product.model | tr -d '\r')
ANDROID_VERSION=$(adb shell getprop ro.build.version.release | tr -d '\r')
ONEUI_VERSION=$(adb shell getprop ro.build.version.oneui | tr -d '\r')

echo "Device: $DEVICE_MODEL"
echo "Android: $ANDROID_VERSION"
echo "OneUI: $ONEUI_VERSION"
echo ""

# Menu selection
echo -e "${BLUE}Select debloat level:${NC}"
echo ""
echo "1) Conservative (Recommended)"
echo "   Removes: Facebook, carriers, obvious bloatware"
echo "   Keeps: All Samsung features, Bixby, Gemini"
echo "   Risk: Very Low"
echo ""
echo "2) Moderate"
echo "   Removes: Conservative + Samsung duplicates + some Google apps"
echo "   Keeps: Core features"
echo "   Risk: Low"
echo ""
echo "3) Aggressive"
echo "   Removes: Most Samsung/Google apps"
echo "   Keeps: Essential system apps only"
echo "   Risk: Moderate - May break features"
echo ""
echo "4) Custom (Select categories manually)"
echo ""
echo "5) Restore from backup"
echo ""
echo "6) Exit"
echo ""
read -p "Enter choice (1-6): " choice

case $choice in
    1)
        echo -e "${GREEN}Selected: Conservative${NC}"
        LEVEL="conservative"
        ;;
    2)
        echo -e "${YELLOW}Selected: Moderate${NC}"
        LEVEL="moderate"
        ;;
    3)
        echo -e "${RED}Selected: Aggressive${NC}"
        read -p "Are you sure? This may break features (y/n): " confirm
        if [[ ! $confirm =~ ^[Yy]$ ]]; then
            echo "Cancelled."
            exit 0
        fi
        LEVEL="aggressive"
        ;;
    4)
        echo -e "${BLUE}Custom selection${NC}"
        LEVEL="custom"
        ;;
    5)
        echo "Restore feature coming soon. See RESTORE-GUIDE.md for manual restore."
        exit 0
        ;;
    6)
        echo "Exiting."
        exit 0
        ;;
    *)
        echo "Invalid choice"
        exit 1
        ;;
esac

echo ""
echo -e "${YELLOW}WARNING:${NC}"
echo "- This will remove apps from your device"
echo "- Apps can be restored (see RESTORE-GUIDE.md)"
echo "- Factory reset will restore everything"
echo "- Review what will be removed before confirming"
echo ""
read -p "Continue? (y/n): " confirm

if [[ ! $confirm =~ ^[Yy]$ ]]; then
    echo "Cancelled."
    exit 0
fi

# Function to run commands from file
run_debloat_file() {
    local file=$1
    local description=$2

    if [ ! -f "$file" ]; then
        echo -e "${RED}Error: File not found: $file${NC}"
        return 1
    fi

    echo ""
    echo -e "${BLUE}$description${NC}"

    local count=0
    local success=0
    local failed=0

    while IFS= read -r line; do
        # Skip comments and empty lines
        [[ "$line" =~ ^#.*$ ]] && continue
        [[ -z "$line" ]] && continue

        # Extract package name from adb command
        if [[ "$line" =~ pm\ uninstall.*\ ([a-z0-9.]+)$ ]]; then
            package="${BASH_REMATCH[1]}"
            count=$((count + 1))

            # Run the command
            eval "$line" &> /dev/null

            if [ $? -eq 0 ]; then
                success=$((success + 1))
                echo -e "${GREEN}✓${NC} Removed: $package"
            else
                failed=$((failed + 1))
                echo -e "${YELLOW}⚠${NC} Not found/already removed: $package"
            fi
        fi
    done < "$file"

    echo ""
    echo "Processed: $count packages"
    echo -e "${GREEN}Removed: $success${NC}"
    echo -e "${YELLOW}Skipped: $failed${NC}"
}

# Execute debloat based on selection
case $LEVEL in
    conservative)
        run_debloat_file "$REPO_ROOT/01-safe-user-apps.txt" "Removing safe user apps..."
        run_debloat_file "$REPO_ROOT/02-bloatware-carriers.txt" "Removing carrier bloatware..."
        ;;
    moderate)
        run_debloat_file "$REPO_ROOT/01-safe-user-apps.txt" "Removing safe user apps..."
        run_debloat_file "$REPO_ROOT/02-bloatware-carriers.txt" "Removing carrier bloatware..."
        run_debloat_file "$REPO_ROOT/03-safe-system-apps.txt" "Removing safe system apps..."
        ;;
    aggressive)
        run_debloat_file "$REPO_ROOT/01-safe-user-apps.txt" "Removing safe user apps..."
        run_debloat_file "$REPO_ROOT/02-bloatware-carriers.txt" "Removing carrier bloatware..."
        run_debloat_file "$REPO_ROOT/03-safe-system-apps.txt" "Removing safe system apps..."
        run_debloat_file "$REPO_ROOT/04-optional-removals.txt" "Removing optional apps..."
        ;;
    custom)
        echo ""
        echo "Select categories to remove:"
        echo "1) Safe user apps"
        echo "2) Carrier bloatware"
        echo "3) Safe system apps"
        echo "4) Optional removals"
        echo "5) Remove Bixby"
        echo ""
        read -p "Enter numbers separated by spaces (e.g., 1 2 3): " categories

        for cat in $categories; do
            case $cat in
                1) run_debloat_file "$REPO_ROOT/01-safe-user-apps.txt" "Removing safe user apps..." ;;
                2) run_debloat_file "$REPO_ROOT/02-bloatware-carriers.txt" "Removing carrier bloatware..." ;;
                3) run_debloat_file "$REPO_ROOT/03-safe-system-apps.txt" "Removing safe system apps..." ;;
                4) run_debloat_file "$REPO_ROOT/04-optional-removals.txt" "Removing optional apps..." ;;
                5) run_debloat_file "$REPO_ROOT/canta-lists/remove-bixby.txt" "Removing Bixby..." ;;
            esac
        done
        ;;
esac

# Create after-debloat backup
AFTER_BACKUP="$BACKUP_DIR/packages_after_debloat_$TIMESTAMP.txt"
echo ""
echo -e "${YELLOW}Creating post-debloat backup...${NC}"
adb shell pm list packages > "$AFTER_BACKUP"
echo -e "${GREEN}✓ Backup saved to: $AFTER_BACKUP${NC}"

# Generate comparison report
REPORT_FILE="$BACKUP_DIR/debloat_report_$TIMESTAMP.txt"
echo ""
echo -e "${YELLOW}Generating report...${NC}"

{
    echo "Samsung Galaxy S25 Edge Debloat Report"
    echo "Generated: $(date)"
    echo "========================================"
    echo ""
    echo "Device: $DEVICE_MODEL"
    echo "Android: $ANDROID_VERSION"
    echo "OneUI: $ONEUI_VERSION"
    echo ""
    echo "Debloat Level: $LEVEL"
    echo ""
    echo "Packages Before: $(wc -l < "$BACKUP_FILE")"
    echo "Packages After: $(wc -l < "$AFTER_BACKUP")"
    echo "Packages Removed: $(($(wc -l < "$BACKUP_FILE") - $(wc -l < "$AFTER_BACKUP")))"
    echo ""
    echo "Removed packages:"
    echo "----------------"
    comm -23 <(sort "$BACKUP_FILE") <(sort "$AFTER_BACKUP")
} > "$REPORT_FILE"

echo -e "${GREEN}✓ Report saved to: $REPORT_FILE${NC}"

# Summary
echo ""
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}Debloat Complete!${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""
echo "Backups and reports saved to:"
echo "$BACKUP_DIR"
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo "1. Reboot your device: adb reboot"
echo "2. Test all features you use"
echo "3. Check POST-UPDATE-GUIDE.md for testing checklist"
echo "4. If issues, see RESTORE-GUIDE.md"
echo ""
read -p "Reboot device now? (y/n): " reboot

if [[ $reboot =~ ^[Yy]$ ]]; then
    echo "Rebooting..."
    adb reboot
else
    echo "Please reboot manually when ready."
fi

echo ""
echo -e "${GREEN}Done!${NC}"
