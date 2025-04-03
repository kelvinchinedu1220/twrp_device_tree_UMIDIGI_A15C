#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Configure emulated_storage.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Virtual A/B OTA
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Inherit from A15C
$(call inherit-product, device/umidigi/A15C/device.mk)

# Inherit some common recovery stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

PRODUCT_DEVICE := A15C
PRODUCT_NAME := twrp_A15C
PRODUCT_BRAND := UMIDIGI
PRODUCT_MODEL := MP34
PRODUCT_MANUFACTURER := UMIDIGI

PRODUCT_GMS_CLIENTID_BASE := android-sunvov
