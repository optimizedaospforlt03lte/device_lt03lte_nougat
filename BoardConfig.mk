# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Inherit from common msm8974
-include device/samsung/msm8974-common/BoardConfigCommon.mk

LOCAL_PATH := device/samsung/lt03lte

TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Assert
TARGET_OTA_ASSERT_DEVICE := lt03lte,lt03ltexx

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8974

# Kernel
BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_BOOTIMG_MK := $(LOCAL_PATH)/releasetools/mkbootimg.mk
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3 enforcing=0 androidboot.selinux=permissive
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x01e00000
TARGET_KERNEL_CONFIG := cyanogenmod_lt03lte_defconfig
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-linux-androideabi-
TARGET_KERNEL_SOURCE := kernel/samsung/lt03lte

BOARD_DISABLE_BLOCK_BASED_OTA := true

# Audio
AUDIO_FEATURE_ENABLED_NEW_SAMPLE_RATE := true
USE_CUSTOM_AUDIO_POLICY := 1

# Block-Based OTA
#BLOCK_BASED_OTA := false

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth
BOARD_CUSTOM_BT_CONFIG := $(LOCAL_PATH)/bluetooth/libbt_vndcfg.txt
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_PROVIDES_CAMERA_HAL := true
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
MALLOC_SVELTE := true
TARGET_NEEDS_GCC_LIBC := true

# Legacy BLOB Support
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true

# Filesystem
BOARD_BOOTIMAGE_PARTITION_SIZE := 11534336
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 15259648
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2506096640
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12828261888
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200

# Init
TARGET_INIT_VENDOR_LIB := libinit_msm8974
TARGET_LIBINIT_MSM8974_DEFINES_FILE := device/samsung/lt03lte/init/init_lt03lte.cpp
TARGET_UNIFIED_DEVICE := true

# Power HAL
TARGET_POWERHAL_VARIANT := qcom
TARGET_POWERHAL_SET_INTERACTIVE_EXT := $(LOCAL_PATH)/power/power_ext.c

# Recovery/TWRP
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
TW_BRIGHTNESS_PATH := /sys/class/lcd/panel/panel/brightness
TW_MAX_BRIGHTNESS := 255
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
TW_NO_SCREEN_TIMEOUT := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
BOARD_USES_MMCUTILS := true
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/etc/fstab.qcom
TW_EXCLUDE_SUPERSU := true

#MultiROM config. MultiROM also uses parts of TWRP config
MR_INPUT_TYPE := type_b
MR_INIT_DEVICES := device/samsung/lt03lte/multirom/mr_init_devices.c
MR_RD_ADDR := 0x82500000
MR_DPI := hdpi
MR_DPI_FONT := 340
MR_USE_MROM_FSTAB := true
MR_FSTAB := device/samsung/lt03lte/multirom/multirom.fstab
MR_KEXEC_MEM_MIN := 0x85000000
MR_DEVICE_HOOKS := device/samsung/lt03lte/multirom/mr_hooks.c
MR_DEVICE_HOOKS_VER := 4
TARGET_RECOVERY_IS_MULTIROM := true
MR_NO_KEXEC := true
MR_DEVICE_SPECIFIC_VERSION := b


# RIL
BOARD_GLOBAL_CFLAGS += -DUSE_RIL_VERSION_11
BOARD_GLOBAL_CPPFLAGS += -DUSE_RIL_VERSION_11
BOARD_RIL_CLASS := ../../../device/samsung/lt03lte/ril

# SELinux
-include device/qcom/sepolicy/sepolicy.mk
BOARD_SEPOLICY_DIRS += $(LOCAL_PATH)/sepolicy

# WiFi
BOARD_HAVE_SAMSUNG_WIFI     := true
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WPA_SUPPLICANT_VERSION      := VER_0_8_X
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP      := "/system/etc/wifi/bcmdhd_apsta.bin"

# Display
VSYNC_EVENT_PHASE_OFFSET_NS := 7500000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 5000000

