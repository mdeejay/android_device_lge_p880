#
# Copyright (C) 2012 The Android Open-Source Project
# Copyright (C) 2012 The CyanogenMod Project
# Copyright (C) 2012 mdeejay <mdjrussia@gmail.com>
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

DEVICE_PACKAGE_OVERLAYS := device/lge/p880/overlay

# Camera
PRODUCT_PACKAGES := \
    Camera

# Files needed for boot image
PRODUCT_COPY_FILES := \
	device/lge/p880/ramdisk/init.rc:root/init.rc \
	device/lge/p880/ramdisk/init.x3.rc:root/init.x3.rc \
	device/lge/p880/ramdisk/init.usb.rc:root/init.usb.rc \
	device/lge/p880/ramdisk/ueventd.rc:root/ueventd.rc \
	device/lge/p880/ramdisk/ueventd.x3.rc:root/ueventd.x3.rc \
	device/lge/p880/ramdisk/init:root/init


# Prebuilt Audio/GPS/Camera/Wi-Fi configs
PRODUCT_COPY_FILES += \

# BT config
PRODUCT_COPY_FILES += \
  system/bluetooth/data/main.conf:system/etc/bluetooth/main.conf

# Prebuilt Alsa configs
PRODUCT_COPY_FILES += \

# Vold.fstab
PRODUCT_COPY_FILES += \
	device/lge/p880/vold.fstab:system/etc/vold.fstab

# Input device configeration files
PRODUCT_COPY_FILES += \
	device/lge/p880/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
	device/lge/p880/usr/keylayout/tegra-kbc.kl:system/usr/keylayout/tegra-kbc.kl \
	device/lge/p880/usr/idc/tv-touchscreen.idc:system/usr/idc/tv-touchscreen.idc

# Any prebuilt kernel modules
PRODUCT_COPY_FILES += \
        device/lge/p880/modules/baseband_usb_chr.ko:system/lib/modules/baseband_usb_chr.ko \
        device/lge/p880/modules/bthid.ko:system/lib/modules/bthid.ko \
        device/lge/p880/modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \
        device/lge/p880/modules/tcrypt.ko:system/lib/modules/tcrypt.ko

# lights
PRODUCT_PACKAGES += \
        lights.tegra

# a2dp
PRODUCT_PACKAGES += \
	audio.a2dp.default \
        libaudioutils \
        libtinyalsa

#NFC
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_ndef \
    libnfc_jni \
    Nfc \
    Tag \
    com.android.nfc_extras

# Missed apps
PRODUCT_PACKAGES += \
	Torch

# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# for bugmailer
ifneq ($(TARGET_BUILD_VARIANT),user)
    PRODUCT_PACKAGES += send_bug
    PRODUCT_COPY_FILES += \
        system/extras/bugmailer/bugmailer.sh:system/bin/bugmailer.sh \
        system/extras/bugmailer/send_bug:system/bin/send_bug
endif

# Permissions
PRODUCT_COPY_FILES += \
	device/lge/p880/configs/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/base/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
	frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml

PRODUCT_PROPERTY_OVERRIDES += \
        ro.com.google.locationfeatures=1 \
        ro.setupwizard.enable_bypass=1 \
        dalvik.vm.execution-mode=int:jit \
        dalvik.vm.lockprof.threshold=500 \
        dalvik.vm.dexopt-flags=m=y \
	persist.sys.usb.config=mass_storage,adb

# Tegra 3 spacific overrides
PRODUCT_PROPERTY_OVERRIDES += \
	persist.tegra.nvmmlite=1

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi
PRODUCT_LOCALES += en_US xhdpi

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product-if-exists, vendor/lge/p880/p880-vendor.mk)
$(call inherit-product, frameworks/base/build/phone-xhdpi-1024-dalvik-heap.mk)
