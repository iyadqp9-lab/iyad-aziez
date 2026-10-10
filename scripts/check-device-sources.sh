#!/usr/bin/env bash
set -euo pipefail

# Run from the root of a synced Android source tree:
#   bash /path/to/iyad-aziez/scripts/check-device-sources.sh
#
# This is only a presence check. Passing it does not prove that sources compile
# or that every hardware feature works.

ROOT="${ANDROID_BUILD_TOP:-$PWD}"
required=(
  "device/samsung/gt58lte"
  "kernel/samsung/msm8916"
  "vendor/samsung/gt58lte"
)
optional_review=(
  "device/samsung/msm8916-common"
  "device/samsung/gte-common"
  "vendor/samsung/msm8916-common"
  "vendor/samsung/gte-common"
)

missing=0
echo "Checking source directories under: $ROOT"
for path in "${required[@]}"; do
  if [[ -d "$ROOT/$path" ]]; then
    echo "OK      $path"
  else
    echo "MISSING $path"
    missing=1
  fi
done

echo
echo "Common trees below must be reviewed against the selected device tree:"
for path in "${optional_review[@]}"; do
  if [[ -d "$ROOT/$path" ]]; then
    echo "PRESENT $path"
  else
    echo "REVIEW  $path (not present)"
  fi
done

if [[ -d "$ROOT/device/samsung/gt58ltebmc" && ! -d "$ROOT/device/samsung/gt58lte" ]]; then
  echo
  echo "BLOCKED: only gt58ltebmc is present. Do not treat SM-T357W/gt58ltebmc as SM-T355Y/gt58lte."
  missing=1
fi

if [[ "$missing" -ne 0 ]]; then
  echo
  echo "BLOCKED: required source directories are missing."
  echo "Do not run breakfast/brunch/mka for this target until the exact SM-T355Y device tree,"
  echo "matching kernel, and matching vendor blobs have been verified."
  exit 1
fi

echo
echo "Directory presence check passed only. Review product makefiles, dependencies, branches,"
echo "kernel defconfig, vendor files, and maintainer build instructions before building."
