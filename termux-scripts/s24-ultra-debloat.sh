#!/data/data/com.termux/files/usr/bin/bash
# Galaxy S24 Ultra Debloat Script - OneUI 9 (Android 17)
# Safe additional removals for a Galaxy S24 Ultra (SM-S928B)
# Run in Termux with: bash s24-ultra-debloat.sh

echo "========================================="
echo "Galaxy S24 Ultra Debloat - OneUI 9"
echo "========================================="
echo ""
echo "This disables safe S24 Ultra extras:"
echo "- Samsung extras (Wi-Fi Tips, shortcut backup, network diagnostics)"
echo "- Legacy SIM Toolkit apps"
echo "- Unused Text-to-Speech voice packs (storage)"
echo ""
echo "S Pen, eSIM, UWB, Galaxy AI, Quick Share and every OPTIONAL or"
echo "CAUTION entry are NOT touched."
echo "On OneUI 9 / Android 17 the shell cannot uninstall system apps,"
echo "so this script disables them (reversible with pm enable)."
echo "See 09-s24-ultra.txt for optional removals and the KEEP list."
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
echo "Disabling Samsung extras..."
adb shell pm disable-user --user 0 com.samsung.android.net.wifi.wifiguider
adb shell pm disable-user --user 0 com.samsung.android.shortcutbackupservice
adb shell pm disable-user --user 0 com.samsung.android.networkdiagnostic

# Legacy SIM Toolkit
echo ""
echo "Disabling legacy SIM Toolkit apps..."
adb shell pm disable-user --user 0 com.android.stk
adb shell pm disable-user --user 0 com.android.stk2
adb shell pm disable-user --user 0 com.android.simappdialog

# Text-to-Speech voice packs (storage savings)
echo ""
echo "Disabling unused Text-to-Speech voice packs..."
adb shell pm disable-user --user 0 com.samsung.SMT.lang_ar_ae_m00
adb shell pm disable-user --user 0 com.samsung.SMT.lang_de_de_f00
adb shell pm disable-user --user 0 com.samsung.SMT.lang_en_gb_f00
adb shell pm disable-user --user 0 com.samsung.SMT.lang_es_es_f00
adb shell pm disable-user --user 0 com.samsung.SMT.lang_fr_fr_f00
adb shell pm disable-user --user 0 com.samsung.SMT.lang_hi_in_f00
adb shell pm disable-user --user 0 com.samsung.SMT.lang_id_id_f00
adb shell pm disable-user --user 0 com.samsung.SMT.lang_it_it_f00
adb shell pm disable-user --user 0 com.samsung.SMT.lang_pl_pl_f00
adb shell pm disable-user --user 0 com.samsung.SMT.lang_pt_br_f00
adb shell pm disable-user --user 0 com.samsung.SMT.lang_ru_ru_f00
adb shell pm disable-user --user 0 com.samsung.SMT.lang_th_th_f00
adb shell pm disable-user --user 0 com.samsung.SMT.lang_vi_vn_f00

echo ""
echo "========================================="
echo "S24 Ultra debloat complete!"
echo "========================================="
echo ""
echo "Next steps:"
echo "1. Reboot your phone"
echo "2. Test calls, messages, camera, S Pen, eSIM and Wi-Fi"
echo "3. Restore anything with: adb shell pm enable <package>"
echo ""
echo "Optional (see 09-s24-ultra.txt): Single Take, Smart View,"
echo "Digital Wellbeing, Device care, Link to Windows, S Pen extras."
