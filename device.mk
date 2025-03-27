#
# Copyright (C) 2025 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Overriding Shell Commands
#$(shell mkdir -p out/target/product/g2315guf_v1_gc_ym_a15c_t/vendor_ramdisk)
#$(shell cp -r $(LOCAL_PATH)/rootdir/twrp/* out/target/product/g2315guf_v1_gc_ym_a15c_t/vendor_ramdisk/)
#$(shell cp $(LOCAL_PATH)/prebuilts/dtb.img out/target/product/g2315guf_v1_gc_ym_a15c_t/)
#$(shell cp $(LOCAL_PATH)/prebuilts/kernel out/target/product/g2315guf_v1_gc_ym_a15c_t/)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# GSI AVB keys
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression.mk)

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

PRODUCT_EXTRA_RECOVERY_KEYS := \
    vendor/twrp/build/target/product/security/lineage


# Recovery HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl.recovery \

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

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
    otapreopt_script

# API levels
PRODUCT_SHIPPING_API_LEVEL := 32

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Product characteristics
PRODUCT_CHARACTERISTICS := default

# Boot CTRL
PRODUCT_PACKAGES += \
    bootctrl.ums9230 \
    bootctrl.ums9230.recovery \

# TWRP Recovery
PRODUCT_PACKAGES += \
    twrp.fstab \
    twrp.flags \
    init.recovery.g2315guf_v1_gc_ym_a15c_t.rc \
    init.recovery.common.rc \
    init.recovery.twrp.rc \
    init.custom.rc \

# EROFS utils
PRODUCT_HOST_PACKAGES += \
    mkfs.erofs \
    dump.erofs \
    fsck.erofs \

# Vendor Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/twrp.flags:recovery/root/system/etc/twrp.flags \
    $(LOCAL_PATH)/rootdir/etc/ueventd.ums9230_zebu.rc:recovery/root/ueventd.ums9230_zebu.rc \
    $(LOCAL_PATH)/rootdir/etc/ueventd.ums9230_haps.rc:recovery/root/ueventd.ums9230_haps.rc \
    $(LOCAL_PATH)/rootdir/etc/ueventd.ums9230_7h10.rc:recovery/root/ueventd.ums9230_7h10.rc \
    $(LOCAL_PATH)/rootdir/etc/ueventd.ums9230_4h10_go.rc:recovery/root/ueventd.ums9230_4h10_go.rc \
    $(LOCAL_PATH)/rootdir/etc/ueventd.ums9230_1h10_go.rc:recovery/root/ueventd.ums9230_1h10_go.rc \
    $(LOCAL_PATH)/rootdir/etc/ueventd.ums9230_1h10.rc:recovery/root/ueventd.ums9230_1h10.rc \
    $(LOCAL_PATH)/rootdir/etc/ueventd.g2315guf_v1_gc_ym_a15c_t.rc:recovery/root/ueventd.g2315guf_v1_gc_ym_a15c_t.rc \
    $(LOCAL_PATH)/rootdir/etc/snapuserd.rc:recovery/root/snapuserd.rc \
    $(LOCAL_PATH)/rootdir/etc/servicemanager.recovery.rc:recovery/root/servicemanager.recovery.rc \
    $(LOCAL_PATH)/rootdir/etc/init.custom.rc:recovery/root/init.custom.rc \
    $(LOCAL_PATH)/rootdir/etc/init.recovery.g2315guf_v1_gc_ym_a15c_t.rc:recovery/root/init.recovery.g2315guf_v1_gc_ym_a15c_t.rc \
    $(LOCAL_PATH)/rootdir/etc/init.recovery.common.rc:recovery/root/init.recovery.common.rc \
    $(LOCAL_PATH)/rootdir/etc/first_stage_ramdisk/fstab.ums9230_zebu:recovery/root/first_stage_ramdisk/fstab.ums9230_zebu \
    $(LOCAL_PATH)/rootdir/etc/first_stage_ramdisk/fstab.ums9230_haps:recovery/root/first_stage_ramdisk/fstab.ums9230_haps \
    $(LOCAL_PATH)/rootdir/etc/first_stage_ramdisk/fstab.ums9230_7h10:recovery/root/first_stage_ramdisk/fstab.ums9230_7h10 \
    $(LOCAL_PATH)/rootdir/etc/first_stage_ramdisk/fstab.ums9230_6h10:recovery/root/first_stage_ramdisk/fstab.ums9230_6h10 \
    $(LOCAL_PATH)/rootdir/etc/first_stage_ramdisk/fstab.ums9230_4h10_go:recovery/root/first_stage_ramdisk/fstab.ums9230_4h10_go \
    $(LOCAL_PATH)/rootdir/etc/first_stage_ramdisk/fstab.ums9230_4h10:recovery/root/first_stage_ramdisk/fstab.ums9230_4h10 \
    $(LOCAL_PATH)/rootdir/etc/first_stage_ramdisk/fstab.ums9230_1h10_go:recovery/root/first_stage_ramdisk/fstab.ums9230_1h10_go \
    $(LOCAL_PATH)/rootdir/etc/first_stage_ramdisk/fstab.ums9230_1h10:recovery/root/first_stage_ramdisk/fstab.ums9230_1h10 \
    $(LOCAL_PATH)/rootdir/etc/first_stage_ramdisk/fstab.ums9230_zebu:recovery/root/first_stage_ramdisk/fstab.ums9230_zebu \



# Kernel and dtb.img
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/dtb.img:dtb.img \
#    $(LOCAL_PATH)/prebuilts/kernel:kernel \

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)
