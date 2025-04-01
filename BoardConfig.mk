
# Copyright (C) 2025 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

ALLOW_MISSING_DEPENDENCIES := true

DEVICE_PATH := device/umidigi/A15C

#BOARD_RECOVERY_VARIANT := twrp
# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
vendor \
vbmeta \
odm \
system\
boot \
vbmeta_system \
product \
vbmeta_vendor \
dtbo \
vendor_dlkm \
system_ext

WITH_DEXPREOPT := true
TARGET_NO_KERNEL := false
TARGET_NO_RECOVERY := false

# VNDK / SDK
TARGET_SUPPORTS_VNDK := true
BOARD_VNDK_VERSION := current

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI:= arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a75

TARGET_USES_64_BIT_BINDER := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# XTRAS
BUILD_BROKEN_MISSING_REQUIRED_MODULES := true
BUILD_BROKEN_DUP_SYSPROP := true
BUILD_BROKEN_OUTSIDE_INCLUDE_DIRS  := true
#BUILD_BROKEN_TREBLE_SYSPROP_NEVERALLOW := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
#BUILD_BROKEN_VENDOR_PROPERTY_NAMESPACE := true
#BUILD_BROKEN_PREBUILT_ELF_FILES := true
#BUILD_BROKEN_DUP_RULES := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := A15C
TARGET_NO_BOOTLOADER := true

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true


# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_DTBOIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 104857600
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 104857600
BOARD_SUPER_PARTITION_GROUPS := umidigi_dynamic_partitions
BOARD_UMIDIGI_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    vendor \
    odm \
    system \
    product \
    vendor_dlkm \
    system_ext
BOARD_UMIDIGI_DYNAMIC_PARTITIONS_SIZE := 3274100736

BOARD_USES_METADATA_PARTITION := true

BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_PARTITION_TYPE := erofs
BOARD_VENDORIMAGE_PARTITION_TYPE := ext4
BOARD_VENDORIMAGE_PARTITION_TYPE := erofs
BOARD_ODMIMAGE_PARTITION_TYPE := erofs
BOARD_PRODUCTIMAGE_PARTITION_TYPE := erofs
BOARD_SYSTEM_EXTIMAGE_PARTITION_TYPE := erofs
BOARD_VENDOR_DLKMIMAGE_PARTITION_TYPE := erofs
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4

# Workaround For TWRP
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_SYSTEM := system

# Platform
TARGET_BOARD_PLATFORM := ums9230

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/system_ext.prop
TARGET_SYSTEM_DLKM_PROP += $(DEVICE_PATH)/system_dlkm.prop
TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop
TARGET_ODM_DLKM_PROP += $(DEVICE_PATH)/odm_dlkm.prop
TARGET_VENDOR_DLKM_PROP += $(DEVICE_PATH)/vendor_dlkm.prop

# Kernel
BOARD_BOOT_HEADER_VERSION := 4
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=ttyS1,115200n8 buildvariant=user
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x05400000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_DTB_OFFSET := 0x01f00000
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilts/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilts/dtb.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_KERNEL_IMAGE_NAME := kernel
BOARD_MKBOOTIMG_ARGS += --header_version 4
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_INCLUDE_DTB_IN_VENDOR_BOOTIMG := true
BOARD_KERNEL_SEPARATED_DTBO := true
TARGET_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilts/dtbo.img

# Vendor Ramdisk
ifeq ($(BOARD_BOOT_HEADER_VERSION),4)
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
#BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true
BOARD_INCLUDE_DTB_IN_VENDOR_BOOTIMG := true
#TARGET_VENDOR_RAMDISK := $(TARGET_OUT_RECOVERY_ROOT)
endif
BOARD_VENDOR_RAMDISK_USE_LZ4 := true
BOARD_VENDOR_RAMDISK_COMPRESSED := lz4-l
BOARD_RECOVERY_RAMDISK_USE_LZ4 := true
BOARD_RECOVERY_COMPRESSED := lz4-l
BOARD_RAMDISK_USE_LZ4 := true
BOARD_RAMDISK_COMPRESSED := lz4-l

TARGET_VENDOR_RAMDISK_FRAGMENT_DIRS := \
    $(TARGET_RECOVERY_ROOT_OUT) \
    $(TARGET_VENDOR_RAMDISK_OUT)

#BOARD_VENDOR_RAMDISK_FRAGMENTS := \
#    ramdisk-recovery.cpio

# Explicitly set the kernel version for depmod
KERNEL_VERSION := 5.4
BOARD_VENDOR_KERNEL_MODULES_DEPMOD_VERSION := $(KERNEL_VERSION)

ALL_MODULES := $(wildcard $(DEVICE_PATH)/prebuilts/lib/modules/*.ko)
BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(ALL_MODULES)
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(ALL_MODULES)
BOARD_KERNEL_MODULES := "sprd_wdt_fiq.ko sprd_sip_svc.ko sprd_systimer.ko sprd_time_sync.ko sprd_time_sync_cp.ko clk-sprd.ko ums9230-clk.ko spi-sprd-adi.ko sprd-sc27xx-spi.ko rtc-sc27xx.ko sc2730-regulator.ko ump518-regulator.ko sprd_soc_id.ko rpmb.ko ufs-sprd_qogirl6.ko sprd_hwspinlock.ko nvmem-sc27xx-efuse.ko nvmem_sprd_cache_efuse.ko nvmem_sprd_efuse.ko i2c-sprd.ko i2c-sprd-hw-v2.ko sprd-cpufreq-v2.ko sprd-cpufreq-public.ko sprd_7sreset.ko sprd_manufacturer_model.ko trusty.ko trusty-pm.ko trusty-log.ko trusty-irq.ko trusty-ipc.ko trusty-virtio.ko sprd_shm.ko gpio-eic-sprd.ko gpio-sprd.ko gpio-pmic-eic-sprd.ko sdhci-sprd.ko mmc_hsq.ko mmc_swcq.ko rtc-sc27xx.ko sprd_pmic_syscon.ko sprd_pmic_refout.ko sprd_pdbg.ko sprd_power_stat.ko kfifo_buf.ko sensorhub.ko sprd_power_manager.ko unisoc-mailbox.ko sprd-sipc-virt-bus.ko sipc-core.ko spipe.ko spool.ko sipx.ko seth.ko sprd_modem_loader.ko sprd_iq.ko slog_bridge.ko sbuf_bridge.ko sblock_bridge.ko usb_f_vser.ko"
BOARD_KERNEL_MODULES_LOAD := $(BOARD_KERNEL_MODULES)
BOARD_KERNEL_BINARIES := kernel dtb.img

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilts/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilts/dtb.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_INCLUDE_DTB_IN_VENDOR_BOOTIMG := true
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilts/dtbo.img
BOARD_KERNEL_SEPARATED_DTBO := true
endif

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_USE_EROFS := true
TARGET_USES_MKE2FS := true
TARGET_USES_EROFS := true

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_VENDOR_BOOT_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_VENDOR_BOOT_ALGORITHM := SHA256_RSA4096
BOARD_AVB_VENDOR_BOOT_ROLLBACK_INDEX := 1
BOARD_AVB_VENDOR_BOOT_ROLLBACK_INDEX_LOCATION := 1

# VINTF
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# TWRP zip installer
ifneq ($(wildcard bootable/recovery/installer/.),)
    USE_RECOVERY_INSTALLER := true
    RECOVERY_INSTALLER_PATH := bootable/recovery/installer
endif

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0
TARGET_RECOVERY_SELINUX := permissive

# Display
TARGET_SCREEN_DENSITY := 320
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1650

# BOARD Configuration
#TW_OEM_BUILD := true # Uncomment for minimal build / *reduces size greatly*
#TW_THEME := portrait_hdpi # TW_THEME disabled for custom phone screen size
TW_EXTRA_LANGUAGES := false # Set to false to reduce size
TW_INCLUDE_LIBRESETPROP := true 
TW_SCREEN_BLANK_ON_BOOT := true
TW_MAX_BRIGHTNESS := 300
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
#TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TW_USE_DRM := true
TW_USE_EXTERNAL_STORAGE := true
TW_USE_FB2PNG := true
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_EXT4 := true
TW_INCLUDE_F2FS := true
TW_INCLUDE_EROFS := true
TW_INCLUDE_VFAT := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_LPDUMP := true
TW_INCLUDE_LOGCAT := true
TW_INCLUDE_FUSE := true
TW_HAS_SELINUX := true
TW_HAS_EDT_PANEL := true
TW_HAS_MTP := true
#TW_HAS_BOOT_PARTITION := true
TW_SUPPORT_INPUT_AIDL_HAPTICS := true
#TW_DEFAULT_MOUNT_RW := true
TW_ENABLE_ADB_SIDELOAD := true
TW_NO_SCREEN_TIMEOUT := true
#TW_NO_FASTBOOT_BOOT := true
TW_HAPTICS_TSPDRV := true
#TW_LOAD_VENDOR_MODULES := true
#TW_LOAD_VENDOR_MODULES := "sprd-drm.ko sprd_wdt_fiq.ko sprd_sip_svc.ko sprd_systimer.ko sprd_time_sync.ko sprd_time_sync_cp.ko clk-sprd.ko ums9230-clk.ko spi-sprd-adi.ko sprd-sc27xx-spi.ko rtc-sc27xx.ko sc2730-regulator.ko ump518-regulator.ko sprd_soc_id.ko rpmb.ko ufs-sprd_qogirl6.ko sprd_hwspinlock.ko nvmem-sc27xx-efuse.ko nvmem_sprd_cache_efuse.ko nvmem_sprd_efuse.ko i2c-sprd.ko i2c-sprd-hw-v2.ko sprd-cpufreq-v2.ko sprd-cpufreq-public.ko sprd_7sreset.ko sprd_manufacturer_model.ko trusty.ko trusty-pm.ko trusty-log.ko trusty-irq.ko trusty-ipc.ko trusty-virtio.ko sprd_shm.ko gpio-eic-sprd.ko gpio-sprd.ko gpio-pmic-eic-sprd.ko sdhci-sprd.ko mmc_hsq.ko mmc_swcq.ko rtc-sc27xx.ko sprd_pmic_syscon.ko sprd_pmic_refout.ko sprd_pdbg.ko sprd_power_stat.ko kfifo_buf.ko usb_f_vser.ko trusty-tui.ko sprd_flash_drv.ko flash_ic_ocp8137.ko sprd_camsys_pw_domain.ko sprd-dma.ko virt-dma.ko ion_ipc_trusty.ko ion_cma_heap.ko sprd-ion.ko unisoc-iommu.ko sprd_cpp.ko sha1-ce.ko ghash-ce.ko aes-ce-ccm.ko aes-neon-blk.ko arc4.ko twofish_generic.ko twofish_common.ko sprd-gsp.ko apsys-dvfs.ko extcon-usb-gpio.ko microarray_fp.ko fortsense_fp.ko focaltech_fp.ko synaptics_nt36xxx.ko core.ko gpio.ko pinctrl.ko vsp.ko jpg.ko leds-sc27xx-bltc.ko ledtrig-pattern.ko zram.ko zsmalloc.ko pinctrl-sprd.ko pinctrl-sprd-qogirl6.ko spi-sprd.ko pwm-sprd.ko sc27xx_adc.ko sc27xx-poweroff.ko sc27xx-vibra.ko sprd_usbpinmux_qogirl6.ko sprd-bc1p2.ko phy-sprd-qogirl6.ko sprd_tcpm.ko sc27xx_typec.ko sprd_tcpm.ko sc27xx_pd.ko sc27xx_fast_charger.ko sprd_battery_info.ko sc27xx_fuel_gauge.ko bq2560x-charger.ko eta6953_charger.ko lcdbias_ocp2131.ko sprd-charger-manager.ko misc_sprd_uid.ko musb_hdrc.ko musb_sprd.ko agdsp_access.ko asix.ko mcdt_hw_r2p0.ko sprd_audcp_dvfs.ko sprd_audcp_boot.ko icnl9922_spi.ko st21nfc.ko cdfinger_fp.ko"
TW_CUSTOM_BOARD_FLAGS := device/umidigi/A15C/twrp.flags
TW_CUSTOM_CPU_TEMP_PATH := "/sys/class/thermal/thermal_zone9/temp"
