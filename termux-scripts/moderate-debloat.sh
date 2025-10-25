#!/data/data/com.termux/files/usr/bin/bash
# Moderate Debloat Script for Samsung Galaxy S25 Edge
# Conservative + Samsung duplicates + some Google apps
# Run in Termux with: bash moderate-debloat.sh

echo "========================================="
echo "Moderate Debloat for S25 Edge"
echo "========================================="
echo ""
echo "This will remove:"
echo "- Everything from conservative debloat"
echo "- Samsung apps (if you use Google alternatives)"
echo "- Some Google apps (YouTube Music, Play Movies)"
echo "- AR Zone and related features"
echo ""
echo "WARNING: This removes more apps than conservative"
echo "Make sure you ran conservative-debloat.sh first!"
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
echo "Starting moderate debloat..."
echo ""

# Run conservative first
echo "Running conservative debloat..."
bash conservative-debloat.sh

# Samsung apps with Google alternatives
echo ""
echo "Removing Samsung apps with Google alternatives..."
adb shell pm uninstall --user 0 com.samsung.android.app.notes
adb shell pm uninstall --user 0 com.samsung.android.calendar
adb shell pm uninstall --user 0 com.sec.android.app.sbrowser
adb shell pm uninstall --user 0 com.samsung.android.messaging
adb shell pm uninstall --user 0 com.sec.android.app.popupcalculator
adb shell pm uninstall --user 0 com.sec.android.app.voicenote

# Samsung AR features
echo ""
echo "Removing Samsung AR features..."
adb shell pm uninstall --user 0 com.samsung.android.arzone
adb shell pm uninstall --user 0 com.samsung.android.aremoji
adb shell pm uninstall --user 0 com.samsung.android.aremojieditor
adb shell pm uninstall --user 0 com.samsung.android.ardrawing

# Samsung extras
echo ""
echo "Removing Samsung extras..."
adb shell pm uninstall --user 0 com.samsung.android.app.spage
adb shell pm uninstall --user 0 com.samsung.storyservice

# Google bloatware
echo ""
echo "Removing Google bloatware..."
adb shell pm uninstall --user 0 com.google.android.apps.youtube.music
adb shell pm uninstall --user 0 com.google.android.videos
adb shell pm uninstall --user 0 com.google.android.apps.tachyon

echo ""
echo "========================================="
echo "Moderate debloat complete!"
echo "========================================="
echo ""
echo "Next steps:"
echo "1. Reboot your device"
echo "2. Test these features:"
echo "   - Phone calls and SMS"
echo "   - Camera"
echo "   - Your preferred calendar/notes app"
echo "3. If everything works, you're done!"
echo ""
echo "To reboot: adb reboot"
echo ""
