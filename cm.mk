$(call inherit-product, device/lge/p880/full_p880.mk)

# Release name
PRODUCT_RELEASE_NAME := x3

# Preload bootanimation
TARGET_BOOTANIMATION_PRELOAD := true

TARGET_BOOTANIMATION_NAME := vertical-720x1280

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)
$(call inherit-product, vendor/cm/config/gsm.mk)

#Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=p880 BUILD_FINGERPRINT="" PRIVATE_BUILD_DESC=""

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := p880
PRODUCT_NAME := cm_p880
PRODUCT_BRAND := LGE
PRODUCT_MODEL := LG Optimus 4X HD
PRODUCT_MANUFACTURER := LGE
