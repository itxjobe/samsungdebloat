#!/bin/bash
# Export package list to Universal Android Debloater format

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"

echo "Export to UAD Format"
echo "===================="
echo ""

# Select source file
echo "Select source file:"
echo "1) Conservative (01-safe-user-apps.txt)"
echo "2) Moderate (01+02+03)"
echo "3) Custom file"
echo ""
read -p "Choice: " choice

case $choice in
    1)
        SOURCE="$REPO_ROOT/01-safe-user-apps.txt"
        OUTPUT="uad-conservative.json"
        ;;
    2)
        OUTPUT="uad-moderate.json"
        SOURCE="multiple"
        ;;
    3)
        read -p "Enter file path: " SOURCE
        OUTPUT="uad-custom.json"
        ;;
    *)
        echo "Invalid choice"
        exit 1
        ;;
esac

# Extract packages
PACKAGES=()

if [ "$SOURCE" = "multiple" ]; then
    for file in "$REPO_ROOT/01-safe-user-apps.txt" "$REPO_ROOT/02-bloatware-carriers.txt" "$REPO_ROOT/03-safe-system-apps.txt"; do
        while IFS= read -r line; do
            if [[ "$line" =~ pm\ uninstall.*\ ([a-z0-9.]+)$ ]]; then
                PACKAGES+=("${BASH_REMATCH[1]}")
            fi
        done < "$file"
    done
else
    while IFS= read -r line; do
        if [[ "$line" =~ pm\ uninstall.*\ ([a-z0-9.]+)$ ]]; then
            PACKAGES+=("${BASH_REMATCH[1]}")
        fi
    done < "$SOURCE"
fi

# Generate JSON
{
    echo "{"
    echo '  "name": "S25 Edge Custom Preset",'
    echo '  "packages": ['

    for i in "${!PACKAGES[@]}"; do
        pkg="${PACKAGES[$i]}"
        if [ $i -eq $((${#PACKAGES[@]} - 1)) ]; then
            echo "    \"$pkg\""
        else
            echo "    \"$pkg\","
        fi
    done

    echo "  ]"
    echo "}"
} > "$OUTPUT"

echo ""
echo "✓ Exported ${#PACKAGES[@]} packages to: $OUTPUT"
echo ""
echo "Import into UAD:"
echo "1. Open Universal Android Debloater"
echo "2. Load custom preset"
echo "3. Select: $OUTPUT"
echo ""
