#!/data/data/com.termux/files/usr/bin/bash
# Galaxy S26 Ultra Debloat Script - OneUI 8.5 (Android 16)
# Safe additional removals verified on a Galaxy S26 Ultra (SM-S948B)
# Run in Termux with: bash s26-ultra-debloat.sh

echo "========================================="
echo "Galaxy S26 Ultra Debloat - OneUI 8.5"
echo "========================================="
echo ""
echo "This removes safe S26 Ultra extras:"
echo "- Samsung promo/extra apps (My Galaxy, Moments, Stickers)"
echo "- SwiftKey (Samsung Keyboard stays)"
echo "- Unused Google components"
echo "- Text-to-Speech voice packs (storage)"
echo ""
echo "Caution-level system services are NOT touched here."
echo "See 07-s26-ultra.txt for those."
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
adb shell pm uninstall --user 0 com.mygalaxy
adb shell pm uninstall --user 0 com.samsung.android.app.moments
adb shell pm uninstall --user 0 com.samsung.android.app.watchmanagerstub
adb shell pm uninstall --user 0 com.samsung.android.beaconmanager
adb shell pm uninstall --user 0 com.samsung.android.inputshare
adb shell pm uninstall --user 0 com.samsung.android.liveeffectservice
adb shell pm uninstall --user 0 com.samsung.android.smartsuggestions
adb shell pm uninstall --user 0 com.samsung.android.stickercenter
adb shell pm uninstall --user 0 com.samsung.safetyinformation
adb shell pm uninstall --user 0 com.sec.android.app.personalization

# Google components
echo ""
echo "Removing unused Google components..."
adb shell pm uninstall --user 0 com.google.android.adservices.api
adb shell pm uninstall --user 0 com.google.android.apps.restore
adb shell pm uninstall --user 0 com.google.android.feedback
adb shell pm uninstall --user 0 com.google.android.printservice.recommendation
adb shell pm uninstall --user 0 com.google.android.gms.supervision

# SwiftKey (Samsung Keyboard is separate and stays)
echo ""
echo "Removing SwiftKey..."
adb shell pm uninstall --user 0 com.touchtype.swiftkey
adb shell pm uninstall --user 0 com.swiftkey.swiftkeyconfigurator

# Text-to-Speech voice packs (storage savings)
echo ""
echo "Removing Text-to-Speech voice packs..."
adb shell pm uninstall --user 0 com.samsung.SMT.lang_ar_ae_m00
adb shell pm uninstall --user 0 com.samsung.SMT.lang_de_de_f00
adb shell pm uninstall --user 0 com.samsung.SMT.lang_en_gb_f00
adb shell pm uninstall --user 0 com.samsung.SMT.lang_es_es_f00
adb shell pm uninstall --user 0 com.samsung.SMT.lang_es_mx_f00
adb shell pm uninstall --user 0 com.samsung.SMT.lang_es_us_f00
adb shell pm uninstall --user 0 com.samsung.SMT.lang_fr_fr_f00
adb shell pm uninstall --user 0 com.samsung.SMT.lang_hi_in_f00
adb shell pm uninstall --user 0 com.samsung.SMT.lang_id_id_f00
adb shell pm uninstall --user 0 com.samsung.SMT.lang_it_it_f00
adb shell pm uninstall --user 0 com.samsung.SMT.lang_pl_pl_f00
adb shell pm uninstall --user 0 com.samsung.SMT.lang_pt_br_f00
adb shell pm uninstall --user 0 com.samsung.SMT.lang_ru_ru_f00
adb shell pm uninstall --user 0 com.samsung.SMT.lang_th_th_f00
adb shell pm uninstall --user 0 com.samsung.SMT.lang_vi_vn_f00

echo ""
echo "========================================="
echo "S26 Ultra debloat complete!"
echo "========================================="
echo ""
echo "Next steps:"
echo "1. Reboot your device"
echo "2. Test all features you use"
echo "3. For caution-level services, review 07-s26-ultra.txt"
echo ""
echo "To reboot: adb reboot"
echo ""
