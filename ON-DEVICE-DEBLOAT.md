# On-Device Debloating Guide

Debloat your Samsung Galaxy S25 Edge **without a computer** using on-device tools.

## Table of Contents
1. [Method 1: Shizuku + Canta (Recommended)](#method-1-shizuku--canta-recommended)
2. [Method 2: Shizuku + App Manager](#method-2-shizuku--app-manager)
3. [Method 3: Termux + Wireless ADB](#method-3-termux--wireless-adb)
4. [Troubleshooting](#troubleshooting)

---

## Method 1: Shizuku + Canta (Recommended)

**Easiest on-device method** - User-friendly GUI with checkboxes.

### What You Need
- **Shizuku**: Provides ADB-like permissions (one-time computer setup)
- **Canta**: GUI app for uninstalling system apps
- **One-time**: Computer with ADB for initial Shizuku activation

### Step 1: Setup Shizuku (One-Time with Computer)

#### Enable Wireless ADB on Phone
1. Settings > About phone > Tap "Build number" 7 times
2. Settings > Developer options > Enable "Wireless debugging"
3. Settings > Developer options > Wireless debugging > Pair device
4. Note the pairing code and port

#### Pair from Computer
```bash
# Replace IP and port with values from phone
adb pair 192.168.1.XXX:XXXXX
# Enter pairing code when prompted

# Connect
adb connect 192.168.1.XXX:XXXXX

# Start Shizuku (this enables it to work)
adb shell sh /storage/emulated/0/Android/data/moe.shizuku.privileged.api/start.sh
```

**Alternative (if you have root):**
- No computer needed
- Shizuku can use root directly

### Step 2: Install Apps

1. **Install Shizuku**
   - Download: https://shizuku.rikka.app/download/
   - Or from Play Store (search "Shizuku")

2. **Install Canta**
   - Download: https://github.com/samolego/Canta
   - Or from F-Droid / IzzyOnDroid repo

### Step 3: Start Shizuku Service

1. Open Shizuku app
2. Tap "Start" button
3. Grant necessary permissions
4. Should show "Shizuku is running"

**Note:** Shizuku stops after reboot. You'll need to restart it using wireless ADB or root.

### Step 4: Use Canta to Debloat

1. Open Canta app
2. Grant Shizuku permission when prompted
3. You'll see a list of all installed apps

#### Using Our Package Lists

**Option A - Manual Selection:**
1. Open this repository's files on your phone
2. Read through `01-safe-user-apps.txt`
3. Search for each package in Canta
4. Tap to select, then "Uninstall"

**Option B - Import Package List:**
1. Download the `canta-lists/` folder from this repo
2. Canta > Menu > Import
3. Select the list file (conservative, moderate, etc.)
4. Review selections
5. Tap "Uninstall Selected"

### Step 5: Reboot

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

# Custom - run specific categories
bash debloat-bloatware.sh
bash debloat-carriers.sh
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
| Shizuku + Canta | Easy | ✅ Yes | ✅ Yes | One-time setup |
| Shizuku + App Manager | Medium | ✅ Yes | ✅ Yes | One-time setup |
| Termux + ADB | Hard | ❌ No | ✅ Yes | One-time setup |

---

## Keeping Shizuku Running

### Problem
Shizuku service stops after device reboot.

### Solutions

**Option 1: Wireless ADB Restart (No Computer)**
Some devices allow wireless ADB to persist after reboot:
1. Settings > Developer options > Wireless debugging > ON
2. Open Shizuku > Start

**Option 2: Computer Restart**
```bash
adb connect PHONE_IP:5555
adb shell sh /storage/emulated/0/Android/data/moe.shizuku.privileged.api/start.sh
```

**Option 3: Root (Permanent)**
If rooted, Shizuku uses root and persists across reboots automatically.

**Option 4: Tasker Automation (Advanced)**
Use Tasker to auto-start Shizuku on boot (requires wireless ADB to persist).

---

## Debloat Recommendations by Method

### For Shizuku + Canta Users
**Recommended workflow:**
1. Start with `canta-lists/conservative.txt`
2. Import and review in Canta
3. Uninstall batch
4. Reboot and test
5. If satisfied, import `canta-lists/moderate.txt` later

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

✅ **No computer needed** (after initial Shizuku setup)
✅ **Visual app selection** (with Canta/App Manager)
✅ **See what you're removing** before confirming
✅ **Portable** - debloat anywhere
✅ **Use phone's screen** instead of tiny terminal

## Disadvantages

❌ **Initial setup** still needs computer (for Shizuku)
❌ **Shizuku resets** after reboot (need to restart)
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
1. Open Canta
2. Menu > Restore
3. Select app to restore
4. Tap "Restore"

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
- Restart wireless debugging
- Reconnect ADB from computer
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

For most S25 Edge users, we recommend:

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

**Last Updated:** October 2025 for OneUI 8
