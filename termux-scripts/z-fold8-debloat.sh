#!/data/data/com.termux/files/usr/bin/bash
# Galaxy Z Fold 8 Debloat Script - OneUI 9 (Android 17)
# Safe additional removals for a Galaxy Z Fold 8 (SM-F971U1)
# Run in Termux with: bash z-fold8-debloat.sh

echo "========================================="
echo "Galaxy Z Fold 8 Debloat - OneUI 9"
echo "========================================="
echo ""
echo "This removes safe Z Fold 8 extras:"
echo "- Samsung extras (Easy mode widget, People edge, cold wallet, Warranty Care, GPUWatch)"
echo "- Unused Google/Android components (XR glasses stub, Voice Access, Linux terminal)"
echo "- Text-to-Speech voice packs (storage)"
echo ""
echo "Now Brief, cover screen, Flex mode and Galaxy AI packages are NOT touched."
echo "See 08-z-fold8.txt for optional removals and the KEEP list."
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

# Samsung extras
echo "Removing Samsung extras..."
adb shell pm uninstall --user 0 com.sec.android.widgetapp.easymodecontactswidget
adb shell pm uninstall --user 0 com.samsung.android.service.peoplestripe
adb shell pm uninstall --user 0 com.samsung.android.coldwalletservice
adb shell pm uninstall --user 0 com.samsung.android.warrantycare
adb shell pm uninstall --user 0 com.samsung.gpuwatchapp

# Google / Android components
echo ""
echo "Removing unused Google and Android components..."
adb shell pm uninstall --user 0 com.google.android.glasses.core
adb shell pm uninstall --user 0 com.google.android.apps.accessibility.voiceaccess
adb shell pm uninstall --user 0 com.android.virtualization.terminal
adb shell pm uninstall --user 0 com.android.egg

# Text-to-Speech voice packs (storage savings)
echo ""
echo "Removing Text-to-Speech voice packs..."
adb shell pm uninstall --user 0 com.samsung.SMT.lang_es_mx_f00
adb shell pm uninstall --user 0 com.samsung.SMT.lang_es_us_l01
adb shell pm uninstall --user 0 com.samsung.SMT.lang_pt_br_l01

echo ""
echo "========================================="
echo "Z Fold 8 debloat complete!"
echo "========================================="
echo ""
echo "Next steps:"
echo "1. Reboot your device"
echo "2. Test the cover screen, Flex mode and any features you use"
echo "3. For optional removals, review 08-z-fold8.txt"
echo ""
echo "To reboot: adb reboot"
echo ""
