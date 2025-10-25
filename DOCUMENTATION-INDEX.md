# Documentation Index

Complete guide to all documentation in this repository.

## Quick Start

**New to debloating?**
1. Read [README.md](README.md) first
2. Then [QUICKSTART.md](QUICKSTART.md) OR [ON-DEVICE-DEBLOAT.md](ON-DEVICE-DEBLOAT.md)
3. Start with Conservative level
4. Keep [FAQ.md](FAQ.md) handy

## Installation & Setup

| Document | Purpose | When to Use |
|----------|---------|-------------|
| [ADB-SETUP-GUIDE.md](ADB-SETUP-GUIDE.md) | Install ADB on Windows/Mac/Linux | First time setup |
| [WIRELESS-ADB-SETUP.md](WIRELESS-ADB-SETUP.md) | Configure wireless ADB | Want to use without cable |
| [ON-DEVICE-DEBLOAT.md](ON-DEVICE-DEBLOAT.md) | Shizuku + Canta setup | Prefer on-device method |
| [QUICKSTART.md](QUICKSTART.md) | Quick 5-minute start | Using ADB from computer |

## Debloating Guides

| Document | Purpose | When to Use |
|----------|---------|-------------|
| [README.md](README.md) | Main documentation | Overview of project |
| [DEBLOAT-COMPARISON.md](DEBLOAT-COMPARISON.md) | Compare debloat levels | Deciding which level |
| [ONEUI-FEATURE-TOGGLES.md](ONEUI-FEATURE-TOGGLES.md) | Disable without removing | Want reversible changes |

## Device-Specific

| Document | Purpose | When to Use |
|----------|---------|-------------|
| [DEVICE-COMPARISON.md](DEVICE-COMPARISON.md) | S25 model differences | Have S25/S25+/S25 Ultra |
| [regions/USA-Verizon.md](regions/USA-Verizon.md) | Verizon-specific | On Verizon network |
| [regions/USA-TMobile.md](regions/USA-TMobile.md) | T-Mobile-specific | On T-Mobile network |
| [regions/EU-General.md](regions/EU-General.md) | European models | Phone bought in EU |

## Reference Materials

| Document | Purpose | When to Use |
|----------|---------|-------------|
| [package-reference.md](package-reference.md) | Package details | Want to know what package does |
| [packages-database/](packages-database/) | Detailed package info | Deep research on packages |
| [FAQ.md](FAQ.md) | Common questions | Have questions |

## Recovery & Troubleshooting

| Document | Purpose | When to Use |
|----------|---------|-------------|
| [RESTORE-GUIDE.md](RESTORE-GUIDE.md) | Restore removed apps | Something broke or want app back |
| [SAFE-MODE-RECOVERY.md](SAFE-MODE-RECOVERY.md) | Emergency recovery | Phone won't boot or serious issue |
| [POST-UPDATE-GUIDE.md](POST-UPDATE-GUIDE.md) | After OneUI update | Just updated OneUI |

## Advanced Topics

| Document | Purpose | When to Use |
|----------|---------|-------------|
| [SUGGESTIONS.md](SUGGESTIONS.md) | Tips & optimizations | Want to optimize further |
| [PERFORMANCE-TESTING.md](PERFORMANCE-TESTING.md) | Measure improvements | Want to quantify results |
| [CONTRIBUTING.md](CONTRIBUTING.md) | Contribute to project | Want to help improve repo |

## Scripts & Automation

| Document | Purpose | When to Use |
|----------|---------|-------------|
| [scripts/README.md](scripts/README.md) | Script documentation | Using automation scripts |
| [scripts/auto-debloat.sh](scripts/auto-debloat.sh) | Automated debloat | Want easiest method |
| [scripts/backup-packages.sh](scripts/backup-packages.sh) | Create backup | Before debloating |
| [scripts/restore-packages.sh](scripts/restore-packages.sh) | Restore from backup | Need to restore |

## Community Resources

| Document | Purpose | When to Use |
|----------|---------|-------------|
| [community-configs/](community-configs/) | User configurations | Want tested configs |
| [CHANGELOG.md](CHANGELOG.md) | Version history | Track project changes |
| [tool-configs/](tool-configs/) | ADB AppControl/UAD configs | Using those tools |

## Debloat Scripts

| File | Level | Description |
|------|-------|-------------|
| [01-safe-user-apps.txt](01-safe-user-apps.txt) | Safe | Facebook, bloatware, safe removals |
| [02-bloatware-carriers.txt](02-bloatware-carriers.txt) | Safe | All carrier apps |
| [03-safe-system-apps.txt](03-safe-system-apps.txt) | Moderate | System apps, some risk |
| [04-optional-removals.txt](04-optional-removals.txt) | Advanced | Higher risk removals |
| [05-ai-assistant-options.txt](05-ai-assistant-options.txt) | Optional | Bixby/Gemini choices |
| [06-oneui8-specific.txt](06-oneui8-specific.txt) | Info | OneUI 8 new features |
| [batch-commands.txt](batch-commands.txt) | Quick | Pre-made batch commands |

## By User Level

### Beginner
Start here:
1. [README.md](README.md)
2. [FAQ.md](FAQ.md)
3. [QUICKSTART.md](QUICKSTART.md) or [ON-DEVICE-DEBLOAT.md](ON-DEVICE-DEBLOAT.md)
4. [01-safe-user-apps.txt](01-safe-user-apps.txt)
5. [RESTORE-GUIDE.md](RESTORE-GUIDE.md) (keep handy)

### Intermediate
Additional reading:
- [DEBLOAT-COMPARISON.md](DEBLOAT-COMPARISON.md)
- [package-reference.md](package-reference.md)
- [03-safe-system-apps.txt](03-safe-system-apps.txt)
- [SUGGESTIONS.md](SUGGESTIONS.md)

### Advanced
Full documentation:
- [CONTRIBUTING.md](CONTRIBUTING.md)
- [packages-database/](packages-database/)
- [scripts/](scripts/)
- [ONEUI-FEATURE-TOGGLES.md](ONEUI-FEATURE-TOGGLES.md)
- All debloat scripts

## By Task

### "I want to debloat my S25 Edge"
1. [QUICKSTART.md](QUICKSTART.md) - If using computer
2. [ON-DEVICE-DEBLOAT.md](ON-DEVICE-DEBLOAT.md) - If on-device
3. [scripts/auto-debloat.sh](scripts/auto-debloat.sh) - Automated method

### "I need to restore an app"
1. [RESTORE-GUIDE.md](RESTORE-GUIDE.md)
2. [scripts/restore-packages.sh](scripts/restore-packages.sh)

### "Something broke"
1. [FAQ.md](FAQ.md) - Check common issues
2. [RESTORE-GUIDE.md](RESTORE-GUIDE.md) - Restore procedure
3. [SAFE-MODE-RECOVERY.md](SAFE-MODE-RECOVERY.md) - If serious

### "Which packages should I remove?"
1. [DEBLOAT-COMPARISON.md](DEBLOAT-COMPARISON.md) - Level comparison
2. [package-reference.md](package-reference.md) - Package details
3. [packages-database/](packages-database/) - Deep info

### "I want to optimize further"
1. [SUGGESTIONS.md](SUGGESTIONS.md)
2. [ONEUI-FEATURE-TOGGLES.md](ONEUI-FEATURE-TOGGLES.md)
3. [PERFORMANCE-TESTING.md](PERFORMANCE-TESTING.md)

## By Carrier/Region

| Carrier/Region | Document |
|----------------|----------|
| Verizon (USA) | [regions/USA-Verizon.md](regions/USA-Verizon.md) |
| T-Mobile (USA) | [regions/USA-TMobile.md](regions/USA-TMobile.md) |
| AT&T (USA) | [02-bloatware-carriers.txt](02-bloatware-carriers.txt) |
| European Union | [regions/EU-General.md](regions/EU-General.md) |
| International | [02-bloatware-carriers.txt](02-bloatware-carriers.txt) |

## File Organization

```
samsungdebloat/
├── README.md ← Start here
├── QUICKSTART.md
├── ON-DEVICE-DEBLOAT.md
├── FAQ.md
├── *.md (other docs)
├── 01-06-*.txt (debloat scripts)
├── batch-commands.txt
├── scripts/ (automation)
│   ├── auto-debloat.sh ← Recommended
│   └── *.sh
├── termux-scripts/
├── canta-lists/
├── community-configs/
├── packages-database/
├── regions/
├── tool-configs/
└── .github/ (templates)
```

## Search Tips

**Looking for specific package?**
```bash
grep -r "package.name" .
```

**Find all mentions of feature:**
```bash
grep -r "Samsung Pay" *.md
```

**List all scripts:**
```bash
ls scripts/*.sh
```

## Getting Help

1. **Check FAQ first:** [FAQ.md](FAQ.md)
2. **Search documentation:** Use Ctrl+F in files
3. **GitHub Issues:** Report problems
4. **Contributing:** [CONTRIBUTING.md](CONTRIBUTING.md)

---

## Document Status

| Status | Meaning |
|--------|---------|
| ✅ Complete | Fully documented and tested |
| ⚠️ In Progress | Being updated |
| 📝 Planned | Coming soon |

Current status: ✅ All core documentation complete

---

**Last Updated:** October 2025
**Version:** 1.2.0
