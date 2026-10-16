# On-Device Debloating Guide

Debloat your Samsung Galaxy **without a computer** using on-device tools.

## Table of Contents
1. [Method 1: Shizuku + Canta (Recommended)](#method-1-shizuku--canta-recommended)
2. [Method 2: Shizuku + App Manager](#method-2-shizuku--app-manager)
3. [Method 3: Termux + Wireless ADB](#method-3-termux--wireless-adb)
4. [Troubleshooting](#troubleshooting)

---

## Method 1: Shizuku + Canta (Recommended)

**Easiest on-device method** - User-friendly GUI with checkboxes.

### What You Need
- **Shizuku**: Provides ADB-like permissions to Canta. Starts on the phone itself through Wireless Debugging (Android 11+), no computer needed
- **Canta**: GUI app for uninstalling system apps (v3.0.0 or later for presets)
- **Wi-Fi**: Wireless Debugging only turns on while connected to Wi-Fi

### Which Shizuku? (Read This First)

The original [RikkaApps Shizuku](https://github.com/RikkaApps/Shizuku) has not been updated since v13.6.0 (May 2025). On Android 16 and 17 (OneUI 8, 8.5 and 9), use the maintained fork **[thedjchi/Shizuku](https://github.com/thedjchi/Shizuku/releases/latest)** instead. Canta itself points Android 16+ users to this fork.

- **v13.7.0 (July 2026)** added Android 17 support, which OneUI 9 needs
- It adds start on boot, a watchdog that restarts Shizuku if it stops, and TCP mode
- It uses the same package name as the original but a different signature, so **uninstall the original Shizuku first** if you have it
- The fork's author has paused maintenance after v13.7.0, so check its releases page before installing

### Step 1: Install Apps

1. **Install Shizuku**
   - Android 16 / 17 (OneUI 8, 8.5, 9): [thedjchi/Shizuku releases](https://github.com/thedjchi/Shizuku/releases/latest) (download the APK)
   - Android 15 and older: [shizuku.rikka.app/download](https://shizuku.rikka.app/download/) or the Play Store

2. **Install Canta**
   - [F-Droid](https://f-droid.org/en/packages/io.github.samolego.canta/), [IzzyOnDroid](https://apt.izzysoft.de/fdroid/index/apk/io.github.samolego.canta), [GitHub releases](https://github.com/samolego/Canta/releases/latest) or the [Play Store](https://play.google.com/store/apps/details?id=io.github.samolego.canta)

### Step 2: Start Shizuku (On the Phone)

1. Settings > About phone > Software information > Tap "Build number" 7 times
2. Settings > Developer options > Enable **Wireless debugging** (connect to Wi-Fi first)
3. Open Shizuku > **Start via Wireless debugging** > **Pairing**
4. In Developer options > Wireless debugging, tap **Pair device with pairing code**
5. Enter the code in the Shizuku notification
6. Back in Shizuku, tap **Start**. It should show "Shizuku is running"

**After a reboot:** the original Shizuku stops and has to be started again (repeat step 6). The thedjchi fork can start on boot instead (enable it in Shizuku settings).

**Alternative - start from a computer:** Shizuku > "Start via connected computer" > **View command**, then run that exact command over ADB. The command contains a path unique to your install (`adb shell .../libshizuku.so`). The old `start.sh` command from older guides no longer works.

**Alternative - root:** Shizuku can use root directly.

### Step 3: Use Canta to Debloat

1. Open Canta and grant Shizuku permission when prompted
2. You'll see a list of all installed apps

#### Using Our Package Presets

Canta imports presets from the **clipboard or pasted text**. There is no file picker, so you copy the preset rather than downloading it.

**Option A - Import a Preset (Recommended):**
1. On your phone, open the preset on GitHub and tap **Raw**:
   - [`conservative.json`](canta-lists/conservative.json) - Safest, recommended for beginners
   - [`moderate.json`](canta-lists/moderate.json) - Balanced approach
   - [`s26-ultra.json`](canta-lists/s26-ultra.json) / [`z-fold8.json`](canta-lists/z-fold8.json) - Device extras
   - [`remove-bixby.json`](canta-lists/remove-bixby.json) or [`remove-gemini.json`](canta-lists/remove-gemini.json) - Optional AI assistant removal
2. Select all of the JSON text and copy it
3. Canta > **Presets** > **Import preset** > **Clipboard** (or paste it into the **Text** tab)
4. Tap **Apply Preset**. Canta selects only the listed apps that exist on your phone
5. Review the selection and deselect anything you want to keep. **Applying a preset bypasses Canta's "unsafe app" guard**, so review before uninstalling
6. Uninstall the selected apps

**Option B - Manual Selection:**
1. Open this repository's files on your phone
2. Read through `01-safe-user-apps.txt`
3. Search for each package in Canta
4. Tap to select, then "Uninstall"

**Option C - Canta Web (computer, nothing to install):**
Canta 4.0 also runs in a Chromium-based browser over WebUSB: [samolego.github.io/Canta/app](https://samolego.github.io/Canta/app/). Connect the phone with a data USB cable, enable USB debugging, and import presets the same way. No Shizuku needed.

### Step 4: Reboot

After debloating:
```
Settings > System > Restart
```

---

## Method 2: Shizuku + App Manager

**More advanced** - Shows detailed app info and dependencies.

### Setup

1. **Setup Shizuku** (same as Method 1)

2. **Install App Manager**
   - F-Droid: https://f-droid.org/packages/io.github.muntashirakon.AppManager/
   - GitHub: https://github.com/MuntashirAkon/AppManager

3. **Configure App Manager**
   - Open App Manager
   - Grant Shizuku permission
   - Settings > Enable "Root/ADB mode" via Shizuku

### Using App Manager

1. Open App Manager
2. Filter > System apps
3. Find the app you want to remove
4. Tap app > App Info > Uninstall

**Batch Uninstall:**
1. App Manager > Select multiple apps
2. Batch operations > Uninstall
3. Confirm

**Advantages over Canta:**
- More detailed app information
- Shows app dependencies
- Can backup APKs before removal
- Export installed app lists

---

## Method 3: Termux + Wireless ADB

**For power users** - Run debloat scripts directly on device.

### Setup

1. **Enable Wireless ADB** (Settings > Developer options)

2. **Install Termux**
   - F-Droid: https://f-droid.org/en/packages/com.termux/
   - **NOT from Play Store** (outdated version)

3. **Install ADB in Termux**
```bash
pkg update
pkg install android-tools
```

### Running Debloat Scripts

#### Download Scripts to Phone
```bash
# In Termux
cd ~/storage/downloads
git clone https://github.com/itxjobe/samsungdebloat
cd samsungdebloat/termux-scripts
```

#### Connect to Local ADB
```bash
# Enable wireless debugging in Settings first
# Note the port number (usually 5555)

adb connect localhost:5555
```

#### Run Debloat Script
```bash
# Conservative debloat
bash conservative-debloat.sh

# Moderate debloat
bash moderate-debloat.sh

# Carrier bloatware only
bash debloat-carriers.sh

# Device extras (run after conservative or moderate)
bash s26-ultra-debloat.sh    # Galaxy S26 Ultra, OneUI 8.5
bash z-fold8-debloat.sh      # Galaxy Z Fold 8, OneUI 9
```

#### Manual Commands
You can also run individual commands:
```bash
adb shell pm uninstall --user 0 com.facebook.katana
adb shell pm uninstall --user 0 com.samsung.android.tvplus
```

---

## Comparison of Methods

| Method | Difficulty | GUI | Batch Support | Requires Computer |
|--------|-----------|-----|---------------|-------------------|
| Shizuku + Canta | Easy | ✅ Yes | ✅ Yes | No (Android 11+) |
| Shizuku + App Manager | Medium | ✅ Yes | ✅ Yes | No (Android 11+) |
| Canta Web (WebUSB) | Easy | ✅ Yes | ✅ Yes | Yes (Chromium browser + USB cable) |
| Termux + ADB | Hard | ❌ No | ✅ Yes | One-time setup |

---

## Keeping Shizuku Running

### Problem
The original Shizuku stops after every reboot.

### Solutions

**Option 1: Start on Boot (thedjchi fork, recommended)**
The [thedjchi fork](https://github.com/thedjchi/Shizuku) can start itself on boot in Wireless Debugging mode. It waits for Wi-Fi, and its watchdog restarts Shizuku if it stops. Enable it in Shizuku settings.

**Option 2: Restart on the Phone**
1. Connect to Wi-Fi, then Settings > Developer options > Wireless debugging > ON
2. Open Shizuku > Start

**Option 3: Computer Restart**
Open Shizuku > "Start via connected computer" > **View command** and run the command it shows. It is specific to your install (`adb shell .../libshizuku.so`). The old `start.sh` command no longer works.

**Option 4: Root (Permanent)**
If rooted, Shizuku uses root and persists across reboots automatically.

**Option 5: Tasker Automation (Advanced)**
The thedjchi fork exposes start/stop intents for Tasker, MacroDroid and Automate. They require an auth token, shown under "View intents" in the app.

---

## Debloat Recommendations by Method

### For Shizuku + Canta Users
**Recommended workflow:**
1. Start with `canta-lists/conservative.json`
2. Copy it, import it in Canta (Presets > Import preset > Clipboard), then Apply Preset
3. Deselect any packages you want to keep
4. Uninstall the selected apps
5. Reboot and test
6. If satisfied, import `canta-lists/moderate.json` later

### For App Manager Users
**Recommended workflow:**
1. Browse System apps
2. Reference `package-reference.md` on phone
3. Manually select apps to remove
4. Export your selection as backup
5. Batch uninstall

### For Termux Users
**Recommended workflow:**
1. Review `01-safe-user-apps.txt`
2. Run `termux-scripts/conservative-debloat.sh`
3. Reboot
4. If satisfied, run additional scripts

---

## Advantages of On-Device Debloating

✅ **No computer needed** (Shizuku starts through Wireless Debugging on Android 11+)
✅ **Visual app selection** (with Canta/App Manager)
✅ **See what you're removing** before confirming
✅ **Portable** - debloat anywhere
✅ **Use phone's screen** instead of tiny terminal

## Disadvantages

❌ **Wi-Fi required** to start Shizuku through Wireless Debugging
❌ **Original Shizuku resets** after reboot (the thedjchi fork can start on boot)
❌ **Slightly slower** than batch ADB from computer

---

## Safety Tips

1. **Always review** packages before removal, even with our lists
2. **Don't remove** packages you don't recognize - check `package-reference.md` first
3. **Start conservative** - you can always remove more later
4. **Test after each batch** - make sure everything still works
5. **Keep this guide** on your phone for reference

---

## Restore on Device

### Using Canta
1. Open Canta > **Uninstalled apps** tab
2. Select the app(s) to bring back
3. Tap **ReInstall**

### Using App Manager
1. App Manager > Search for package
2. Reinstall option (if available)

### Using Termux
```bash
adb shell cmd package install-existing com.package.name
```

### If All Else Fails
Factory reset restores everything: Settings > General management > Reset

---

## Troubleshooting

### Shizuku won't start
**Solution:**
- On Android 16 or 17 (OneUI 8, 8.5, 9), make sure you are using the [thedjchi fork](https://github.com/thedjchi/Shizuku/releases/latest). The original v13.6.0 predates Android 17
- Connect to Wi-Fi, then turn Wireless debugging off and on
- Pair again (Shizuku > Start via Wireless debugging > Pairing)
- Clear Shizuku data and start over

### Canta says "No permission"
**Solution:**
- Make sure Shizuku is running (check Shizuku app)
- Restart Canta
- Grant Shizuku permission again

### Termux can't connect to ADB
**Solution:**
- Enable Wireless debugging in Settings
- Try: `adb connect localhost:5555`
- Check if port is different (Settings > Wireless debugging)
- Restart ADB server: `adb kill-server && adb start-server`

### App removed but still shows up
**Solution:**
- Reboot device
- App data is cleared but icon may remain briefly
- Check Settings > Apps - it should be gone

### Removed wrong package
**Solution:**
- Use restore command immediately
- Or factory reset if system unstable
- See `RESTORE-GUIDE.md` for specific packages

---

## Recommended On-Device Setup

For most users, we recommend:

**Best Method:** Shizuku + Canta
**Best Starting Point:** Conservative debloat list
**Best Practice:** Review each package before removal

This gives you:
- Easy visual interface
- Safe, tested removals
- Quick restore if needed
- No constant computer connection

---

## Additional Resources

**Package Information:**
- See `package-reference.md` for what each package does

**Restore Help:**
- See `RESTORE-GUIDE.md` for restoration procedures

**Quick Start:**
- See `QUICKSTART.md` for ADB method (from computer)

---

## Community Recommendations

**From users who debloated on-device:**

1. "Keep `package-reference.md` open in Samsung Internet while using Canta"
2. "Do conservative first, live with it a week, then do more if needed"
3. "Take screenshots of your selections in case you need to restore"
4. "Shizuku + Canta is 100x easier than ADB from computer"
5. "Don't remove Samsung Keyboard if you use DEX!"

---

**Last Updated:** October 2026 for OneUI 8, 8.5 and 9
