# Quick Start Guide - S25 Edge Debloat

Get started debloating your Samsung Galaxy S25 Edge in 5 minutes!

## Prerequisites (One-time setup)

### 1. Enable USB Debugging on S25 Edge

1. Go to **Settings** > **About phone**
2. Tap **Build number** 7 times (will enable Developer mode)
3. Go back to **Settings** > **Developer options**
4. Enable **USB debugging**
5. Connect USB cable to computer

### 2. Install ADB on Computer

**Windows:**
1. Download: https://developer.android.com/tools/releases/platform-tools
2. Extract to `C:\platform-tools`
3. Open Command Prompt as Administrator
4. Navigate: `cd C:\platform-tools`

**Mac:**
```bash
brew install android-platform-tools
```

**Linux:**
```bash
sudo apt-get install android-tools-adb
```

### 3. Verify Connection

```bash
adb devices
```

You should see your S25 Edge listed. If you see "unauthorized", check your phone for authorization prompt.

---

## Quick Debloat (3 Options)

### OPTION 1: Conservative (RECOMMENDED for first time)

**What it removes:** Facebook, carrier apps, obvious bloatware
**What it keeps:** All Samsung features, Bixby, Gemini
**Time:** ~2 minutes

```bash
# Copy and paste this entire block:
adb shell pm uninstall --user 0 com.facebook.katana && adb shell pm uninstall --user 0 com.facebook.system && adb shell pm uninstall --user 0 com.facebook.appmanager && adb shell pm uninstall --user 0 com.facebook.services && adb shell pm uninstall --user 0 com.microsoft.office.outlook && adb shell pm uninstall --user 0 com.amazon.mShop.android.shopping && adb shell pm uninstall --user 0 com.booking && adb shell pm uninstall --user 0 com.samsung.android.game.gamehome && adb shell pm uninstall --user 0 com.samsung.android.tvplus && adb shell pm uninstall --user 0 com.samsung.android.app.tips
```

### OPTION 2: Moderate (For regular users)

**What it removes:** Conservative + Samsung duplicates of Google apps
**What it keeps:** Core features, your choice of Bixby or Gemini
**Time:** ~5 minutes

```bash
# Copy and paste this entire block:
adb shell pm uninstall --user 0 com.facebook.katana && adb shell pm uninstall --user 0 com.facebook.system && adb shell pm uninstall --user 0 com.samsung.android.app.notes && adb shell pm uninstall --user 0 com.samsung.android.calendar && adb shell pm uninstall --user 0 com.sec.android.app.sbrowser && adb shell pm uninstall --user 0 com.samsung.android.messaging && adb shell pm uninstall --user 0 com.samsung.android.game.gamehome && adb shell pm uninstall --user 0 com.samsung.android.tvplus && adb shell pm uninstall --user 0 com.samsung.android.arzone && adb shell pm uninstall --user 0 com.google.android.apps.youtube.music && adb shell pm uninstall --user 0 com.google.android.videos
```

**Optional - Remove Bixby (if you use Gemini):**
```bash
adb shell pm uninstall --user 0 com.samsung.android.bixby.agent && adb shell pm uninstall --user 0 com.samsung.android.bixby.wakeup
```

### OPTION 3: Custom (Use our organized files)

Browse the category files and pick what you want:
- `01-safe-user-apps.txt` - Very safe user apps
- `02-bloatware-carriers.txt` - Carrier bloatware
- `03-safe-system-apps.txt` - System apps (more advanced)

Copy individual commands from these files.

---

## After Debloating

### Reboot your phone
```bash
adb reboot
```

### Check what was removed
```bash
adb shell pm list packages -u | grep -i samsung
```

---

## Common Questions

**Q: Will this void my warranty?**
A: No, you're not rooting or unlocking bootloader.

**Q: Can I restore apps?**
A: Yes! See [Restore Guide](#quick-restore) below.

**Q: Will I lose data?**
A: No, your personal data is safe. Only apps are removed.

**Q: What if something breaks?**
A: Factory reset restores everything. Or restore individual apps.

**Q: Is this permanent?**
A: Sort of. Factory reset brings everything back. Updates won't restore removed apps.

**Q: Do I need to do this again after updates?**
A: No, removed apps stay removed after updates.

---

## Quick Restore

### Restore single app
```bash
adb shell cmd package install-existing PACKAGE_NAME
```

**Example - Restore Samsung Calendar:**
```bash
adb shell cmd package install-existing com.samsung.android.calendar
```

### Common packages you might want to restore:

```bash
# Samsung Calendar
adb shell cmd package install-existing com.samsung.android.calendar

# Samsung Notes
adb shell cmd package install-existing com.samsung.android.app.notes

# Samsung Internet Browser
adb shell cmd package install-existing com.sec.android.app.sbrowser

# Samsung Health
adb shell cmd package install-existing com.sec.android.app.shealth

# Bixby (if you removed it)
adb shell cmd package install-existing com.samsung.android.bixby.agent

# Samsung DEX
adb shell cmd package install-existing com.samsung.android.mdx

# Game Launcher
adb shell cmd package install-existing com.samsung.android.game.gamehome
```

### Full restore
Just factory reset your phone (Settings > General management > Reset)

---

## Troubleshooting

### "device unauthorized"
- Check phone screen for ADB authorization prompt
- Tap "Always allow from this computer"

### "error: no devices/emulators found"
- Check USB cable connection
- Try different USB port
- Enable USB debugging again

### "Failure [not installed for 0]"
- Package doesn't exist on your phone (normal for carrier apps)
- Already removed
- Package name incorrect

### Phone feels laggy after debloat
- Reboot: `adb reboot`
- Clear cache: Settings > Apps > Show system apps > Clear cache for remaining apps

### Feature stopped working
- Check what you removed
- Restore the related package
- See `package-reference.md` for dependencies

---

## Next Steps

1. **Read the full README.md** for detailed information
2. **Check package-reference.md** to understand what each package does
3. **Join the community** - Share your debloat configuration!

---

## Recommended Setup for S25 Edge

Based on community feedback, here's the sweet spot:

**KEEP:**
- ✓ Gemini (for Galaxy AI)
- ✓ Samsung Keyboard (for DEX compatibility)
- ✓ Vision Intelligence (for Circle to Search)
- ✓ Samsung DEX (if you use it)
- ✓ Bixby Routines (very useful automation)

**REMOVE:**
- ✗ Facebook apps
- ✗ Carrier bloatware
- ✗ Bixby Agent (use Gemini instead)
- ✗ Samsung duplicates (Calendar, Notes, Browser if you use Google)
- ✗ AR Zone (unless you use AR features)
- ✗ Game Launcher (unless you're a mobile gamer)
- ✗ Samsung TV Plus

This gives you the best of both worlds: Samsung's unique features + Google's AI power, without the bloat.

---

## Safety First!

**NEVER REMOVE THESE (will break your phone):**
- com.samsung.android.honeyboard (Samsung Keyboard - if using DEX)
- com.android.systemui
- com.sec.android.app.launcher (unless you installed another launcher first)
- Anything with "knox" in the name
- com.samsung.android.intelligence.voice (breaks Galaxy AI)

**Read before you remove!** Check the package reference guide if you're unsure.

---

## Performance Tips

After debloating:
1. Clear cache partition (Recovery mode > Wipe cache partition)
2. Restart phone
3. Let phone settle for 10-15 minutes after boot
4. Enjoy your cleaner, faster S25 Edge!

**Expected improvements:**
- 200-500MB more RAM available
- 10-20% better battery life (depending on what you removed)
- Faster app launches
- Cleaner UI with fewer pre-installed apps

---

## Need Help?

- **Read the FAQ**: See README.md
- **Package questions**: Check package-reference.md
- **Restore guide**: See restore-guide.md
- **Report issues**: Open an issue on GitHub

---

**Made with ❤️ for the S25 Edge community**

Last updated: October 2025 for OneUI 8
