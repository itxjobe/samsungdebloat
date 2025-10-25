# ADB Setup Guide

Complete guide for installing and configuring Android Debug Bridge (ADB) on all operating systems.

## Table of Contents
1. [What is ADB?](#what-is-adb)
2. [Windows Setup](#windows-setup)
3. [macOS Setup](#macos-setup)
4. [Linux Setup](#linux-setup)
5. [Verification](#verification)
6. [Troubleshooting](#troubleshooting)

---

## What is ADB?

**Android Debug Bridge (ADB)** is a command-line tool that lets you communicate with Android devices. For debloating, it allows you to uninstall system apps without root access.

**What you need:**
- Computer (Windows, Mac, or Linux)
- USB cable
- 5-10 minutes

**What ADB can do:**
- Install and uninstall apps
- Transfer files
- Access device shell
- Debug applications
- Take screenshots and recordings

---

## Windows Setup

### Method 1: Official Platform Tools (Recommended)

#### Step 1: Download Platform Tools

1. Visit: https://developer.android.com/tools/releases/platform-tools
2. Click "Download SDK Platform-Tools for Windows"
3. Accept the terms
4. Save the ZIP file (approximately 10-15 MB)

#### Step 2: Extract Files

1. Navigate to Downloads folder
2. Right-click `platform-tools-latest-windows.zip`
3. Select "Extract All..."
4. Choose destination: `C:\`
5. Files will be in: `C:\platform-tools\`

**Folder contents:**
```
C:\platform-tools\
├── adb.exe
├── fastboot.exe
├── AdbWinApi.dll
└── ... (other files)
```

#### Step 3: Add to System PATH (Recommended)

**Option A: Using System Properties**

1. Press `Win + X`, select "System"
2. Click "Advanced system settings"
3. Click "Environment Variables"
4. Under "System variables", find "Path"
5. Click "Edit"
6. Click "New"
7. Add: `C:\platform-tools`
8. Click "OK" on all dialogs
9. **Restart Command Prompt**

**Option B: Using Command Prompt (Admin)**

```cmd
setx PATH "%PATH%;C:\platform-tools" /M
```

**Why add to PATH?**
- Run `adb` from any folder
- Don't need to type full path
- Easier to use

#### Step 4: Verify Installation

1. Open new Command Prompt (`Win + R`, type `cmd`)
2. Type: `adb version`
3. Should show version info

**Expected output:**
```
Android Debug Bridge version 1.0.41
Version 34.0.5-11019098
```

**If not working:**
- Restart Command Prompt
- Check PATH was added correctly
- Try absolute path: `C:\platform-tools\adb version`

### Method 2: Minimal ADB and Fastboot

Lighter alternative:

1. Download from: https://forum.xda-developers.com/t/official-tool-windows-adb-fastboot-and-drivers-15-seconds-adb-installer-v1-4-3.2588979/
2. Run installer
3. Follow prompts
4. Installs ADB, drivers, and adds to PATH

### Method 3: Package Manager (Chocolatey)

If you have Chocolatey installed:

```cmd
choco install adb
```

### Installing USB Drivers (Windows Only)

**Required for:** USB connection to phone

**Option A: Universal ADB Drivers**

1. Download: https://adb.clockworkmod.com/
2. Run installer
3. Follow prompts

**Option B: Samsung USB Drivers**

1. Download Samsung USB drivers
2. Visit: https://developer.samsung.com/android-usb-driver
3. Install "SAMSUNG_USB_Driver_for_Mobile_Phones.exe"

**Option C: Automatic via Platform Tools**

Windows 8+ includes generic USB drivers that usually work.

---

## macOS Setup

### Method 1: Homebrew (Recommended)

**Step 1: Install Homebrew** (if not installed)

Open Terminal and run:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

**Step 2: Install ADB**

```bash
brew install android-platform-tools
```

**Step 3: Verify**

```bash
adb version
```

**That's it!** Homebrew handles everything.

### Method 2: Manual Installation

**Step 1: Download Platform Tools**

1. Visit: https://developer.android.com/tools/releases/platform-tools
2. Download "SDK Platform-Tools for Mac"
3. Save ZIP file

**Step 2: Extract**

```bash
cd ~/Downloads
unzip platform-tools-latest-darwin.zip
sudo mv platform-tools /usr/local/
```

**Step 3: Add to PATH**

Edit your shell profile:

**For Zsh (macOS Catalina+):**
```bash
echo 'export PATH="$PATH:/usr/local/platform-tools"' >> ~/.zshrc
source ~/.zshrc
```

**For Bash:**
```bash
echo 'export PATH="$PATH:/usr/local/platform-tools"' >> ~/.bash_profile
source ~/.bash_profile
```

**Step 4: Verify**

```bash
adb version
```

### No Drivers Needed

macOS includes generic USB drivers. No additional installation required.

---

## Linux Setup

### Ubuntu / Debian / Mint

```bash
sudo apt-get update
sudo apt-get install android-tools-adb android-tools-fastboot
```

### Fedora

```bash
sudo dnf install android-tools
```

### Arch Linux / Manjaro

```bash
sudo pacman -S android-tools
```

### openSUSE

```bash
sudo zypper install android-tools
```

### Manual Installation (All Distros)

**Step 1: Download**

```bash
cd ~/Downloads
wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip
```

**Step 2: Extract**

```bash
unzip platform-tools-latest-linux.zip
sudo mv platform-tools /usr/local/
```

**Step 3: Add to PATH**

```bash
echo 'export PATH="$PATH:/usr/local/platform-tools"' >> ~/.bashrc
source ~/.bashrc
```

### Set Up udev Rules (Important for Linux)

**Why needed:** Allows non-root ADB access

**Step 1: Create udev rules file**

```bash
sudo nano /etc/udev/rules.d/51-android.rules
```

**Step 2: Add these lines**

```
# Samsung
SUBSYSTEM=="usb", ATTR{idVendor}=="04e8", MODE="0666", GROUP="plugdev"

# Google
SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", MODE="0666", GROUP="plugdev"
```

**Step 3: Set permissions and reload**

```bash
sudo chmod a+r /etc/udev/rules.d/51-android.rules
sudo udevadm control --reload-rules
sudo udevadm trigger
```

**Step 4: Add user to plugdev group**

```bash
sudo usermod -aG plugdev $USER
```

**Step 5: Log out and log back in**

---

## Verification

### Test ADB Installation

**Step 1: Check version**

```bash
adb version
```

**Expected:**
```
Android Debug Bridge version 1.0.41
Version 34.0.5-11019098
Installed as /usr/local/platform-tools/adb
```

**Step 2: Start ADB server**

```bash
adb start-server
```

**Expected:**
```
* daemon not running; starting now at tcp:5037
* daemon started successfully
```

**Step 3: Check devices** (phone not connected yet)

```bash
adb devices
```

**Expected:**
```
List of devices attached
```
(Empty list is normal - phone not connected)

### Test with Phone

**Step 1: Enable USB Debugging on phone**

See VISUAL-GUIDE.md for detailed steps.

**Step 2: Connect phone via USB**

**Step 3: Check devices**

```bash
adb devices
```

**First time - Authorization required:**
```
List of devices attached
XXXXXXXXXX      unauthorized
```

**Check phone screen:**
- Prompt: "Allow USB debugging?"
- Check "Always allow from this computer"
- Tap "OK"

**Run again:**
```bash
adb devices
```

**Success:**
```
List of devices attached
XXXXXXXXXX      device
```

---

## Troubleshooting

### "adb: command not found"

**Problem:** ADB not in PATH

**Windows:**
- Use full path: `C:\platform-tools\adb`
- Or add to PATH (see Windows setup)

**Mac/Linux:**
- Check PATH: `echo $PATH`
- Re-add to shell profile
- Restart terminal

### "Device unauthorized"

**Problem:** Haven't authorized computer on phone

**Solution:**
1. Check phone screen
2. Tap "Always allow"
3. Disconnect and reconnect
4. Run: `adb kill-server && adb devices`

### "No devices found"

**Problem:** Phone not detected

**Checks:**
1. USB debugging enabled?
2. Cable working? (try different cable/port)
3. USB mode: Try "File Transfer" mode
4. Drivers installed? (Windows)
5. udev rules set? (Linux)

**Try:**
```bash
adb kill-server
adb start-server
adb devices
```

### "Insufficient permissions" (Linux)

**Problem:** User not in plugdev group or udev rules missing

**Solution:**
```bash
sudo usermod -aG plugdev $USER
# Set up udev rules (see Linux section)
# Log out and log back in
```

### Multiple Devices Detected

**Problem:** Multiple Android devices connected

**Solution:** Specify device
```bash
adb -s DEVICE_SERIAL devices
adb -s DEVICE_SERIAL shell pm list packages
```

Get serial from `adb devices` output.

### ADB Server Out of Date

**Problem:** Version mismatch

**Solution:**
```bash
adb kill-server
adb start-server
```

### Port 5037 Already in Use

**Problem:** Another process using ADB port

**Windows:**
```cmd
netstat -ano | findstr :5037
taskkill /PID [PID_NUMBER] /F
```

**Mac/Linux:**
```bash
lsof -i :5037
kill [PID_NUMBER]
```

Then restart ADB:
```bash
adb start-server
```

---

## Advanced Configuration

### Custom ADB Port

```bash
export ANDROID_ADB_SERVER_PORT=5038
adb start-server
```

### ADB over Network (WiFi)

See WIRELESS-ADB-SETUP.md for complete guide.

### Multiple ADB Versions

**Check which ADB:**
```bash
which adb        # Mac/Linux
where adb        # Windows
```

**Use specific version:**
```bash
/path/to/specific/adb devices
```

---

## Updating ADB

### Windows

1. Download latest platform-tools
2. Extract to `C:\platform-tools` (overwrite)
3. Or use: `choco upgrade adb`

### macOS

```bash
brew upgrade android-platform-tools
```

### Linux

```bash
# Debian/Ubuntu
sudo apt-get update && sudo apt-get upgrade android-tools-adb

# Arch
sudo pacman -Syu android-tools
```

---

## Uninstalling ADB

### Windows

1. Delete `C:\platform-tools` folder
2. Remove from PATH (Environment Variables)

### macOS

```bash
brew uninstall android-platform-tools
# Or if manually installed:
sudo rm -rf /usr/local/platform-tools
# Remove from .zshrc or .bash_profile
```

### Linux

```bash
# Ubuntu/Debian
sudo apt-get remove android-tools-adb

# Arch
sudo pacman -R android-tools
```

---

## Security Considerations

### ADB Security

- **Never leave USB debugging on** when not needed
- **Don't authorize untrusted computers**
- **Revoke authorizations:** Developer options > Revoke USB debugging authorizations
- **Public computers:** Be careful with ADB on public/shared computers

### Best Practices

1. Enable USB debugging only when needed
2. Use "Always allow" only on your personal computer
3. Disable wireless debugging when not in use
4. Keep ADB updated
5. Don't run unknown ADB commands

---

## Next Steps

After successful ADB installation:

1. Read QUICKSTART.md for debloating guide
2. Or ON-DEVICE-DEBLOAT.md for Shizuku method
3. Test ADB connection with your phone
4. Start with conservative debloat

---

## Additional Resources

- Official ADB Documentation: https://developer.android.com/tools/adb
- XDA ADB Guide: https://www.xda-developers.com/install-adb-windows-macos-linux/
- ADB Command Reference: https://gist.github.com/Pulimet/5013acf2cd5b28e55036c82c91bd56d8

---

**Last Updated:** October 2025
