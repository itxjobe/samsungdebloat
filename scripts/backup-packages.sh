#!/bin/bash
# Backup current package state
# Creates detailed backup of installed packages

BACKUP_DIR="$HOME/samsung-debloat-backups"
mkdir -p "$BACKUP_DIR"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

echo "Samsung Galaxy S25 Edge Package Backup"
echo "======================================"
echo ""

# Check ADB connection
if ! adb devices | grep -q "device$"; then
    echo "Error: No device connected"
    echo "Please connect device via ADB"
    exit 1
fi

# Device info
DEVICE=$(adb shell getprop ro.product.model | tr -d '\r')
ANDROID=$(adb shell getprop ro.build.version.release | tr -d '\r')
ONEUI=$(adb shell getprop ro.build.version.oneui | tr -d '\r')

echo "Device: $DEVICE"
echo "Android: $ANDROID"
echo "OneUI: $ONEUI"
echo ""

BACKUP_FILE="$BACKUP_DIR/backup_${DEVICE// /_}_$TIMESTAMP.txt"

echo "Creating backup..."

{
    echo "# Samsung Galaxy Package Backup"
    echo "# Device: $DEVICE"
    echo "# Android: $ANDROID"
    echo "# OneUI: $ONEUI"
    echo "# Date: $(date)"
    echo "# ======================================"
    echo ""
    echo "# ALL INSTALLED PACKAGES"
    echo "# ----------------------"
    adb shell pm list packages | sort
    echo ""
    echo "# USER PACKAGES (0)"
    echo "# ----------------"
    adb shell pm list packages -3 | sort
    echo ""
    echo "# SYSTEM PACKAGES"
    echo "# ---------------"
    adb shell pm list packages -s | sort
    echo ""
    echo "# DISABLED PACKAGES"
    echo "# -----------------"
    adb shell pm list packages -d | sort
} > "$BACKUP_FILE"

echo ""
echo "✓ Backup saved to:"
echo "$BACKUP_FILE"
echo ""
echo "Package count: $(adb shell pm list packages | wc -l)"
echo ""
