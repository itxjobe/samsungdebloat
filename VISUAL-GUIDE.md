# Visual Installation Guide

Step-by-step visual guide for debloating Samsung Galaxy S25 Edge. Screenshots and detailed instructions for each method.

**Note:** Screenshots will be added in future updates. Text descriptions provided for now.

---

## Table of Contents
1. [Enable Developer Options](#enable-developer-options)
2. [Enable USB Debugging](#enable-usb-debugging)
3. [Enable Wireless Debugging](#enable-wireless-debugging)
4. [Install ADB on Computer](#install-adb-on-computer)
5. [Setup Shizuku](#setup-shizuku)
6. [Using Canta](#using-canta)
7. [Using Termux](#using-termux)

---

## Enable Developer Options

### Step 1: Open Settings
1. Swipe down from top of screen
2. Tap the gear icon (⚙️) to open Settings
3. Or open app drawer and tap "Settings"

### Step 2: Navigate to About Phone
1. Scroll down to "About phone"
2. Tap "About phone"

### Step 3: Find Software Information
1. Tap "Software information"
2. Look for "Build number"

### Step 4: Enable Developer Mode
1. Tap "Build number" **7 times rapidly**
2. You'll see a message: "Developer mode has been enabled"
3. May need to enter PIN/password

**What it looks like:**
```
Settings
└── About phone
    └── Software information
        └── Build number  <-- Tap 7 times
```

**Visual cues:**
- First few taps: No response
- After 3 taps: "You are now 4 steps away from being a developer"
- After 7 taps: "Developer mode has been enabled"

---

## Enable USB Debugging

### Step 1: Go Back to Settings
1. Press back button to return to main Settings

### Step 2: Find Developer Options
1. Scroll down to "Developer options"
   - Should appear near the bottom, above "About phone"
2. Tap "Developer options"

### Step 3: Enable USB Debugging
1. Toggle "Developer options" ON at the top (if not already)
2. Scroll down to "USB debugging"
3. Toggle "USB debugging" ON
4. Confirm warning dialog: "Allow USB debugging?"
5. Tap "OK"

**What the screen shows:**
```
Developer options
├── Developer options [Toggle ON]
├── ...
└── Debugging section
    └── USB debugging [Toggle ON]
```

**Warning dialog:**
```
Allow USB debugging?
USB debugging is intended for development use.
Use it to copy data between your computer and
your device...

[ Cancel ] [ OK ]
```

---

## Enable Wireless Debugging

### Required for: Shizuku setup, Termux method

### Step 1: In Developer Options
1. Scroll down in Developer options
2. Find "Wireless debugging"
3. Toggle ON

### Step 2: Pair Device (First Time)
1. Tap "Wireless debugging"
2. Tap "Pair device with pairing code"
3. You'll see:
   - WiFi pairing code (6 digits)
   - IP address and port

**Example screen:**
```
Pair device with pairing code

Wi-Fi pairing code: 123456
IP address & Port: 192.168.1.100:45678

This code expires in 5 minutes
```

### Step 3: Note the Information
Write down or screenshot:
- Pairing code: `123456`
- IP address: `192.168.1.100`
- Port: `45678`

You'll need these for ADB pairing from computer.

---

## Install ADB on Computer

### Windows

#### Method 1: Manual Installation
1. **Download Platform Tools**
   - Visit: https://developer.android.com/tools/releases/platform-tools
   - Click "Download SDK Platform-Tools for Windows"
   - Save the ZIP file

2. **Extract Files**
   - Right-click downloaded ZIP
   - Choose "Extract All"
   - Extract to: `C:\platform-tools`

3. **Add to PATH (Optional but Recommended)**
   - Open Start Menu
   - Search "environment variables"
   - Click "Edit system environment variables"
   - Click "Environment Variables" button
   - Under "System variables", find "Path"
   - Click "Edit"
   - Click "New"
   - Add: `C:\platform-tools`
   - Click "OK" on all dialogs

4. **Verify Installation**
   - Open Command Prompt (Win+R, type `cmd`)
   - Type: `adb version`
   - Should show ADB version info

**Folder structure after extraction:**
```
C:\platform-tools\
├── adb.exe
├── fastboot.exe
└── ... (other files)
```

#### Method 2: Chocolatey Package Manager
```cmd
choco install adb
```

### macOS

#### Method 1: Homebrew (Recommended)
```bash
brew install android-platform-tools
```

#### Method 2: Manual Installation
1. Download: https://developer.android.com/tools/releases/platform-tools
2. Extract to desired location
3. Add to PATH in `~/.zshrc` or `~/.bash_profile`:
   ```bash
   export PATH="$PATH:/path/to/platform-tools"
   ```

### Linux

#### Ubuntu/Debian
```bash
sudo apt-get update
sudo apt-get install android-tools-adb android-tools-fastboot
```

#### Fedora
```bash
sudo dnf install android-tools
```

#### Arch Linux
```bash
sudo pacman -S android-tools
```

### Verify Installation (All Platforms)

Open terminal/command prompt:
```bash
adb version
```

Expected output:
```
Android Debug Bridge version 1.0.41
Version 34.0.5-11019...
```

---

## Setup Shizuku

### Prerequisites
- Wireless debugging enabled
- Computer with ADB
- Phone and computer on same WiFi network

### Step 1: Install Shizuku App
1. **Download Shizuku**
   - Official site: https://shizuku.rikka.app/download/
   - Or Google Play Store
   - Or F-Droid

2. **Install APK**
   - Tap downloaded file
   - Allow "Install unknown apps" if prompted
   - Tap "Install"

### Step 2: Pair Phone with Computer

**On Phone:**
1. Settings > Developer options > Wireless debugging
2. Tap "Pair device with pairing code"
3. Note the code and port number

**On Computer:**
```bash
# Replace with your phone's info
adb pair 192.168.1.100:45678

# Enter the 6-digit pairing code when prompted
```

**Success message:**
```
Successfully paired to 192.168.1.100:45678
```

### Step 3: Connect ADB

**On Phone:**
1. Still in Wireless debugging screen
2. Look at top section for "IP address & Port"
3. Note the address (different from pairing port)

**Example:**
```
Wireless debugging
IP address & Port
192.168.1.100:5555
```

**On Computer:**
```bash
adb connect 192.168.1.100:5555
```

**Success message:**
```
connected to 192.168.1.100:5555
```

### Step 4: Start Shizuku Service

**On Phone:**
1. Open Shizuku app
2. Tap "Start" button
3. Grant any permissions requested

**What you should see:**
```
Shizuku
[✓] Shizuku is running
Version: X.X.X
Started by: Wireless debugging
```

**Green checkmark** means Shizuku is working.

### Step 5: Keep Shizuku Running

**Important notes:**
- Shizuku stops after reboot
- To restart: Re-enable wireless debugging, reconnect ADB, tap "Start" in Shizuku
- Alternative: Use root to auto-start (if phone is rooted)

---

## Using Canta

### Prerequisites
- Shizuku installed and running (green checkmark)

### Step 1: Install Canta
1. **Download Canta**
   - GitHub: https://github.com/samolego/Canta
   - F-Droid / IzzyOnDroid repository

2. **Install APK**
   - Tap downloaded file
   - Install

### Step 2: Launch Canta
1. Open Canta app
2. You'll see a list of installed apps
3. Look for checkmark next to "Shizuku" in top bar

### Step 3: Grant Shizuku Permission
1. First launch: "Canta wants to use Shizuku"
2. Tap "Allow" or "Grant permission"
3. Canta can now uninstall system apps

**Permission dialog:**
```
Shizuku
Canta wants to use Shizuku to access
system-level functions

[ Deny ] [ Allow ]
```

### Step 4: Import Package List (if supported)

**If Canta has import feature:**
1. Download package list from this repository to phone
   - Example: `canta-lists/conservative.txt`
2. Canta > Menu (⋮) > Import
3. Select downloaded file
4. Review selected packages

**If no import feature:**
Continue to manual selection below.

### Step 5: Manual Package Selection

1. **Search for Package**
   - Tap search icon (🔍)
   - Type package name (e.g., `facebook`)
   - Or scroll through list

2. **Filter Options**
   - Toggle to show "System apps"
   - Look for apps to remove

3. **Select Package**
   - Tap on package name
   - Tap "Uninstall" button
   - Confirm

**What you'll see:**
```
com.facebook.katana
Facebook

[System app badge]

[ Uninstall ] [ Open ]
```

### Step 6: Batch Uninstall

1. **Select Multiple Apps**
   - Long-press first app
   - Tap others to select
   - Or use "Select all" if available

2. **Uninstall Selected**
   - Menu (⋮) > Uninstall selected
   - Review list
   - Confirm

3. **Wait for Completion**
   - Apps removed one by one
   - May take a few minutes

### Step 7: Reboot Phone
Settings > System > Restart

---

## Using Termux

### Step 1: Install Termux
1. **Download Termux**
   - **F-Droid ONLY:** https://f-droid.org/en/packages/com.termux/
   - **NOT from Google Play** (outdated)

2. **Install APK**
   - Tap downloaded file
   - Install

### Step 2: Setup Termux

**On first launch:**
1. Open Termux app
2. Wait for initial setup to complete
3. You'll see a command prompt: `$`

**Update packages:**
```bash
pkg update && pkg upgrade
```
- Type `y` and press Enter when prompted

### Step 3: Install ADB Tools
```bash
pkg install android-tools git
```
- Type `y` to confirm

**Verification:**
```bash
adb version
```

### Step 4: Enable Storage Access
```bash
termux-setup-storage
```
- Tap "Allow" when prompted
- This lets Termux access Downloads folder

### Step 5: Download Scripts

**Option A: Clone Repository**
```bash
cd ~/storage/downloads
git clone https://github.com/itxjobe/samsungdebloat
cd samsungdebloat/termux-scripts
```

**Option B: Download Manually**
1. Download scripts to phone's Downloads folder
2. In Termux:
```bash
cd ~/storage/downloads
```

### Step 6: Enable Wireless ADB

**On Phone:**
1. Settings > Developer options
2. Enable "Wireless debugging"

### Step 7: Connect to ADB
```bash
adb connect localhost:5555
```

**If port 5555 doesn't work:**
Check Developer options > Wireless debugging for the correct port.

### Step 8: Run Debloat Script
```bash
bash conservative-debloat.sh
```

**What you'll see:**
```
=========================================
Conservative Debloat for S25 Edge
=========================================

This will remove:
- Facebook apps
- Microsoft Office bloatware
...

Press Ctrl+C to cancel, or Enter to continue...
```

Press Enter to proceed.

### Step 9: Monitor Progress
Script will show each package being removed:
```
Removing third-party bloatware...
Success
Success
Failure [not installed for 0]  <-- Normal for non-existent packages
...
```

### Step 10: Reboot
```bash
adb reboot
```

---

## Troubleshooting Visual Issues

### Can't Find Developer Options
**Problem:** Don't see "Developer options" in Settings

**Solution:**
1. Make sure you tapped Build number exactly 7 times
2. Look carefully - it's usually near bottom of Settings
3. Try searching Settings for "developer"

### USB Debugging Not Working
**Problem:** Computer doesn't detect phone

**Solution:**
1. Check cable (try different cable/port)
2. Look at phone screen for authorization prompt
3. Tap "Always allow from this computer"
4. Try: `adb kill-server && adb devices`

### Wireless Debugging Keeps Disconnecting
**Problem:** Connection drops frequently

**Solution:**
1. Keep phone and computer on same WiFi
2. Disable battery optimization for Shizuku
3. Disable "Turn off WiFi automatically"
4. Keep phone screen on during debloat

### Shizuku Shows "Not Running"
**Problem:** Can't start Shizuku service

**Solution:**
1. Check wireless debugging is ON
2. Reconnect ADB from computer
3. Clear Shizuku app data and try again
4. Verify phone and computer on same network

### Canta Shows Empty List
**Problem:** No apps showing in Canta

**Solution:**
1. Enable "Show system apps" in settings
2. Check Shizuku has permission
3. Restart Canta app
4. Verify Shizuku is running (green checkmark)

---

## Screen Recording Guide

For users wanting to create their own guides:

### Tools Needed
- Screen recorder app (built into OneUI)
- Screenshot tool (Volume Down + Power button)

### Recommended Screenshots
1. Developer options toggle
2. USB debugging toggle
3. Wireless debugging screen
4. Shizuku running status
5. Canta package selection
6. Before/after app drawer

### Recording Settings
- 1080p resolution minimum
- Clear audio if narrating
- Show touch indicators
- Keep screen clean (hide notifications)

---

## Additional Visual Resources

### Official Documentation
- Android Developer: https://developer.android.com/tools/adb
- Shizuku: https://shizuku.rikka.app/
- Canta GitHub: https://github.com/samolego/Canta

### Video Tutorials
Check YouTube for visual guides:
- "How to enable USB debugging Samsung"
- "Shizuku setup guide"
- "Debloat Samsung with Canta"

---

**Screenshots Coming Soon**

Planning to add screenshots for:
- Each step of Developer Options enablement
- ADB connection process
- Shizuku setup and status
- Canta interface and usage
- Termux command execution

**Contributors:** If you have clear screenshots, please submit via pull request!

---

**Last Updated:** October 2025 for OneUI 8
