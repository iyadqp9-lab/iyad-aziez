# IYAD AZIEZ OS

A custom Android ROM research project targeting the Samsung Galaxy Tab A **SM-T355Y**.

## Project goals

- Verify the exact model and hardware before building.
- Use **LineageOS 18.1 / Android 11 as the initial conservative baseline** for the first device-specific build attempt.
- Identify compatible device tree, kernel, common, vendor, firmware, audio, and Wi-Fi sources.
- Plan custom **IYAD AZIEZ OS** boot branding.
- Investigate root integration and battery-use improvements only after a working baseline exists.
- Document a safe remote-build path using Crave and GitHub.

## Target device

- Model: Samsung Galaxy Tab A SM-T355Y
- Research codename: `gt58lte` (confirm the exact regional variant before building)
- Initial ROM base: LineageOS 18.1 / Android 11
- Android 13 / LineageOS 20: deferred until the older baseline and exact hardware compatibility are validated.

## Project status

**Research/configuration stage — not a ready-to-flash ROM.** An older community manifest and ROM listing exist for the `gt58lte` family, but this does not guarantee that the current manifest builds or that audio, Wi-Fi, Bluetooth, camera, sensors, or power management work on this exact tablet.

- [Device compatibility research](docs/DEVICE_COMPATIBILITY.md)
- [Crave + GitHub build setup guide](docs/CRAVE_BUILD.md)

## Audio and Wi-Fi validation gate

Before calling a build usable, inspect the matching device tree, kernel, vendor blobs, firmware, audio mixer paths and Wi-Fi HAL configuration. Build success alone does not prove either feature works. Do not add guessed files or copy device files from a similar model to silence build errors.

## Safety notes

- Never flash a build until its target variant, build logs, checksum, recovery method, and installation instructions are verified.
- Do not substitute a ROM for a similar model without explicit maintainer confirmation.
- Root access, working Wi-Fi, audio, and battery improvements are goals, not guarantees.
- A Crave account/GitHub connection does not build a ROM by itself; compatible device, kernel, common, vendor, and firmware sources are required.
- Never commit Crave credentials, signing keys, or passwords to this repository.
