#
# Copyright (C) 2025 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# GSI AVB keys
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# A/B
ENABLE_VIRTUAL_AB := true
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression.mk)

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Overriding Shell Commands
#$(shell mkdir -p out/target/product/g2315guf_v1_gc_ym_a15c_t/vendor_ramdisk)
#$(shell cp -r $(LOCAL_PATH)/recovery/root/* out/target/product/A15C/vendor_ramdisk/)
#$(shell cp $(LOCAL_PATH)/prebuilts/kernel out/target/product/g2315guf_v1_gc_ym_a15c_t/)

PRODUCT_BUILD_VENDOR_BOOT_IMAGE := true

# Recovery HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-impl.recovery \
    android.hardware.boot@1.2-service

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=erofs \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script \
    update_engine \
    update_engine_sideload \
    update_verifier

# TWRP Recovery
PRODUCT_PACKAGES += \
    twrp.flags \
    recovery.fstab \
    init.recovery.g2315guf_v1_gc_ym_a15c_t.rc \
    init.recovery.A15C.rc \
    init.recovery.common.rc \
    init.custom.rc \
    sprd-drm.ko \
    recovery \
    bootctrl.ums9230 
    
# EROFS utils
PRODUCT_HOST_PACKAGES += \
    mkfs.erofs \
    dump.erofs \
    fsck.erofs 

# API levels
PRODUCT_SHIPPING_API_LEVEL := 32

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Product characteristics
PRODUCT_CHARACTERISTICS := defaults

# Vendor Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/twrp.flags:vendor_ramdisk/system/etc/twrp.flags \
    $(LOCAL_PATH)/rootdir/etc/ueventd.ums9230_zebu.rc:vendor_ramdisk/ueventd.ums9230_zebu.rc \
    $(LOCAL_PATH)/rootdir/etc/ueventd.ums9230_haps.rc:vendor_ramdisk/ueventd.ums9230_haps.rc \
    $(LOCAL_PATH)/rootdir/etc/ueventd.ums9230_7h10.rc:vendor_ramdisk/ueventd.ums9230_7h10.rc \
    $(LOCAL_PATH)/rootdir/etc/ueventd.ums9230_4h10_go.rc:vendor_ramdisk/ueventd.ums9230_4h10_go.rc \
    $(LOCAL_PATH)/rootdir/etc/ueventd.ums9230_1h10_go.rc:vendor_ramdisk/ueventd.ums9230_1h10_go.rc \
    $(LOCAL_PATH)/rootdir/etc/ueventd.ums9230_1h10.rc:vendor_ramdisk/ueventd.ums9230_1h10.rc \
    $(LOCAL_PATH)/rootdir/etc/ueventd.A15C.rc:vendor_ramdisk/ueventd.A15C.rc \
    $(LOCAL_PATH)/rootdir/etc/snapuserd.rc:vendor_ramdisk/snapuserd.rc \
    $(LOCAL_PATH)/rootdir/etc/servicemanager.recovery.rc:vendor_ramdisk/servicemanager.recovery.rc \
    $(LOCAL_PATH)/rootdir/etc/init.custom.rc:vendor_ramdisk/init.custom.rc \
    $(LOCAL_PATH)/rootdir/etc/init.recovery.A15C.rc:vendor_ramdisk/init.recovery.A15C.rc \
    $(LOCAL_PATH)/rootdir/etc/init.recovery.common.rc:vendor_ramdisk/init.recovery.common.rc \
    $(LOCAL_PATH)/rootdir/first_stage_ramdisk/fstab.ums9230_zebu:vendor_ramdisk/first_stage_ramdisk/fstab.ums9230_zebu \
    $(LOCAL_PATH)/rootdir/first_stage_ramdisk/fstab.ums9230_haps:vendor_ramdisk/first_stage_ramdisk/fstab.ums9230_haps \
    $(LOCAL_PATH)/rootdir/first_stage_ramdisk/fstab.ums9230_7h10:vendor_ramdisk/first_stage_ramdisk/fstab.ums9230_7h10 \
    $(LOCAL_PATH)/rootdir/first_stage_ramdisk/fstab.ums9230_6h10:vendor_ramdisk/first_stage_ramdisk/fstab.ums9230_6h10 \
    $(LOCAL_PATH)/rootdir/first_stage_ramdisk/fstab.ums9230_4h10_go:vendor_ramdisk/first_stage_ramdisk/fstab.ums9230_4h10_go \
    $(LOCAL_PATH)/rootdir/first_stage_ramdisk/fstab.ums9230_4h10:vendor_ramdisk/first_stage_ramdisk/fstab.ums9230_4h10 \
    $(LOCAL_PATH)/rootdir/first_stage_ramdisk/fstab.ums9230_1h10_go:vendor_ramdisk/first_stage_ramdisk/fstab.ums9230_1h10_go \
    $(LOCAL_PATH)/rootdir/first_stage_ramdisk/fstab.ums9230_1h10:vendor_ramdisk/first_stage_ramdisk/fstab.ums9230_1h10 \
    $(LOCAL_PATH)/rootdir/first_stage_ramdisk/fstab.ums9230_zebu:vendor_ramdisk/first_stage_ramdisk/fstab.ums9230_zebu \
    $(LOCAL_PATH)/rootdir/first_stage_ramdisk/fstab.ums9230_zebu:vendor_ramdisk/first_stage_ramdisk/fstab.ums9230_zebu 

# Copy dtb.img to out
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/dtb.img:dtb.img

#Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)