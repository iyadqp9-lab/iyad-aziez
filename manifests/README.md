# Android local manifests

This folder is reserved for local manifests used by `repo` during Android source sync.

## Current status

There is **no active build manifest yet** for IYAD AZIEZ OS / Samsung SM-T355Y (`gt58lte`). This is intentional: the available LineageOS 20 MSM8916 manifest does not provide an exact SM-T355Y device tree and matching vendor tree. The similar `gt58ltebmc` product is not an automatic substitute.

Do not create or use `.repo/local_manifests/roomservice.xml` from old LineageOS 18.1 branches for a LineageOS 20 build. First verify the exact device tree, all dependencies, the kernel branch, and vendor blobs for the target variant.

## Planned layout after source verification

Once the Android 13 sources are confirmed, the build workspace should contain:

```text
.repo/
└── local_manifests/
    └── iyad-aziez-gt58lte.xml
device/
└── samsung/
    ├── gt58lte/              # exact SM-T355Y device tree; not yet verified for LOS 20
    ├── gte-common/           # if required by the verified device tree
    └── msm8916-common/       # if required by the verified device tree
kernel/
└── samsung/
    └── msm8916/              # matching branch/defconfig
vendor/
└── samsung/
    ├── gt58lte/              # matching proprietary blobs
    └── msm8916-common/       # if required by the verified device tree
```

These are expected source-workspace paths, not files that should be fabricated inside this project repository. Android device trees, kernels, and proprietary vendor blobs belong in their own source repositories.

## Verified reference manifest

The upstream MSM8916 LineageOS 20 manifest is useful as a source inventory, but it does not by itself provide a buildable SM-T355Y configuration:
https://github.com/retiredtab/LineageOS-build-manifests/blob/main/20/msm8916/msm8916-20.xml

See [the source audit](../docs/SOURCE_AUDIT.md) for the blockers that must be resolved before this folder contains an active manifest.
