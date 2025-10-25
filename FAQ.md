# Frequently Asked Questions

Common questions about debloating the Samsung Galaxy S25 Edge.

## Table of Contents
1. [General Questions](#general-questions)
2. [Safety & Warranty](#safety--warranty)
3. [Technical Questions](#technical-questions)
4. [Troubleshooting](#troubleshooting)
5. [After Debloating](#after-debloating)

---

## General Questions

### What is debloating?
Debloating is the process of removing pre-installed apps (bloatware) that you don't use or need. This can improve performance, battery life, and free up storage space.

### Do I need to root my phone?
**No.** All methods in this repository use ADB (Android Debug Bridge) which doesn't require root access. Your Knox security remains intact.

### Will this void my warranty?
**No.** Using ADB to uninstall user-level apps does not void your Samsung warranty. You're not unlocking the bootloader or rooting the device.

### Can I undo the debloat?
**Yes.** You can:
- Restore individual apps: `adb shell cmd package install-existing PACKAGE_NAME`
- Factory reset to restore everything
- See `RESTORE-GUIDE.md` for detailed instructions

### Which method should I use?
- **Beginners:** Shizuku + Canta (on-device with GUI)
- **Intermediate:** ADB from computer with conservative batch
- **Advanced:** Termux scripts or custom selections

### How much time does this take?
- **Setup:** 10-30 minutes (first time)
- **Debloating:** 5-15 minutes depending on method
- **Testing:** 15-30 minutes to verify everything works

---

## Safety & Warranty

### Will I brick my phone?
**Very unlikely** if you follow the guides. The scripts avoid critical system components. Even if something goes wrong, factory reset will fix it.

### What about Knox security?
Knox remains intact. ADB package removal doesn't trip Knox or affect Samsung Pay, Secure Folder, or banking apps.

### Can I still use Samsung Pay after debloating?
**Yes**, as long as you don't remove Samsung Pay packages. The conservative and moderate scripts preserve Samsung Pay by default.

### Will this work on carrier-locked phones?
**Yes.** Debloating works on all S25 Edge variants (unlocked, Verizon, AT&T, T-Mobile, international, etc.).

### Can I still get software updates?
**Yes.** OTA updates work normally. Note: Updates won't restore removed apps, but may add new bloatware.

### Does this affect Samsung Health/SmartThings/DEX?
Only if you specifically remove those packages. The conservative script preserves all Samsung features. Check package descriptions before removing.

---

## Technical Questions

### What's the difference between uninstall and disable?
- **Uninstall** (`pm uninstall --user 0`): Removes app for current user, can be restored
- **Disable** (`pm disable-user`): Hides app but easier to re-enable
- Both free up RAM but not storage space

### Why `--user 0`?
Android uses multi-user system. `--user 0` is the primary user. App is removed for you but remains in system partition.

### Will removed apps come back after factory reset?
**Yes.** Factory reset restores all pre-installed apps. You'll need to debloat again (or backup your debloat script).

### Do I need to do this after every update?
**No.** Once removed, apps stay removed through updates. But updates may add new bloatware to remove.

### Can I debloat before initial setup?
**No.** You need to enable Developer Options and USB Debugging first, which requires completing initial setup.

### What's Shizuku and why do I need it for on-device methods?
Shizuku provides ADB-like permissions to other apps without constant computer connection. One-time setup, then fully on-device.

### Why does Shizuku stop after reboot?
It's an Android security feature. Shizuku needs to be restarted after each reboot (quick process, see `ON-DEVICE-DEBLOAT.md`).

---

## Troubleshooting

### "Device unauthorized" error
1. Check your phone screen for ADB authorization prompt
2. Tap "Always allow from this computer"
3. Reconnect: `adb disconnect` then `adb connect`

### "Package not found" errors
**Normal.** Means the package doesn't exist on your device. Common with:
- Carrier apps from different carriers
- Region-specific apps
- Already removed apps

### Commands work but apps still appear
1. Reboot device
2. Clear launcher cache
3. Check if app is actually removed: Settings > Apps

### Shizuku won't start
1. Restart wireless debugging (Settings > Developer options)
2. Reconnect from computer
3. Clear Shizuku app data and setup again
4. Check Shizuku documentation

### Canta says "No permission"
1. Verify Shizuku is running (green checkmark in Shizuku app)
2. Grant Shizuku permission in Canta settings
3. Restart both apps

### Termux can't connect to ADB
1. Enable Wireless debugging (Settings > Developer options)
2. Check port: `adb connect localhost:5555` or try different port
3. Restart ADB: `adb kill-server && adb start-server`

### Phone feels slower after debloat
1. Reboot device
2. Clear cache partition (Recovery mode)
3. Give phone 10-15 minutes to settle after reboot
4. Check what you removed - may have removed optimization services

### Feature stopped working
1. Identify which feature broke
2. Check `package-reference.md` for related packages
3. Restore the package: `adb shell cmd package install-existing PACKAGE_NAME`
4. See `RESTORE-GUIDE.md` for common scenarios

---

## After Debloating

### What should I test immediately?
- [ ] Phone calls and SMS
- [ ] Camera
- [ ] WiFi and mobile data
- [ ] Samsung Keyboard (if using DEX)
- [ ] Samsung Pay (if you use it)
- [ ] Fingerprint/Face unlock
- [ ] Any Samsung features you regularly use

### How much battery improvement should I expect?
**Varies greatly:**
- Conservative: 5-10% improvement
- Moderate: 10-20% improvement
- Depends on what you removed and what you use

Results are best if you removed apps that were running in background.

### How much storage will I free up?
**Not much.** ADB removal only removes user data, not the actual APKs from system partition. Expect:
- 100-500MB of user data cleared
- More RAM available (apps not running)
- Main benefit is RAM/battery, not storage

### Should I debloat more aggressively?
**Only if:**
- Conservative debloat went well
- You tested everything you use
- You understand what you're removing
- You've documented what you removed

Start conservative, live with it for a week, then decide.

### Can I mix Samsung and Google apps?
**Yes.** For example:
- Google Calendar + Samsung Notes
- Samsung Messages + Google Photos
- Chrome + Samsung Pay

Remove what you don't use, keep what you prefer.

### What if a new app appears after an update?
1. Identify the package name: Settings > Apps > Show system apps
2. Search package name in this repository's files
3. Remove if it's bloatware, keep if it's a system update

### Do I need to re-debloat after factory reset?
**Yes.** Factory reset restores everything. But:
- Your ADB/Shizuku setup remains configured
- You can run the same scripts again
- Takes only a few minutes the second time

### Can I share my debloat configuration?
**Absolutely!** Consider contributing to `community-configs/` folder. See `CONTRIBUTING.md`.

---

## Specific Features

### Will Circle to Search still work?
**Yes**, if you keep either:
- `com.samsung.android.visionintelligence` (Samsung's version), OR
- `com.google.android.googlequicksearchbox` (Google's version)

Keep at least one.

### Will Live Translation work?
**Yes**, if you don't remove:
- `com.samsung.android.app.interpreter`
- `com.samsung.android.intelligence.voice` (CRITICAL - never remove)

### Will Galaxy AI features work?
**Yes**, if you keep:
- `com.google.android.apps.bard` (Gemini)
- `com.samsung.android.aicore` (Galaxy AI Core)
- `com.samsung.android.intelligence.voice`

### Will Bixby Routines (Modes & Routines) work?
**Yes**, if you keep:
- `com.samsung.android.app.routines`

Note: This is separate from Bixby voice assistant. You can remove Bixby voice but keep Routines.

### Will DEX work?
**Yes**, if you keep:
- `com.samsung.android.mdx` (DEX service)
- `com.samsung.android.honeyboard` (Samsung Keyboard - critical for DEX)

Removing Samsung Keyboard while using DEX can cause bootloop.

### Will Secure Folder work?
**Yes.** It's a Knox feature that's not affected by debloating unless you specifically remove Knox packages (which the scripts avoid).

---

## Best Practices

### What's the recommended approach?
1. **Read** the documentation (you're doing it!)
2. **Start conservative** - use `01-safe-user-apps.txt` or conservative batch
3. **Test everything** you use
4. **Document** what you removed
5. **Wait a few days** before removing more
6. **Gradually** remove more if needed

### Should I remove apps I might use later?
**No.** Only remove apps you're certain you don't need. Most can be reinstalled from Play Store if needed, but some (Samsung apps) require ADB to restore.

### How often should I debloat?
- **Once** after buying phone
- **After major updates** (check for new bloatware)
- **After factory reset** (if needed)

### Should I remove language packs?
**Only** languages you definitely don't use. Keep English (or your primary language) packages.

### Can I debloat someone else's phone?
**Yes, but:**
- Ask what apps they use
- Start with conservative only
- Test everything with them
- Show them how to restore
- Document what was removed

---

## Version-Specific Questions

### Does this work on OneUI 7?
Most packages are the same, but OneUI 8 has some new apps. Scripts are optimized for OneUI 8 but mostly compatible with OneUI 7.

### Will this work on future OneUI versions (8.1, 8.5, 9)?
**Probably.** Samsung's bloatware packages stay fairly consistent. New versions may add new bloatware to address.

### Does this work on S24/S23/older phones?
**Mostly.** Package names are similar across Galaxy devices. Some packages may be model-specific. Test carefully on older devices.

### What about foldables (Z Fold/Flip)?
**Yes**, but foldables have some unique apps. Review packages before removing anything labeled "fold" or "flip".

---

## Privacy & Performance

### Does debloating improve privacy?
**Yes**, if you remove:
- Google Location History
- Samsung/Google telemetry services
- Facebook services
- Carrier tracking apps

See `SUGGESTIONS.md` for privacy-focused removals.

### Does debloating improve gaming performance?
**Somewhat.** Removing Game Launcher and Game Optimizing Service may help (or hurt if you use those features). More RAM available helps.

### Will this stop ads?
**Not system-wide.** Removes some ad-related apps, but for full ad blocking use:
- Private DNS (dns.adguard.com)
- Ad-blocking browser
- Firewall app

### Should I also disable Google services?
**Be careful.** Many apps depend on Google Play Services. You can remove some Google apps but keep Play Services unless you know what you're doing.

---

## Community

### Where can I get help?
- Read documentation in this repository
- Check XDA Forums for Samsung debloat discussions
- GitHub Issues for this repository
- Samsung subreddit (r/GalaxyS25)

### Can I contribute my findings?
**Yes!** See `CONTRIBUTING.md` for guidelines. Contributions welcome:
- New package discoveries
- Bug reports
- Documentation improvements
- Community configurations

### Who maintains this repository?
Community-maintained based on research from:
- XDA Forums
- Reddit communities
- User testing and feedback
- Official Samsung documentation

---

## Quick Reference

### What NEVER to remove:
- `com.samsung.android.honeyboard` (if using DEX)
- `com.samsung.android.intelligence.voice`
- Anything with "knox" in the name
- `com.android.systemui`
- `com.sec.android.app.launcher` (without alternative)

### Safe to always remove:
- `com.facebook.*` (all Facebook packages)
- Carrier apps for carriers you don't have
- `com.samsung.android.tvplus`
- `com.samsung.android.game.*` (if you don't game)

### Restore if these break:
- Circle to Search: `com.samsung.android.visionintelligence`
- Samsung Pay: `com.samsung.android.spay` + `com.samsung.android.spayfw`
- DEX: `com.samsung.android.mdx`
- Live Translation: `com.samsung.android.app.interpreter`

---

**Still have questions?** Open an issue on GitHub or check the other documentation files.

**Last Updated:** October 2025 for OneUI 8
