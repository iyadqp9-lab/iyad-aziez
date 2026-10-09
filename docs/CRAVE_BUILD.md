# Building IYAD AZIEZ OS with Crave + GitHub

Crave can provide remote build resources, while GitHub stores the source/configuration and can launch a build workflow. Connecting GitHub to Crave does not itself create a ROM: the device-specific source repositories and a successful build are still required.

## Current status

- Repository: [iyadqp9-lab/iyad-aziez](https://github.com/iyadqp9-lab/iyad-aziez)
- Device research target: Samsung Galaxy Tab A SM-T355Y, associated with `gt58lte`
- ROM target under investigation: Android 13 / LineageOS 20
- **Not build-ready:** the exact Android 13 device tree, matching kernel/vendor sources, and a tested build configuration have not yet been verified. Do not start a device build using guessed repository branches or a similar model's files.

## Crave access and GitHub connection

1. Open [Crave Open Source](https://crave.io/open-source/) and read the current access/signup instructions. Some Crave build services require an account or access approval.
2. Review the maintained [Crave Android builder repository](https://github.com/redmi-creek/crave) and its README before connecting it. Its workflow and supported inputs may change.
3. Follow the builder project's instructions to fork the builder repository (rather than copying only its workflow into this project).
4. In the builder repository, open **Settings → Secrets and variables → Actions**. Add the required secrets using the values from your own Crave configuration:
   - `CRAVE_USERNAME`
   - `CRAVE_TOKEN`
5. Never commit `crave.conf`, Crave tokens, passwords, signing keys, or other credentials to a repository. Never send the token in a chat.
6. Configure the builder's local manifest input only after this project's manifest points to verified device, kernel, common, and vendor repositories on compatible branches.
7. Select the correct LineageOS base/version, device/product target, and build command according to the maintained builder documentation. Do not guess a codename or product target from a different tablet.
8. Start the workflow from the builder repository's **Actions** tab. Watch the logs and confirm that the build completes successfully.
9. Confirm the output ZIP targets SM-T355Y, record its SHA-256 checksum, and publish it as a GitHub Release only after the build and compatibility checks succeed.

## Why there is no automatic build workflow here yet

The current repository is a project/research repository, not a complete device tree or a fork of the Crave builder. Adding a workflow with guessed product names or incomplete sources would only create a failing build, and a ZIP from the wrong variant could damage the tablet. Once compatible source repositories and branches are verified, this guide can be updated with a concrete local manifest and build inputs.

## Safety

A ZIP file extension alone does not make a ROM valid. Do not flash any artifact unless its target model, source, build logs, checksum, recovery method, and installation instructions have been checked.
