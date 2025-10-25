#!/bin/bash
# Compare package lists before and after debloat

BACKUP_DIR="$HOME/samsung-debloat-backups"

echo "Before/After Comparison Tool"
echo "============================="
echo ""

if [ ! -d "$BACKUP_DIR" ]; then
    echo "Error: No backups found at $BACKUP_DIR"
    echo "Run backup-packages.sh first"
    exit 1
fi

# List backups
echo "Available backups:"
echo ""
backups=($(ls -t "$BACKUP_DIR"/*before*.txt "$BACKUP_DIR"/backup_*.txt 2>/dev/null))

if [ ${#backups[@]} -eq 0 ]; then
    echo "No before-debloat backups found"
    exit 1
fi

for i in "${!backups[@]}"; do
    echo "$((i+1))) $(basename "${backups[$i]}")"
done

echo ""
read -p "Select before-debloat backup: " before_idx

BEFORE_FILE="${backups[$((before_idx-1))]}"

echo ""
echo "Available after-debloat backups:"
echo ""
after_backups=($(ls -t "$BACKUP_DIR"/*after*.txt 2>/dev/null))

if [ ${#after_backups[@]} -eq 0 ]; then
    echo "No after-debloat backups found"
    echo "Creating current state backup..."
    AFTER_FILE=$(mktemp)
    adb shell pm list packages > "$AFTER_FILE"
else
    for i in "${!after_backups[@]}"; do
        echo "$((i+1))) $(basename "${after_backups[$i]}")"
    done
    echo "$((${#after_backups[@]}+1))) Use current device state"
    echo ""
    read -p "Select after-debloat backup: " after_idx

    if [ "$after_idx" -le "${#after_backups[@]}" ]; then
        AFTER_FILE="${after_backups[$((after_idx-1))]}"
    else
        AFTER_FILE=$(mktemp)
        adb shell pm list packages > "$AFTER_FILE"
    fi
fi

# Generate comparison
echo ""
echo "Generating comparison..."
echo ""

BEFORE_COUNT=$(grep -c "^package:" "$BEFORE_FILE")
AFTER_COUNT=$(grep -c "^package:" "$AFTER_FILE")
REMOVED_COUNT=$((BEFORE_COUNT - AFTER_COUNT))

echo "=========================================="
echo "DEBLOAT COMPARISON REPORT"
echo "=========================================="
echo ""
echo "Before: $BEFORE_COUNT packages"
echo "After:  $AFTER_COUNT packages"
echo "Removed: $REMOVED_COUNT packages"
echo ""
echo "==========================================

"
echo "REMOVED PACKAGES:"
echo "=========================================="

comm -23 <(grep "^package:" "$BEFORE_FILE" | sort) <(grep "^package:" "$AFTER_FILE" | sort) | sed 's/package://' | while read -r pkg; do
    # Try to identify what it is
    case $pkg in
        *facebook*) echo "$pkg (Facebook)" ;;
        *samsung.android.game*) echo "$pkg (Samsung Gaming)" ;;
        *bixby*) echo "$pkg (Bixby)" ;;
        *tvplus*) echo "$pkg (Samsung TV Plus)" ;;
        *google*) echo "$pkg (Google app)" ;;
        *) echo "$pkg" ;;
    esac
done

echo ""
echo "=========================================="
echo ""

# Calculate RAM freed (estimate)
RAM_ESTIMATE=$((REMOVED_COUNT * 5))
echo "Estimated RAM freed: ~${RAM_ESTIMATE}MB"
echo "(Based on average 5MB per removed package)"
echo ""

# Save report
REPORT_FILE="$BACKUP_DIR/comparison_$(date +%Y%m%d_%H%M%S).txt"
{
    echo "DEBLOAT COMPARISON REPORT"
    echo "Generated: $(date)"
    echo ""
    echo "Before: $BEFORE_COUNT packages"
    echo "After: $AFTER_COUNT packages"
    echo "Removed: $REMOVED_COUNT packages"
    echo ""
    echo "REMOVED PACKAGES:"
    comm -23 <(grep "^package:" "$BEFORE_FILE" | sort) <(grep "^package:" "$AFTER_FILE" | sort)
} > "$REPORT_FILE"

echo "Report saved to: $REPORT_FILE"
echo ""
