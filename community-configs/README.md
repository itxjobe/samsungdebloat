# Community Configurations

Real user configurations for specific use cases. Each configuration has been tested and documented.

## How to Use

1. Browse configurations below
2. Download the `.txt` file matching your needs
3. Review the packages (compare with `package-reference.md`)
4. Run the commands or import to Canta
5. Reboot and test

## Available Configurations

### battery-focused.txt
**Focus:** Maximum battery life
**Removes:** Heavy background services, Google apps, Samsung duplicates
**Keeps:** Core Samsung features, Samsung Pay
**Tested by:** Community
**Battery improvement:** ~15-20%
**Duration:** 2 weeks

### privacy-focused.txt
**Focus:** Minimal tracking and telemetry
**Removes:** Google services (except Play), Facebook, telemetry
**Keeps:** Samsung ecosystem
**Tested by:** Community
**Privacy improvement:** Significant
**Trade-offs:** Less Google integration

### minimal-essentials.txt
**Focus:** Bare minimum apps only
**Removes:** Almost everything non-essential
**Keeps:** Phone, messages, camera, settings
**Tested by:** Community
**Trade-offs:** Many features disabled
**For:** Users who want stock Android feel

### samsung-ecosystem.txt
**Focus:** Keep Samsung, remove Google
**Removes:** Google apps (except Play Services/Store)
**Keeps:** All Samsung features
**Tested by:** Community
**For:** Samsung ecosystem users

### google-ecosystem.txt
**Focus:** Keep Google, remove Samsung duplicates
**Removes:** Samsung apps with Google alternatives
**Keeps:** Google services, core Samsung features
**Tested by:** Community
**For:** Google ecosystem users

## Contributing Your Configuration

Have a tested configuration? Share it!

See CONTRIBUTING.md for guidelines.

**Format:**
```
# Configuration Name
# Tested by: [GitHub username]
# Device: Galaxy S25 Edge
# OneUI: 8.0
# Date: 2025-10-25
# Focus: [Description]
# Testing period: [Duration]
# Results: [Improvements/issues]

[Package list - one per line]
```

---

**Last Updated:** October 2025
