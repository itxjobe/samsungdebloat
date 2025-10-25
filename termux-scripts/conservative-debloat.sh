#!/data/data/com.termux/files/usr/bin/bash
# Conservative Debloat Script for Samsung Galaxy S25 Edge
# Safe removals - Facebook, carriers, obvious bloatware
# Run in Termux with: bash conservative-debloat.sh

echo "========================================="
echo "Conservative Debloat for S25 Edge"
echo "========================================="
echo ""
echo "This will remove:"
echo "- Facebook apps"
echo "- Microsoft Office bloatware"
echo "- Amazon, Booking, Netflix (can reinstall from Play Store)"
echo "- Samsung TV Plus, Game Launcher"
echo "- Carrier bloatware"
echo ""
echo "Press Ctrl+C to cancel, or Enter to continue..."
read

echo ""
echo "Connecting to ADB..."
adb connect localhost:5555

if [ $? -ne 0 ]; then
    echo "Error: Could not connect to ADB"
    echo "Make sure Wireless Debugging is enabled in Developer Options"
    exit 1
fi

echo ""
echo "Starting debloat..."
echo ""

# Third-party bloatware
echo "Removing third-party bloatware..."
adb shell pm uninstall --user 0 com.facebook.katana
adb shell pm uninstall --user 0 com.facebook.system
adb shell pm uninstall --user 0 com.facebook.appmanager
adb shell pm uninstall --user 0 com.facebook.services
adb shell pm uninstall --user 0 com.microsoft.office.outlook
adb shell pm uninstall --user 0 com.microsoft.office.officehubrow
adb shell pm uninstall --user 0 com.amazon.mShop.android.shopping
adb shell pm uninstall --user 0 com.booking
adb shell pm uninstall --user 0 com.netflix.mediaclient
adb shell pm uninstall --user 0 com.linkedin.android

# Samsung bloatware
echo ""
echo "Removing Samsung bloatware..."
adb shell pm uninstall --user 0 com.samsung.android.game.gamehome
adb shell pm uninstall --user 0 com.samsung.android.game.gametools
adb shell pm uninstall --user 0 com.samsung.android.game.gos
adb shell pm uninstall --user 0 com.samsung.android.tvplus
adb shell pm uninstall --user 0 com.samsung.android.app.tips

# Carrier bloatware (safe to run - errors are normal for non-existent packages)
echo ""
echo "Removing carrier bloatware (errors are normal)..."
adb shell pm uninstall --user 0 com.vzw.apnservice
adb shell pm uninstall --user 0 com.vzw.ecid
adb shell pm uninstall --user 0 com.att.android.attsmartwifi
adb shell pm uninstall --user 0 com.att.myWireless
adb shell pm uninstall --user 0 com.tmobile.pr.adapt
adb shell pm uninstall --user 0 com.tmobile.pr.mytmobile
adb shell pm uninstall --user 0 com.orange.appshop
adb shell pm uninstall --user 0 com.orange.mail.fr

echo ""
echo "========================================="
echo "Conservative debloat complete!"
echo "========================================="
echo ""
echo "Next steps:"
echo "1. Reboot your device"
echo "2. Test all features you use"
echo "3. If satisfied, you can run moderate-debloat.sh for more"
echo ""
echo "To reboot: adb reboot"
echo ""
