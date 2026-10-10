# Source audit — Samsung Galaxy Tab A SM-T355Y

**Status: BLOCKED — do not start a ROM build yet.**

This audit separates verified references from sources that are only candidates. The target is the Samsung Galaxy Tab A 8.0 (2015), model **SM-T355Y**. Public bootloader/device definitions identify this variant as `gt58lte-aus`, in the broader `gt58lte` family.

## Confirmed references

- Device definition: https://github.com/msm8916-mainline/lk2nd/blob/main/lk2nd/device/dts/msm8916/msm8916-samsung.dts
  - The definition labels SM-T355Y as `gt58lte-aus`.
  - This is useful for identifying the hardware variant; it is **not** an Android ROM device tree.
- Historical LineageOS 18.1 manifest for `gt58lte`: https://gist.github.com/user20482020/5199ec836780d33150d00dbe40d8cfa4
  - It points to an older device tree, MSM8916 kernel, and vendor repositories.
  - Its branches are LineageOS 18.1-era sources and must not be mixed into a LineageOS 20 build without maintained, compatible branches.
- LineageOS 20 MSM8916 manifest maintained by retiredtab: https://github.com/retiredtab/LineageOS-build-manifests/blob/main/20/msm8916/msm8916-20.xml
  - It includes sources for several Samsung MSM8916 tablets.
  - It does **not** include an exact `gt58lte` SM-T355Y device tree and vendor tree. The `gt58ltebmc` entries are for a different variant and must not be substituted automatically.
- Community LineageOS 20 reports exist for this device family, but reports do not prove that an arbitrary source combination is reproducible or that LTE works on SM-T355Y.

## Required before building

All of the following must be found and reviewed on compatible LineageOS 20 branches:

1. A device tree explicitly for `gt58lte` / SM-T355Y, including a product makefile and valid `PRODUCT_DEVICE`.
2. Its complete `lineage.dependencies` and all referenced common device trees.
3. A matching MSM8916 kernel tree and defconfig for this device.
4. Vendor blobs for `gt58lte` plus any common vendor repository required by the device tree.
5. Any required Android 13 / LineageOS-UL patches documented by the maintainer.
6. Build logs proving that the selected product completes the build.
7. A checksum and device-specific installation/recovery instructions before any flashing.

## Do not do these things

- Do not use `gt58ltebmc` (SM-T357W) as if it were the same product as SM-T355Y.
- Do not combine LineageOS 18.1-only device/vendor branches with a LineageOS 20 manifest and assume they will compile.
- Do not rename `oxygen` to `gt58lte` in the Crave workflow and call it a device port.
- Do not flash a ZIP unless it has been built for and checked against the exact model.

## Current result

The project can safely store documentation and run source-presence checks, but it cannot yet produce a trustworthy build manifest for SM-T355Y. The build must remain blocked until the exact Android 13 device tree and matching vendor sources are verified.
