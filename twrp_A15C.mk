# BACKUP REPLACE FILE

# BACKUP REPLACE FILE

#
# Copyright (C) 2025 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from g2315guf_v1_gc_ym_a15c_t device
$(call inherit-product, device/umidigi/g2315guf_v1_gc_ym_a15c_t/device.mk)

PRODUCT_DEVICE := g2315guf_v1_gc_ym_a15c_t
PRODUCT_NAME := twrp_g2315guf_v1_gc_ym_a15c_t
PRODUCT_BRAND := UMIDIGI
PRODUCT_MODEL := MP34
PRODUCT_MANUFACTURER := umidigi

PRODUCT_GMS_CLIENTID_BASE := android-sunvov

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="UMIDIGI_A15C_V1.0_20240314"

BUILD_FINGERPRINT := UMIDIGI/UMIDIGI_A15C/UMIDIGI_A15C:13/TP1A.220624.014/2306241037:user/release-keys
