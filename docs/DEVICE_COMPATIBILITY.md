# SM-T355Y compatibility research

## What the available evidence says

- The Samsung Galaxy Tab A 8.0 (2015) **SM-T355Y** is associated with the device family/codename **gt58lte**. A device-tree/bootloader reference identifies the Australian SM-T355Y variant as `gt58lte-aus`, compatible with `samsung,gt58lte` and `samsung,gt58`.
- An older community manifest exists for **LineageOS 18.1** and `gt58lte`, listing device, kernel, common, and vendor repositories. This is useful evidence that older community builds existed; it is **not** proof that those exact branches build LineageOS 20.
- Community posts report LineageOS 20 (Android 13) builds for the Galaxy Tab A family, but variant-specific functions such as LTE can differ. Do not assume a build for `gt58ltebmc` / SM-T357W is interchangeable with SM-T355Y.

## References

- [MSM8916 Samsung device definitions](https://github.com/msm8916-mainline/lk2nd/blob/main/lk2nd/device/dts/msm8916/msm8916-samsung.dts)
- [Community LineageOS 18.1 manifest for gt58lte](https://gist.github.com/user20482020/5199ec836780d33150d00dbe40d8cfa4)
- [Archived LineageOS 18.1 SM-T355Y build listing](https://sourceforge.net/projects/lineageos-t355y/files/)
- [Community discussion of LineageOS 20 for the Tab A family](https://xdaforums.com/t/unofficial-rom-alpha-lineageos-20-galaxy-tab-a-sm-t355-and-sm-t357w-t-sept-7-2024.4679103/)

## Build gate — do not skip

Before a ROM is built or flashed, verify:

1. The tablet itself reports **SM-T355Y** (not just a similar retail name).
2. The selected device tree explicitly supports this exact variant, or its maintainer documents compatibility.
3. Device tree, kernel, vendor blobs, and common repositories all have compatible branches for the selected Android/LineageOS version.
4. Build output targets the correct product and creates a flashable ZIP.
5. The ZIP checksum and installation/recovery instructions are available.

**Current conclusion:** `gt58lte` is a supported research lead, not a complete verified LineageOS 20 build configuration. No ready-to-flash ZIP is produced by this repository at this stage.
