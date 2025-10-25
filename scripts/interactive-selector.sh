#!/bin/bash
# Interactive Package Selector
# Choose exactly which packages to remove with descriptions

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"

# Check for dialog/whiptail
if command -v whiptail &> /dev/null; then
    DIALOG="whiptail"
elif command -v dialog &> /dev/null; then
    DIALOG="dialog"
else
    echo "Error: whiptail or dialog required for interactive mode"
    echo "Install with: sudo apt-get install whiptail"
    exit 1
fi

# Check ADB
if ! adb devices | grep -q "device$"; then
    echo "Error: No device connected via ADB"
    exit 1
fi

# Temporary files
SELECTED_PACKAGES=$(mktemp)
DEBLOAT_SCRIPT=$(mktemp)

# Categories with descriptions
declare -A CATEGORIES
CATEGORIES=(
    ["bloatware"]="Facebook, Microsoft, Amazon, Netflix"
    ["carriers"]="Verizon, AT&T, T-Mobile, carriers"
    ["samsung-duplicates"]="Samsung Calendar, Notes, Browser"
    ["samsung-features"]="AR Zone, Game Launcher, TV Plus"
    ["google-apps"]="YouTube Music, Docs, Photos"
    ["bixby"]="Bixby voice assistant"
)

echo "Samsung Galaxy S25 Edge - Interactive Package Selector"
echo "======================================================"
echo ""

# Select categories
OPTIONS=()
for key in "${!CATEGORIES[@]}"; do
    OPTIONS+=("$key" "${CATEGORIES[$key]}" "OFF")
done

SELECTED_CATS=$($DIALOG --title "Select Categories" --checklist \
    "Choose package categories to review:" 20 70 6 \
    "${OPTIONS[@]}" 3>&1 1>&2 2>&3)

if [ $? -ne 0 ]; then
    echo "Cancelled"
    exit 0
fi

# Build package list with descriptions
declare -a PACKAGES
declare -A PKG_DESC

# Add packages based on selected categories
for cat in $SELECTED_CATS; do
    case $cat in
        \"bloatware\")
            PACKAGES+=("com.facebook.katana" "com.facebook.system" "com.microsoft.office.outlook" "com.amazon.mShop.android.shopping" "com.netflix.mediaclient")
            PKG_DESC["com.facebook.katana"]="Facebook app"
            PKG_DESC["com.facebook.system"]="Facebook system service"
            PKG_DESC["com.microsoft.office.outlook"]="Microsoft Outlook"
            PKG_DESC["com.amazon.mShop.android.shopping"]="Amazon Shopping"
            PKG_DESC["com.netflix.mediaclient"]="Netflix"
            ;;
        \"carriers\")
            PACKAGES+=("com.vzw.apnservice" "com.att.myWireless" "com.tmobile.pr.mytmobile")
            PKG_DESC["com.vzw.apnservice"]="Verizon APN service"
            PKG_DESC["com.att.myWireless"]="AT&T My Wireless"
            PKG_DESC["com.tmobile.pr.mytmobile"]="T-Mobile My T-Mobile"
            ;;
        \"samsung-duplicates\")
            PACKAGES+=("com.samsung.android.calendar" "com.samsung.android.app.notes" "com.sec.android.app.sbrowser")
            PKG_DESC["com.samsung.android.calendar"]="Samsung Calendar (use Google Calendar)"
            PKG_DESC["com.samsung.android.app.notes"]="Samsung Notes (use Google Keep)"
            PKG_DESC["com.sec.android.app.sbrowser"]="Samsung Internet (use Chrome)"
            ;;
        \"samsung-features\")
            PACKAGES+=("com.samsung.android.arzone" "com.samsung.android.game.gamehome" "com.samsung.android.tvplus")
            PKG_DESC["com.samsung.android.arzone"]="AR Zone - AR features"
            PKG_DESC["com.samsung.android.game.gamehome"]="Game Launcher"
            PKG_DESC["com.samsung.android.tvplus"]="Samsung TV Plus streaming"
            ;;
        \"google-apps\")
            PACKAGES+=("com.google.android.apps.youtube.music" "com.google.android.apps.docs" "com.google.android.apps.photos")
            PKG_DESC["com.google.android.apps.youtube.music"]="YouTube Music"
            PKG_DESC["com.google.android.apps.docs"]="Google Docs"
            PKG_DESC["com.google.android.apps.photos"]="Google Photos"
            ;;
        \"bixby\")
            PACKAGES+=("com.samsung.android.bixby.agent" "com.samsung.android.bixby.wakeup")
            PKG_DESC["com.samsung.android.bixby.agent"]="Bixby voice assistant"
            PKG_DESC["com.samsung.android.bixby.wakeup"]="Hi Bixby wake detection"
            ;;
    esac
done

# Show package selection
OPTIONS=()
for pkg in "${PACKAGES[@]}"; do
    # Check if installed
    if adb shell pm list packages | grep -q "$pkg"; then
        status="ON"
    else
        status="OFF"
    fi
    OPTIONS+=("$pkg" "${PKG_DESC[$pkg]:-No description}" "$status")
done

FINAL_SELECTION=$($DIALOG --title "Select Packages to Remove" --checklist \
    "Review and select packages (SPACE to select, ENTER to confirm):" \
    25 80 15 \
    "${OPTIONS[@]}" 3>&1 1>&2 2>&3)

if [ $? -ne 0 ]; then
    echo "Cancelled"
    exit 0
fi

# Generate removal commands
echo "#!/bin/bash" > "$DEBLOAT_SCRIPT"
echo "# Generated debloat script - $(date)" >> "$DEBLOAT_SCRIPT"
echo "" >> "$DEBLOAT_SCRIPT"

count=0
for pkg in $FINAL_SELECTION; do
    pkg_clean=$(echo "$pkg" | tr -d '"')
    echo "adb shell pm uninstall --user 0 $pkg_clean" >> "$DEBLOAT_SCRIPT"
    echo "$pkg_clean" >> "$SELECTED_PACKAGES"
    count=$((count + 1))
done

chmod +x "$DEBLOAT_SCRIPT"

# Confirm execution
if $DIALOG --title "Confirm Removal" --yesno \
    "Remove $count packages?\n\nScript saved to: $DEBLOAT_SCRIPT\n\nExecute now?" 10 60; then

    echo ""
    echo "Executing debloat..."
    echo ""

    bash "$DEBLOAT_SCRIPT"

    echo ""
    echo "✓ Complete!"
    echo ""
    echo "Packages removed: $count"
    echo "Script saved: $DEBLOAT_SCRIPT"
    echo ""

    read -p "Reboot device? (y/n): " reboot
    if [[ $reboot =~ ^[Yy]$ ]]; then
        adb reboot
    fi
else
    echo "Script saved to: $DEBLOAT_SCRIPT"
    echo "Run manually: bash $DEBLOAT_SCRIPT"
fi

rm "$SELECTED_PACKAGES"
