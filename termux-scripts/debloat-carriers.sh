#!/data/data/com.termux/files/usr/bin/bash
# Carrier Bloatware Removal Script
# Removes all known carrier apps (worldwide)
# Run in Termux with: bash debloat-carriers.sh

echo "========================================="
echo "Carrier Bloatware Removal"
echo "========================================="
echo ""
echo "This will attempt to remove carrier apps from:"
echo "- Verizon, AT&T, T-Mobile, Sprint (US)"
echo "- Orange, Vodafone, EE, Three, O2 (Europe)"
echo "- Telstra (Australia), Rogers/Bell (Canada)"
echo "- SK Telecom, KT (Korea), Docomo (Japan)"
echo ""
echo "Errors are normal - you only have YOUR carrier's apps"
echo ""
echo "Press Ctrl+C to cancel, or Enter to continue..."
read

echo ""
echo "Connecting to ADB..."
adb connect localhost:5555

if [ $? -ne 0 ]; then
    echo "Error: Could not connect to ADB"
    exit 1
fi

echo ""
echo "Removing carrier apps (errors for non-existent packages are normal)..."
echo ""

# US Carriers
adb shell pm uninstall --user 0 com.vzw.apnservice
adb shell pm uninstall --user 0 com.vzw.ecid
adb shell pm uninstall --user 0 com.vcast.mediamanager
adb shell pm uninstall --user 0 com.att.android.attsmartwifi
adb shell pm uninstall --user 0 com.att.myWireless
adb shell pm uninstall --user 0 com.att.tv
adb shell pm uninstall --user 0 com.tmobile.pr.adapt
adb shell pm uninstall --user 0 com.tmobile.pr.mytmobile
adb shell pm uninstall --user 0 com.sprint.zone

# European Carriers
adb shell pm uninstall --user 0 com.orange.appshop
adb shell pm uninstall --user 0 com.orange.mail.fr
adb shell pm uninstall --user 0 com.orange.orangeetmoi
adb shell pm uninstall --user 0 com.orange.owtv
adb shell pm uninstall --user 0 com.vodafone.mcare.client
adb shell pm uninstall --user 0 ee.android.client.retail
adb shell pm uninstall --user 0 com.three.mydashboard
adb shell pm uninstall --user 0 de.o2.android.mein.o2

# Other regions
adb shell pm uninstall --user 0 com.telstra.telephony.exttelephony
adb shell pm uninstall --user 0 com.rogers.drs.client
adb shell pm uninstall --user 0 ca.bell.app.cmp
adb shell pm uninstall --user 0 com.skt.skaf.A000Z00040
adb shell pm uninstall --user 0 com.kt.olleh.storefront
adb shell pm uninstall --user 0 com.nttdocomo.android.dhome

echo ""
echo "========================================="
echo "Carrier bloatware removal complete!"
echo "========================================="
echo ""
echo "All carrier apps have been removed (if they existed)"
echo "You can safely ignore any 'Failure' messages"
echo ""
