# Automated Scripts

Utility scripts to automate debloating, backup, and management.

## Main Scripts

### auto-debloat.sh
**Automated all-in-one debloat solution**

Features:
- Interactive menu selection
- Automatic backup creation
- Progress tracking
- Post-debloat report generation
- Safe error handling

Usage:
```bash
bash scripts/auto-debloat.sh
```

Prompts you to select:
- Conservative / Moderate / Aggressive / Custom
- Confirms before execution
- Creates before/after backups
- Generates detailed report

### backup-packages.sh
**Create detailed package backup**

Creates snapshot of:
- All installed packages
- User packages
- System packages
- Disabled packages

Usage:
```bash
bash scripts/backup-packages.sh
```

Saves to: `~/samsung-debloat-backups/`

### restore-packages.sh
**Restore from backup**

Features:
- Lists available backups
- Shows what will be restored
- Restores missing packages

Usage:
```bash
bash scripts/restore-packages.sh
```

### interactive-selector.sh
**Menu-driven package selection**

Features:
- Visual category selection
- Individual package review
- Descriptions for each package
- Generates custom script

Requirements:
- `whiptail` or `dialog` package

Usage:
```bash
bash scripts/interactive-selector.sh
```

### compare-before-after.sh
**Compare package lists**

Shows:
- How many packages removed
- Which packages removed
- Estimated RAM freed
- Detailed report

Usage:
```bash
bash scripts/compare-before-after.sh
```

### export-to-uad.sh
**Export to Universal Android Debloater format**

Converts our package lists to UAD JSON format for use with UAD tool.

Usage:
```bash
bash scripts/export-to-uad.sh
```

## Quick Start

**Recommended workflow:**

1. **Backup first:**
   ```bash
   bash scripts/backup-packages.sh
   ```

2. **Run auto-debloat:**
   ```bash
   bash scripts/auto-debloat.sh
   ```

3. **Compare results:**
   ```bash
   bash scripts/compare-before-after.sh
   ```

4. **If needed, restore:**
   ```bash
   bash scripts/restore-packages.sh
   ```

## Script Requirements

**All scripts:**
- ADB installed and in PATH
- Device connected via USB or wireless ADB
- USB debugging enabled

**interactive-selector.sh additionally requires:**
- whiptail or dialog package
  - Ubuntu/Debian: `sudo apt-get install whiptail`
  - macOS: `brew install dialog`

## Backup Location

All scripts save backups to:
```
~/samsung-debloat-backups/
```

Files created:
- `backup_DEVICE_TIMESTAMP.txt` - Full package backup
- `packages_before_debloat_TIMESTAMP.txt` - Pre-debloat state
- `packages_after_debloat_TIMESTAMP.txt` - Post-debloat state
- `debloat_report_TIMESTAMP.txt` - Detailed report
- `comparison_TIMESTAMP.txt` - Before/after comparison

## Error Handling

Scripts handle common errors:
- No ADB connection → Clear error message
- No device → Prompts to connect
- Missing files → Shows helpful guidance
- Failed commands → Continue with others

## Safety Features

**Auto-debloat.sh:**
- Creates backup before any changes
- Confirms before execution
- Shows exactly what will be removed
- Generates restore report

**Restore-packages.sh:**
- Shows what will be restored
- Confirms before restoring
- Handles failures gracefully

## Advanced Usage

### Run Without Interaction

**Auto-debloat with preset level:**
```bash
echo "1" | bash scripts/auto-debloat.sh  # Conservative
echo "2" | bash scripts/auto-debloat.sh  # Moderate
```

### Batch Multiple Devices

Create wrapper script for multiple devices:
```bash
for device in $(adb devices | grep device$ | cut -f1); do
    adb -s $device shell pm list packages > backup_$device.txt
    # Run debloat for each
done
```

## Troubleshooting

**"ADB not found"**
- Install ADB (see ADB-SETUP-GUIDE.md)
- Add ADB to PATH

**"No device connected"**
- Check USB cable
- Enable USB debugging
- Run: `adb devices`

**"whiptail: command not found"** (interactive-selector.sh)
- Install whiptail or dialog package
- Or use auto-debloat.sh instead

**Backup directory permissions**
- Scripts create `~/samsung-debloat-backups/`
- Check write permissions if errors occur

---

**Last Updated:** October 2025
