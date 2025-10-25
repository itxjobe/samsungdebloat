#!/bin/bash
# Restore packages from backup
# Restores packages that were removed

echo "Samsung Galaxy S25 Edge Package Restore"
echo "========================================"
echo ""

# Check ADB connection
if ! adb devices | grep -q "device$"; then
    echo "Error: No device connected"
    exit 1
fi

BACKUP_DIR="$HOME/samsung-debloat-backups"

if [ ! -d "$BACKUP_DIR" ]; then
    echo "Error: No backups found at $BACKUP_DIR"
    exit 1
fi

# List available backups
echo "Available backups:"
echo ""
backups=($(ls -t "$BACKUP_DIR"/backup_*.txt 2>/dev/null))

if [ ${#backups[@]} -eq 0 ]; then
    echo "No backup files found."
    exit 1
fi

for i in "${!backups[@]}"; do
    echo "$((i+1))) $(basename "${backups[$i]}")"
done

echo ""
read -p "Select backup to restore from (1-${#backups[@]}): " selection

if [ "$selection" -lt 1 ] || [ "$selection" -gt "${#backups[@]}" ]; then
    echo "Invalid selection"
    exit 1
fi

BACKUP_FILE="${backups[$((selection-1))]}"

echo ""
echo "Selected: $(basename "$BACKUP_FILE")"
echo ""

# Get current packages
CURRENT_PACKAGES=$(mktemp)
adb shell pm list packages | sort > "$CURRENT_PACKAGES"

# Extract packages from backup
BACKUP_PACKAGES=$(mktemp)
grep "^package:" "$BACKUP_FILE" | sort > "$BACKUP_PACKAGES"

# Find removed packages
REMOVED=$(comm -23 "$BACKUP_PACKAGES" "$CURRENT_PACKAGES")

if [ -z "$REMOVED" ]; then
    echo "No packages to restore (all packages present)"
    rm "$CURRENT_PACKAGES" "$BACKUP_PACKAGES"
    exit 0
fi

echo "Packages to restore:"
echo "$REMOVED" | sed 's/package://'
echo ""
echo "Count: $(echo "$REMOVED" | wc -l)"
echo ""

read -p "Restore these packages? (y/n): " confirm

if [[ ! $confirm =~ ^[Yy]$ ]]; then
    echo "Cancelled"
    rm "$CURRENT_PACKAGES" "$BACKUP_PACKAGES"
    exit 0
fi

echo ""
echo "Restoring packages..."
echo ""

success=0
failed=0

while IFS= read -r pkg; do
    package=$(echo "$pkg" | sed 's/package://')

    adb shell cmd package install-existing "$package" &> /dev/null

    if [ $? -eq 0 ]; then
        echo "✓ Restored: $package"
        success=$((success + 1))
    else
        echo "✗ Failed: $package"
        failed=$((failed + 1))
    fi
done <<< "$REMOVED"

echo ""
echo "Restore complete!"
echo "Successful: $success"
echo "Failed: $failed"
echo ""

read -p "Reboot device? (y/n): " reboot
if [[ $reboot =~ ^[Yy]$ ]]; then
    adb reboot
fi

rm "$CURRENT_PACKAGES" "$BACKUP_PACKAGES"
