# Building IYAD AZIEZ OS with Crave + GitHub

Crave can provide remote build resources, while GitHub stores the source/configuration and can launch a build workflow. Connecting GitHub to Crave does not itself create a ROM: compatible device-specific source repositories and a successful build are still required.

## Current status

- Repository: [iyadqp9-lab/iyad-aziez](https://github.com/iyadqp9-lab/iyad-aziez)
- Device: Samsung Galaxy Tab A SM-T355Y, research codename `gt58lte`
- Initial baseline: **LineageOS 18.1 / Android 11**
- Android 13 / LineageOS 20 is deferred until the older baseline is validated.
- **Not confirmed build-ready:** the manifest's device tree, kernel, common, vendor and firmware branches must be checked together. Audio and Wi-Fi are not fixed merely by editing the Crave workflow.

## Before building

1. Confirm the exact tablet variant is SM-T355Y.
2. Validate every project and branch in the local manifest.
3. Require the exact regional kernel defconfig referenced by the device tree. Never fabricate an empty defconfig or substitute another model's config.
4. Check that device, kernel, common and vendor trees all target the same Android release.
5. Inspect the device-specific audio configuration (mixer paths/audio HAL) and Wi-Fi configuration (HAL, firmware, modules and permissions) before claiming these functions are supported.
6. Run the manifest preflight and resolve every reported error before starting the full compile.

## Crave access and GitHub connection

1. Open [Crave Open Source](https://crave.io/open-source/) and read the current access instructions.
2. Review the [Crave Android builder repository](https://github.com/redmi-creek/crave) and its README; workflows and supported inputs can change.
3. In the builder repository, open **Settings → Secrets and variables → Actions** and configure the credentials required by the workflow. Use the exact secret names checked by the current workflow.
4. Never commit `crave.conf`, Crave tokens, passwords, signing keys, or other credentials. Never share the token in chat.
5. Set the base project to LineageOS 18.1, device to `gt58lte`, product to `lineage_gt58lte`, and use the local manifest only after its source branches have passed validation.
6. Start the workflow from the builder repository's **Actions** tab and inspect the first error in the logs if it fails.
7. Confirm the output ZIP targets SM-T355Y, record its SHA-256 checksum, and publish it only after build and compatibility checks succeed.

## Audio and Wi-Fi

A successful compile does not prove sound or Wi-Fi work. These depend on the exact device tree, matching kernel, proprietary vendor blobs, firmware, audio mixer paths and Wi-Fi HAL/modules. Fix the specific error shown by logs or source inspection; do not invent generic XML files or copy files from `gt58ltebmc` / SM-T357W.

## Safety

The current project repository is a research/configuration repository, not a complete Android device tree. A ZIP extension alone does not make a ROM valid. Do not flash any artifact unless its target model, source, build logs, checksum, recovery method, and installation instructions have been checked.
