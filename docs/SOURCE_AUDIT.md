# Source audit — Samsung Galaxy Tab A SM-T355Y

**Android 13 / LineageOS 20 status: BLOCKED. Historical Android 11 baseline: partial only.**

The target is Samsung Galaxy Tab A 8.0 (2015), model **SM-T355Y**. Public bootloader/device definitions identify it as `gt58lte-aus`, in the broader `gt58lte` family.

## Files now in this repository

- [Historical source manifest](../manifests/lineage-18.1/gt58lte.xml): a partial LineageOS 18.1-era source baseline for the exact `gt58lte` device tree and vendor tree. It is **not** an Android 13 manifest and is **not yet a complete build manifest**: a compatible kernel repository/revision and all dependencies still need verification.
- [Manifest notes](../manifests/README.md): intended workspace layout and status.

The device makefile from the historical `gt58lte` tree inherits `vendor/lineage/config/common_full_tablet_wifionly.mk`. This is a useful starting point for a Wi-Fi-only product configuration, but it does not prove the whole ROM is free of telephony code or that a build will succeed. The SIM hardware does not need to be physically removed; a Wi-Fi-only software product simply does not target cellular functionality.

## Confirmed references

- Device identification: https://github.com/msm8916-mainline/lk2nd/blob/main/lk2nd/device/dts/msm8916/msm8916-samsung.dts — labels SM-T355Y as `gt58lte-aus`. This is **not** an Android ROM device tree.
- Historical device tree: https://github.com/user20482020/device_samsung_gt58lte/tree/lineage-18.1-gt58lte
- Historical vendor tree: https://github.com/user20482020/android_vendor_samsung_gt58lte/tree/lineage-18.1
- Historical LineageOS 18.1 manifest: https://gist.github.com/user20482020/5199ec836780d33150d00dbe40d8cfa4
- LineageOS 20 MSM8916 manifest: https://github.com/retiredtab/LineageOS-build-manifests/blob/main/20/msm8916/msm8916-20.xml — it includes other Samsung MSM8916 tablets, but not the exact `gt58lte` SM-T355Y device tree and vendor tree. `gt58ltebmc` is SM-T357W and must not be substituted.

## Required before an Android 13 build

1. A maintained `gt58lte` device tree for LineageOS 20 / Android 13, or a documented and tested port.
2. All common device trees from the device tree's dependency file, on compatible branches.
3. A matching MSM8916 kernel tree and the correct SM-T355Y defconfig.
4. Correct vendor blobs for `gt58lte` and any required common vendor files.
5. A Crave workflow that syncs the selected manifest and actually runs the correct lunch/build commands.
6. Successful build logs and device-specific recovery/install instructions before any flashing.

## Safety gates

- Never use `gt58ltebmc` (SM-T357W) as if it were SM-T355Y.
- Never combine LineageOS 18.1-only sources with LineageOS 20 and assume they compile.
- Never rename an unrelated device such as `oxygen` to `gt58lte` and call it a port.
- Never flash a ZIP unless it is built for and checked against the exact model.

## Current result

A partial, historical Wi-Fi-only source baseline is now recorded in the project. It is a research starting point only; no ROM has been built, and no flashable ZIP exists. Android 13 remains blocked until compatible device, kernel, vendor, and Crave build sources are verified.
