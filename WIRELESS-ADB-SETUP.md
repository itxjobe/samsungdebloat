# Wireless ADB Setup Guide

Configure ADB to work over WiFi without a USB cable. Perfect for convenience and on-device debloating.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Initial Setup (Requires USB Once)](#initial-setup-requires-usb-once)
3. [Connecting Wirelessly](#connecting-wirelessly)
4. [Permanent Wireless Setup](#permanent-wireless-setup)
5. [Troubleshooting](#troubleshooting)

---

## Prerequisites

- ADB installed on computer (see ADB-SETUP-GUIDE.md)
- Phone and computer on same WiFi network
- USB cable (for initial setup only)
- USB Debugging enabled on phone

---

## Initial Setup (Requires USB Once)

### Method 1: Android 11+ (Wireless Debugging)

**Step 1: Enable Wireless Debugging**

1. Settings > Developer options
2. Enable "Wireless debugging"
3. Tap "Wireless debugging"

**Step 2: Pair Device**

1. Tap "Pair device with pairing code"
2. Note the pairing code and port

Example:
```
Wi-Fi pairing code: 123456
IP address & Port: 192.168.1.100:45678
```

**Step 3: Pair from Computer**

```bash
adb pair 192.168.1.100:45678
```

Enter the 6-digit code when prompted.

**Step 4: Connect**

Look at main "Wireless debugging" screen for IP and port (different from pairing port):

```
IP address & Port
192.168.1.100:5555
```

Connect:
```bash
adb connect 192.168.1.100:5555
```

### Method 2: Older Android (USB First, Then Wireless)

**Step 1: Connect via USB**

```bash
adb devices
```

Verify device shows up.

**Step 2: Enable TCP/IP Mode**

```bash
adb tcpip 5555
```

**Step 3: Find Phone IP Address**

On phone:
- Settings > About phone > Status > IP address
- Or Settings > Connections > WiFi > Current network > IP address

Example: `192.168.1.100`

**Step 4: Disconnect USB**

Unplug USB cable.

**Step 5: Connect Wirelessly**

```bash
adb connect 192.168.1.100:5555
```

**Success:**
```
connected to 192.168.1.100:5555
```

---

## Connecting Wirelessly

### After Initial Setup

Once paired, reconnecting is easy:

```bash
adb connect 192.168.1.100:5555
```

### Check Connection

```bash
adb devices
```

**Output:**
```
List of devices attached
192.168.1.100:5555    device
```

### Run Commands

Works exactly like USB:
```bash
adb shell pm list packages
adb shell pm uninstall --user 0 com.package.name
```

---

## Permanent Wireless Setup

### Keep Connection After Reboot

**Problem:** Wireless debugging resets after phone reboot.

**Solutions:**

#### Option 1: Quick Reconnect Script

**reconnect.sh** (Mac/Linux):
```bash
#!/bin/bash
adb connect 192.168.1.100:5555
adb devices
```

Make executable:
```bash
chmod +x reconnect.sh
./reconnect.sh
```

**reconnect.bat** (Windows):
```batch
@echo off
adb connect 192.168.1.100:5555
adb devices
pause
```

#### Option 2: Keep Wireless Debugging Always On

1. Settings > Developer options > Wireless debugging
2. Leave toggled ON
3. After reboot, just run: `adb connect IP:5555`

**Note:** Some phones reset this after reboot for security.

#### Option 3: Tasker Automation (Advanced)

Use Tasker app to auto-enable wireless debugging on boot (requires specific setup).

---

## Troubleshooting

### Connection Refused

**Problem:** `failed to connect to 192.168.1.100:5555`

**Solutions:**
1. Check phone and computer on same WiFi
2. Verify IP address hasn't changed
3. Re-enable wireless debugging on phone
4. Try pairing again

### Connection Timeout

**Problem:** Connection hangs

**Solutions:**
1. Check firewall (allow port 5555)
2. Restart wireless debugging
3. Restart ADB server:
   ```bash
   adb kill-server
   adb start-server
   ```

### IP Address Changed

**Problem:** Phone IP changed (DHCP)

**Solutions:**

**Option A: Set Static IP**
1. Phone WiFi settings
2. Current network > Advanced
3. IP settings > Static
4. Set static IP (e.g., 192.168.1.100)
5. Set gateway and DNS

**Option B: Check Current IP**
```bash
# If still connected via USB
adb shell ip addr show wlan0 | grep inet
```

**Option C: Router DHCP Reservation**
Reserve IP for phone's MAC address in router settings.

### Multiple Devices

If you have multiple devices:

```bash
# List all
adb devices

# Connect specific device
adb -s 192.168.1.100:5555 shell pm list packages
```

### Port Already in Use

Try different port:
```bash
adb tcpip 5556
adb connect 192.168.1.100:5556
```

---

## Security Considerations

### Risks of Wireless ADB

- Anyone on same network can potentially connect
- Less secure than USB
- Should be disabled when not in use

### Best Practices

1. **Disable when done:**
   ```bash
   adb usb
   ```
   Or disable wireless debugging in phone settings

2. **Use on trusted networks only** (home WiFi, not public)

3. **Don't leave enabled permanently**

4. **Firewall:** Consider firewall rules on computer

5. **Revoke authorizations regularly:**
   Settings > Developer options > Revoke USB debugging authorizations

---

## Advanced Usage

### Auto-Connect Script

**auto-connect.sh:**
```bash
#!/bin/bash
# Auto-connect to phone

PHONE_IP="192.168.1.100"
PHONE_PORT="5555"

echo "Connecting to $PHONE_IP:$PHONE_PORT..."
adb connect $PHONE_IP:$PHONE_PORT

if [ $? -eq 0 ]; then
    echo "Connected successfully!"
    adb devices
else
    echo "Connection failed. Check:"
    echo "1. Phone and computer on same WiFi"
    echo "2. Wireless debugging enabled on phone"
    echo "3. IP address is correct"
fi
```

### Monitor Connection

```bash
# Keep checking connection
watch -n 5 adb devices
```

### Disconnect

```bash
adb disconnect 192.168.1.100:5555

# Or disconnect all
adb disconnect
```

### Switch Back to USB

```bash
adb usb
```

---

## Use Cases

### When Wireless is Better

- Using Shizuku (needs wireless ADB)
- On-device debloating
- Phone mounted (desk stand, car mount)
- Cable broken or unavailable
- Multiple quick connections throughout day

### When USB is Better

- First-time setup
- Large file transfers
- More stable connection needed
- Security concerns
- Faster data transfer

---

## For On-Device Debloating

Wireless ADB is **essential** for:

1. **Shizuku setup** - Requires wireless debugging
2. **Termux method** - Connects to localhost ADB
3. **On-device convenience** - No computer nearby

See ON-DEVICE-DEBLOAT.md for complete guide.

---

## Quick Reference

### Connect
```bash
adb connect 192.168.1.100:5555
```

### Disconnect
```bash
adb disconnect
```

### Check Status
```bash
adb devices
```

### Switch to USB
```bash
adb usb
```

### Restart ADB
```bash
adb kill-server
adb start-server
```

---

**Last Updated:** October 2025
