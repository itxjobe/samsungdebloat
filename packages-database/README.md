# Package Database

Detailed information about every debloatable package on Samsung Galaxy S25 Edge.

## Directory Structure

```
packages-database/
├── samsung/          # Samsung apps
├── google/           # Google apps
├── carrier/          # Carrier-specific apps
└── third-party/      # Facebook, Microsoft, etc.
```

## Package File Format

Each `.md` file contains:
- **Package Name**: Full package identifier
- **App Name**: Display name
- **Category**: Type of app
- **Purpose**: What it does
- **Safe to Remove**: Yes/No/Conditional
- **Dependencies**: What needs this
- **Breaks if Removed**: Features that stop working
- **Alternative**: Replacement apps
- **Restore Command**: How to get it back
- **User Reports**: Community feedback

## Example Usage

Looking up a package:
```bash
# Find package file
ls packages-database/**/*tvplus*

# Read info
cat packages-database/samsung/com.samsung.android.tvplus.md
```

## Contributing

To add package information:
1. Create new `.md` file in appropriate directory
2. Use template from `PACKAGE-TEMPLATE.md`
3. Fill in all sections
4. Test thoroughly
5. Submit pull request

## Quick Reference

### Most Commonly Removed

**Always Safe:**
- com.facebook.katana (Facebook)
- com.samsung.android.tvplus (TV Plus)
- Carrier apps (for carriers you don't have)

**Usually Safe:**
- com.samsung.android.game.* (Gaming services)
- com.samsung.android.arzone (AR features)
- Google duplicate apps

**Be Careful:**
- com.samsung.android.honeyboard (Samsung Keyboard - needed for DEX)
- com.samsung.android.visionintelligence (Circle to Search)
- Anything with "knox" in name

## Search by Feature

**Want to remove tracking:**
See `category-tracking.md`

**Want to improve battery:**
See `category-battery-drainers.md`

**Want to free RAM:**
See `category-heavy-services.md`

---

**Last Updated:** October 2025
