# IYAD AZIEZ OS

A custom Android ROM research project targeting the Samsung Galaxy Tab A **SM-T355Y**.

## Project goals

- Verify the exact model and hardware before building.
- Investigate Android 13 / LineageOS 20 compatibility.
- Identify compatible device tree, kernel, common, and vendor sources.
- Plan a custom **IYAD AZIEZ OS** boot animation.
- Investigate root integration and battery-use improvements only after a working build exists.
- Document a safe path to remote builds using Crave and GitHub.

## Target device

- Model: Samsung Galaxy Tab A SM-T355Y
- Research codename: `gt58lte` (device family lead; exact variant/product configuration still needs confirmation)
- Android target: LineageOS 20 / Android 13 (under investigation)

## Project status

**Research/configuration stage — not a ready-to-flash ROM.** Public references suggest that SM-T355Y belongs to the `gt58lte` family and that community ROMs exist for this device family. That does not by itself verify a working Android 13 build for this exact variant.

- [Device compatibility research](docs/DEVICE_COMPATIBILITY.md)
- [Crave + GitHub build setup guide](docs/CRAVE_BUILD.md)

## Safety notes

- Never flash a build until its target variant, build logs, checksum, recovery method, and installation instructions are verified.
- Do not substitute a ROM for a similar model without explicit maintainer confirmation.
- Root access, working LTE, and battery improvements are goals, not guarantees.
- A Crave account/GitHub connection does not build a ROM by itself; compatible device, kernel, common, and vendor sources are required.
- Never commit Crave credentials, signing keys, or passwords to this repository.
