# Android local manifests

This folder stores manifest files and notes for IYAD AZIEZ OS on Samsung Galaxy Tab A SM-T355Y (`gt58lte`).

## Historical baseline available

[`lineage-18.1/gt58lte.xml`](lineage-18.1/gt58lte.xml) records known historical repositories for the SM-T355Y device tree, common device files, and vendor tree.

**Do not treat this as a ready-to-run manifest.** It is for LineageOS 18.1 / Android 11-era source investigation only. It intentionally does not claim an Android 13 build is possible, and a matching kernel source/revision has not been verified in this manifest. The product tree's Wi-Fi-only inheritance is a starting point for omitting cellular functionality, not proof that all telephony dependencies have been removed.

## Android 13 / LineageOS 20 status

There is **no verified, build-ready Android 13 manifest yet** for SM-T355Y. The available LineageOS 20 MSM8916 manifest does not provide an exact `gt58lte` device tree and matching vendor tree. The similar `gt58ltebmc` product is for SM-T357W and must not be substituted.

Before making an Android 13 manifest, verify:
1. An exact `gt58lte` device tree that supports the target Android version.
2. Every dependency declared by that tree, on compatible branches.
3. A matching MSM8916 kernel tree and SM-T355Y defconfig.
4. Exact device vendor blobs and any common vendor files.
5. Crave sync/build commands and successful build logs.

## Expected synced source layout

The Android source workspace (not this project repository) should eventually contain:

```text
.repo/local_manifests/iyad-aziez-gt58lte.xml
device/samsung/gt58lte/
device/samsung/gte-common/       # if required
device/samsung/msm8916-common/   # if required
kernel/samsung/msm8916/
vendor/samsung/gt58lte/
vendor/samsung/msm8916-common/  # if required
```

Do not fabricate Android device trees, kernel files, or proprietary blobs. Keep the build blocked until source compatibility is verified.

Reference inventory: https://github.com/retiredtab/LineageOS-build-manifests/blob/main/20/msm8916/msm8916-20.xml

See [the source audit](../docs/SOURCE_AUDIT.md) for details.
