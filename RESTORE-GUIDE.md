# Complete Restore Guide

How to restore apps after debloating your Samsung Galaxy S25 Edge.

## Table of Contents
1. [Restore Individual Apps](#restore-individual-apps)
2. [Restore Multiple Apps](#restore-multiple-apps)
3. [Full System Restore](#full-system-restore)
4. [Common Restore Scenarios](#common-restore-scenarios)
5. [Troubleshooting](#troubleshooting)

---

## Restore Individual Apps

### Basic Restore Command

```bash
adb shell cmd package install-existing PACKAGE_NAME
```

### Examples

**Restore Samsung Calendar:**
```bash
adb shell cmd package install-existing com.samsung.android.calendar
```

**Restore Bixby:**
```bash
adb shell cmd package install-existing com.samsung.android.bixby.agent
```

**Restore Samsung Internet:**
```bash
adb shell cmd package install-existing com.sec.android.app.sbrowser
```

---

## Restore Multiple Apps

### Chain Multiple Restores

Use `&&` to restore multiple packages at once:

```bash
adb shell cmd package install-existing com.samsung.android.calendar && adb shell cmd package install-existing com.samsung.android.app.notes && adb shell cmd package install-existing com.sec.android.app.sbrowser
```

### Create a Restore Script

**Windows (restore-apps.bat):**
```batch
@echo off
echo Restoring Samsung apps...
adb shell cmd package install-existing com.samsung.android.calendar
adb shell cmd package install-existing com.samsung.android.app.notes
adb shell cmd package install-existing com.sec.android.app.sbrowser
adb shell cmd package install-existing com.sec.android.app.shealth
echo Done!
pause
```

**Mac/Linux (restore-apps.sh):**
```bash
#!/bin/bash
echo "Restoring Samsung apps..."
adb shell cmd package install-existing com.samsung.android.calendar
adb shell cmd package install-existing com.samsung.android.app.notes
adb shell cmd package install-existing com.sec.android.app.sbrowser
adb shell cmd package install-existing com.sec.android.app.shealth
echo "Done!"
```

Make executable: `chmod +x restore-apps.sh`
Run: `./restore-apps.sh`

---

## Full System Restore

### Method 1: Factory Reset (Complete)

This restores **ALL** removed apps and resets phone to factory state.

**Steps:**
1. **Backup your data** (photos, contacts, etc.)
2. Settings > General management > Reset
3. Select "Factory data reset"
4. Confirm and wait for reset to complete
5. Restore your data from backup

**WARNING:** This erases all data, apps, and settings!

### Method 2: Software Recovery (via Smart Switch)

Use Samsung Smart Switch to restore to factory firmware:

1. Download Smart Switch on PC: https://www.samsung.com/us/support/smart-switch/
2. Connect S25 Edge to PC
3. Open Smart Switch
4. Select "Emergency software recovery and initialization"
5. Follow on-screen instructions

**WARNING:** This also erases all data!

### Method 3: Restore System Apps Only (Keep Data)

If you want to restore apps without losing data, restore them individually or use this batch restore for common system apps:

```bash
# Restore all Samsung core apps
adb shell cmd package install-existing com.samsung.android.calendar && \
adb shell cmd package install-existing com.samsung.android.app.notes && \
adb shell cmd package install-existing com.samsung.android.messaging && \
adb shell cmd package install-existing com.sec.android.app.sbrowser && \
adb shell cmd package install-existing com.samsung.android.bixby.agent && \
adb shell cmd package install-existing com.samsung.android.spay && \
adb shell cmd package install-existing com.samsung.android.game.gamehome
```

---

## Common Restore Scenarios

### Scenario 1: "I removed Bixby but need it back"

```bash
# Restore main Bixby components
adb shell cmd package install-existing com.samsung.android.bixby.agent
adb shell cmd package install-existing com.samsung.android.bixby.wakeup
adb shell cmd package install-existing com.samsung.android.bixbyvision.framework
adb shell cmd package install-existing com.samsung.android.visionintelligence
adb shell cmd package install-existing com.samsung.android.app.routines
```

### Scenario 2: "DEX stopped working"

```bash
# Restore Samsung DEX and Keyboard
adb shell cmd package install-existing com.samsung.android.mdx
adb shell cmd package install-existing com.samsung.android.honeyboard
```

### Scenario 3: "Samsung Pay doesn't work"

```bash
# Restore Samsung Pay components
adb shell cmd package install-existing com.samsung.android.spay
adb shell cmd package install-existing com.samsung.android.spayfw
adb shell cmd package install-existing com.samsung.android.samsungpass
adb shell cmd package install-existing com.samsung.android.samsungpassautofill
```

### Scenario 4: "Circle to Search is gone"

```bash
# Restore Vision Intelligence (Samsung's Circle to Search)
adb shell cmd package install-existing com.samsung.android.visionintelligence

# OR restore Google Search (Google's Circle to Search)
adb shell cmd package install-existing com.google.android.googlequicksearchbox
```

### Scenario 5: "Galaxy AI features stopped working"

```bash
# Restore Gemini and related services
adb shell cmd package install-existing com.google.android.apps.bard
adb shell cmd package install-existing com.google.android.googlequicksearchbox

# Note: Samsung AI Core may need to be installed from Galaxy Store
# Cannot be restored via ADB if never pre-installed
```

### Scenario 6: "Live Translation doesn't work"

```bash
# Restore Interpreter
adb shell cmd package install-existing com.samsung.android.app.interpreter

# WARNING: DO NOT uninstall com.samsung.android.intelligence.voice
# If you did, you need factory reset - critical system component
```

### Scenario 7: "I want Samsung apps back instead of Google"

```bash
# Restore Samsung apps
adb shell cmd package install-existing com.samsung.android.calendar
adb shell cmd package install-existing com.samsung.android.app.notes
adb shell cmd package install-existing com.samsung.android.messaging
adb shell cmd package install-existing com.sec.android.app.sbrowser
adb shell cmd package install-existing com.sec.android.app.shealth
adb shell cmd package install-existing com.sec.android.app.voicenote
```

### Scenario 8: "Game features are missing"

```bash
# Restore Game Launcher and tools
adb shell cmd package install-existing com.samsung.android.game.gamehome
adb shell cmd package install-existing com.samsung.android.game.gametools
adb shell cmd package install-existing com.samsung.android.game.gos
```

### Scenario 9: "AR features don't work"

```bash
# Restore AR Zone and components
adb shell cmd package install-existing com.samsung.android.arzone
adb shell cmd package install-existing com.samsung.android.aremoji
adb shell cmd package install-existing com.samsung.android.aremojieditor
adb shell cmd package install-existing com.samsung.android.ardrawing
adb shell cmd package install-existing com.google.ar.core
```

### Scenario 10: "Smart Switch / Easy Transfer doesn't work"

```bash
# Restore Smart Switch components
adb shell cmd package install-existing com.samsung.android.smartswitchassistant
adb shell cmd package install-existing com.sec.android.easyMover
adb shell cmd package install-existing com.sec.android.easyMover.Agent
```

---

## Restore from Play Store

Some apps can be reinstalled from Google Play Store instead of ADB:

**Can reinstall from Play Store:**
- YouTube
- YouTube Music
- Gmail
- Google Photos
- Google Docs
- Google Drive
- Netflix
- Facebook
- Spotify
- LinkedIn
- Microsoft Office apps

**Cannot reinstall from Play Store (need ADB or factory reset):**
- Samsung system apps (Calendar, Notes, etc.)
- Bixby
- Samsung DEX
- Samsung Pay
- Carrier apps
- Pre-installed bloatware

---

## Troubleshooting

### "Package not found" error

**Cause:** Package was never on your device, or package name is wrong.

**Solution:**
1. Check package name spelling
2. Verify package exists: `adb shell pm list packages | grep samsung`
3. Check if package is region/carrier specific

### Restore succeeds but app doesn't appear

**Cause:** App data was cleared, or app needs system restart.

**Solutions:**
1. Reboot phone: `adb reboot`
2. Clear cache partition (Recovery mode)
3. Wait 5-10 minutes for system to index apps
4. Check app drawer manually (may not show notification)

### "Installation failed" error

**Cause:** Package corrupted or system restriction.

**Solutions:**
1. Try again: `adb shell cmd package install-existing PACKAGE_NAME`
2. Reboot and try again
3. Clear system cache
4. Factory reset (last resort)

### App crashes after restore

**Cause:** Missing dependencies or corrupted app data.

**Solutions:**
1. Clear app data: Settings > Apps > [App] > Storage > Clear data
2. Restore related packages (check package-reference.md for dependencies)
3. Update app from Play Store (if available)
4. Factory reset (last resort)

### Multiple apps won't restore

**Cause:** System package manager issue.

**Solutions:**
1. Reboot phone first
2. Try restoring one at a time
3. Clear system cache partition
4. Check ADB connection: `adb devices`
5. Try on different computer

---

## Check What Was Removed

### List all uninstalled packages for user 0

```bash
adb shell pm list packages -u
```

### Find specific Samsung packages

```bash
adb shell pm list packages -u | grep samsung
```

### Find specific Google packages

```bash
adb shell pm list packages -u | grep google
```

### Check if specific package is installed

```bash
adb shell pm list packages | grep com.samsung.android.calendar
```

If it returns nothing, the package is removed.

---

## Prevent Future Removal

After restoring a package, if you want to prevent accidentally removing it again:

1. **Keep a list** of packages you want to keep
2. **Comment out** packages in debloat scripts
3. **Use selective debloat** - don't use batch commands blindly

---

## Best Practices

### Before Debloating (Prevention)
1. **Read** what each package does (see package-reference.md)
2. **Test** with conservative debloat first
3. **Document** what you remove
4. **Backup** phone data

### If Something Breaks
1. **Don't panic** - almost everything can be restored
2. **Identify** which feature broke
3. **Check dependencies** (package-reference.md)
4. **Restore systematically** (start with obvious packages)

### After Restoring
1. **Reboot** phone
2. **Test features** to ensure they work
3. **Update apps** from Play Store/Galaxy Store
4. **Clear cache** if apps behave strangely

---

## Emergency Recovery

### If Phone Won't Boot (Bootloop)

**Most common cause:** Removed Samsung Keyboard while using DEX

**Solution:**
1. Boot into Recovery Mode:
   - Power off phone
   - Hold Volume Up + Power
   - Release when Samsung logo appears
2. Select "Wipe cache partition"
3. Reboot
4. If still bootloop, factory reset from Recovery Mode

### If ADB Stops Working

**Solutions:**
1. Disable and re-enable USB debugging
2. Change USB mode (File Transfer / MTP)
3. Try different USB cable/port
4. Restart ADB server: `adb kill-server` then `adb start-server`
5. Reinstall ADB drivers (Windows)

### If You Can't Remember What You Removed

**Check system logs:**
```bash
adb shell pm list packages -u > all-packages.txt
```

Compare with a list from a fresh S25 Edge to see what's missing.

---

## Backup Your Debloat Configuration

Before debloating, save your current package list:

```bash
# Save current installed packages
adb shell pm list packages > installed-before.txt

# After debloating
adb shell pm list packages > installed-after.txt

# Compare to see what was removed
# Windows: fc installed-before.txt installed-after.txt
# Mac/Linux: diff installed-before.txt installed-after.txt
```

This way you know exactly what you removed and can restore it.

---

## Restore Priority Order

If multiple things are broken, restore in this order:

1. **Critical system components**
   - Samsung Keyboard (if using DEX)
   - SystemUI (if UI is broken)

2. **Core services**
   - Knox components
   - Samsung Intelligence Voice

3. **Feature-specific**
   - Bixby, Samsung Pay, DEX, etc.

4. **User apps**
   - Calendar, Notes, Browser, etc.

5. **Bloatware**
   - Only if you actually want them back

---

## Getting Help

If you're stuck restoring:

1. **Check package-reference.md** for package details
2. **Review the debloat scripts** to see what was removed
3. **Search XDA Forums** for similar issues
4. **Post in community forums** with:
   - What you removed
   - What's broken
   - Error messages
   - Phone model and OneUI version

---

## Conclusion

Remember: **Debloating is reversible!**

- Individual apps → Restore with ADB
- Everything → Factory reset
- Data is safe (only apps are removed)

Don't be afraid to experiment, but be smart about it:
- Start conservative
- Document changes
- Test before going further
- Keep this guide handy

---

**Made with ❤️ for the S25 Edge community**

Last updated: October 2025 for OneUI 8
