#
# Copyright 2016 The Android Open Source Project
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
#

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := msm8952

# Platform
TARGET_BOARD_PLATFORM := msm8952
TARGET_BOARD_PLATFORM_GPU := qcom-adreno510
TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/

# Power
TARGET_POWERHAL_VARIANT := qcom

# Qualcomm
#BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QC_TIME_SERVICES := true

# Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

TARGET_CPU_CORTEX_A53 := true
TARGET_USES_64_BIT_BINDER := true
ENABLE_CPUSETS := true


# Kernel Prebuilt
TARGET_PREBUILT_KERNEL := device/samsung/a9xprolte/kernel
BOARD_CUSTOM_BOOTIMG_MK := device/samsung/a9xprolte/mkbootimg.mk
BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci lpm_levels.sleep_disabled=1 earlyprintk androidboot.selinux=permissive
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --base 0x80000000 --ramdisk_offset 0x02000000 --tags_offset 0x01E00000 --board RLRPA9XP000KU --dt device/samsung/a9xprolte/dt.img

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Crypto
TARGET_HW_DISK_ENCRYPTION := true
TW_INCLUDE_CRYPTO := true
TARGET_KEYMASTER_WAIT_FOR_QSEE := true

# Recovery
RECOVERY_VARIANT := twrp
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_CACHEIMAGE_PARTITION_SIZE := 367001600
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 4194304000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 26363277312
BOARD_FLASH_BLOCK_SIZE := 131072

# Sensors
USE_SENSOR_MULTI_HAL := true

# TWRP
BOARD_SUPPRESS_SECURE_ERASE := true
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone1/temp
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_HAS_DOWNLOAD_MODE := true
TW_INCLUDE_CRYPTO := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_NO_REBOOT_BOOTLOADER := true
TW_THEME := portrait_hdpi

# Logcat
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true