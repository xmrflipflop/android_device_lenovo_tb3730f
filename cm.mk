# Release name
PRODUCT_RELEASE_NAME := tb3730f

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/lenovo/tb3730f/device_tb3730f.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := tb3730f
PRODUCT_NAME := cm_tb3730f
PRODUCT_BRAND := lenovo
PRODUCT_MODEL := tb3730f
PRODUCT_MANUFACTURER := lenovo
