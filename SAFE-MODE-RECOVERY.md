# Safe Mode & Recovery Guide

Emergency procedures if something goes wrong during or after debloating.

## Safe Mode

### What is Safe Mode?

Safe Mode boots your phone with only essential system apps. Third-party and some system apps are disabled.

**Use when:**
- Phone is bootlooping
- Can't access settings
- App causing crashes
- Need to troubleshoot

### Boot into Safe Mode

**Method 1: From Power Menu**
1. Press and hold Power button
2. Tap and hold "Power off"
3. Tap "Safe mode"
4. Phone reboots into Safe Mode

**Method 2: During Boot**
1. Power off phone
2. Press Power to turn on
3. When Samsung logo appears, press and hold Volume Down
4. Keep holding until boot completes
5. "Safe mode" appears in corner

### Exit Safe Mode

Simply restart phone normally:
1. Press and hold Power
2. Tap "Restart"

---

## Recovery Mode

### Boot into Recovery Mode

1. Power off phone completely
2. Press and hold: **Volume Up + Power**
3. Release when Samsung logo appears
4. Use Volume keys to navigate, Power to select

### Recovery Options

**Wipe Cache Partition:**
- Clears system cache
- Doesn't delete data
- Fixes many issues

**Factory Reset:**
- Restores all apps (including removed bloatware)
- **DELETES ALL DATA**
- Last resort

---

## Common Problems & Solutions

### Bootloop After Debloat

**Symptoms:** Phone keeps restarting

**Most Common Cause:** Removed Samsung Keyboard while using DEX

**Solution 1: Safe Mode**
1. Boot into Safe Mode
2. Connect to ADB
3. Restore Samsung Keyboard:
   ```bash
   adb shell cmd package install-existing com.samsung.android.honeyboard
   ```
4. Reboot normally

**Solution 2: Recovery Mode**
1. Boot into Recovery
2. Wipe cache partition
3. Reboot

**Solution 3: Factory Reset**
Last resort - restores everything.

### Phone Won't Boot

**Solution:**
1. Boot into Recovery Mode
2. Wipe cache partition
3. If still broken, factory reset

### ADB Not Working

**When phone is accessible:**
1. Settings > Developer options
2. Disable and re-enable USB debugging
3. Revoke USB debugging authorizations
4. Reconnect

**When phone isn't accessible:**
1. Boot Safe Mode
2. Try ADB connection
3. Restore problematic package

### App Crashes Constantly

**Solution:**
1. Identify which package was removed
2. Check `package-reference.md` for dependencies
3. Restore the package:
   ```bash
   adb shell cmd package install-existing PACKAGE_NAME
   ```

### Feature Stopped Working

**Examples:**
- Samsung Pay won't open
- Camera missing modes
- DEX won't start

**Solution:**
See RESTORE-GUIDE.md for specific scenarios and packages to restore.

---

## Factory Reset Procedures

### Before Factory Reset

**Backup:**
1. Photos (Google Photos, Samsung Cloud)
2. Contacts (synced to Google/Samsung account)
3. App data (where possible)
4. Important files to computer

**Note what you removed:**
Save your debloat script or package list to restore after reset.

### Perform Factory Reset

**Method 1: Settings**
1. Settings > General management
2. Reset
3. Factory data reset
4. Follow prompts

**Method 2: Recovery Mode**
1. Boot into Recovery (Volume Up + Power)
2. Select "Wipe data/factory reset"
3. Confirm

**Method 3: Find My Mobile**
Samsung's remote wipe (if enabled).

### After Factory Reset

1. Complete setup wizard
2. Skip restoring apps initially
3. Debloat again (quicker second time)
4. Then restore your data/apps

---

## Emergency Contacts & Resources

### Samsung Support

- US: 1-800-SAMSUNG
- Support: https://www.samsung.com/us/support/

### Online Resources

- XDA Forums: https://forum.xda-developers.com/
- Reddit r/GalaxyS25: https://www.reddit.com/r/GalaxyS25/
- This repository's issues: https://github.com/itxjobe/samsungdebloat/issues

---

## Prevention

### Before Debloating

1. Read package descriptions
2. Start conservative
3. Test after each category
4. Document what you remove

### Critical Packages to NEVER Remove

- `com.samsung.android.honeyboard` (if using DEX)
- `com.android.systemui`
- `com.sec.android.app.launcher` (without alternative)
- Anything with "knox" in name
- `com.samsung.android.intelligence.voice`

See FAQ.md for complete list.

---

## Recovery Checklist

**If phone is broken:**

1. [ ] Can you boot into Safe Mode?
   - Yes → Restore packages via ADB
   - No → Try Recovery Mode

2. [ ] Can you boot into Recovery Mode?
   - Yes → Wipe cache partition
   - Still broken → Factory reset

3. [ ] Did factory reset fix it?
   - Yes → Debloat more carefully next time
   - No → Contact Samsung support (hardware issue)

---

**Last Updated:** October 2025
