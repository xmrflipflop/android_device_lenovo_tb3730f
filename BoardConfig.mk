# inherit from the proprietary version
-include vendor/lenovo/tb3730f/BoardConfigVendor.mk

# TODO Delete all lines marked 
#D## 配置本地路径
#D#-include vendor/zte/b880/BoardConfigVendor.mk

LOCAL_PATH := device/lenovo/tb3730f
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

USE_CAMERA_STUB := true

# CPU基本参数
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_BOARD_PLATFORM := mt6735
TARGET_NO_BOOTLOADER := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_NO_FACTORYIMAGE := true

TARGET_LDPRELOAD += libxlog.so

# CPU构架
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_SMP := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53
TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

TARGET_CPU_CORTEX_A53 := true
TARGET_BOOTLOADER_BOARD_NAME := mt6735

# Mtk硬件参数配置
BOARD_HAS_MTK_HARDWARE := true
MTK_HARDWARE := true
BOARD_USES_LEGACY_MTK_AV_BLOB := true
COMMON_GLOBAL_CFLAGS += -DMTK_HARDWARE -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL
COMMON_GLOBAL_CPPFLAGS += -DMTK_HARDWARE
BOARD_CONNECTIVITY_VENDOR := MediaTek
BOARD_USES_MTK_AUDIO := true

#Use dlmalloc instead of jemalloc for mallocs
#MALLOC_IMPL := dlmalloc

# 内核参数
TARGET_USES_64_BIT_BINDER := true
TARGET_IS_64_BIT := true
#TODO CHECK #BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x3F88000
BOARD_SECOND_OFFSET := 0xE88000
BOARD_KERNEL_TAGS_OFFSET := 0xdf88000
BOARD_MKBOOTIMG_ARGS := --base $(BOARD_KERNEL_BASE) --pagesize $(BOARD_KERNEL_PAGESIZE) --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --second_offset $(BOARD_SECOND_OFFSET) --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
#D#BOARD_MKBOOTIMG_ARGS := --base 0x40078000 --pagesize 2048 --kernel_offset 0x00008000 --ramdisk_offset 0x03f88000 --tags_offset 0x0df88000 --board P635N30V2.0.1B0
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel
BOARD_CUSTOM_BOOTIMG := true

TARGET_KMODULES := true

# Disable memcpy opt (for audio libraries)
TARGET_CPU_MEMCPY_OPT_DISABLE := true

# 显示
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := $(LOCAL_PATH)/configs/egl.cfg
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
BOARD_EGL_WORKAROUND_BUG_10194508 := true

# 是否生成odex?
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),user)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif

# Flags
TARGET_GLOBAL_CFLAGS   += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

# 背光HAL层
TARGET_PROVIDES_LIBLIGHT := true

#开启文本布局引擎（更快的速度）
USE_MINIKIN := true

# Charger
BOARD_CHARGER_SHOW_PERCENTAGE := true

# 字体
EXTENDED_FONT_FOOTPRINT := true

TARGET_PROVIDES_INIT_RC := true

TARGET_SYSTEM_PROP := $(LOCAL_PATH)/system.prop

# RIL
#BOARD_RIL_CLASS := $(LOCAL_PATH)/ril/
BOARD_CONNECTIVITY_VENDOR := MediaTek
BOARD_CONNECTIVITY_MODULE := conn_soc

# 蓝牙
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MTK := true
BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# GPS
BOARD_GPS_LIBRARIES :=ture
MTK_GPS_SUPPORT :=ture
MTK_K64_SUPPORT :=ture
MTK_TC1_FEATURE :=ture

# 红外线
#MTK_IRTX_SUPPORT :=ture

# Mtk-WLAN HAL层
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM:="/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA:=STA
WIFI_DRIVER_FW_PATH_AP:=AP
WIFI_DRIVER_FW_PATH_P2P:=P2P

# make_ext4fs requires numbers in dec format
# 16384 blocks = 0x100 0000 bytes, 16777216 bytes
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
# 16384 blocks = 0x100 0000 bytes, 16777216 bytes
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
# 2097152 blocks = 0x8000 0000 bytes, 2147483648 bytes
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648
# 12563968 blocks = 0x2FED80000 bytes, 12865503232 btes
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12865503232
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_HAS_LARGE_FILESYSTEM := true
#D#BOARD_BOOTIMAGE_PARTITION_SIZE := 20971520
#D#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520
#D#BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736
#D#BOARD_USERDATAIMAGE_PARTITION_SIZE := 13474725888

# 挂载文件路径
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun/file

BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/root/fstab.mt6735
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"

# 预编译Libchromium.so模块
#PRODUCT_PREBUILT_WEBVIEWCHROMIUM := yes

# SELinux权限规则
BOARD_SEPOLICY_DIRS := \
       device/zte/b880/sepolicy
BOARD_SEPOLICY_UNION := \
    app.te \
    device.te \
    domain.te \
    file.te \
    file_contexts \
    fs_use \
    installd.te \
    net.te \
    netd.te \
    te_macros \
    vold.te \
    untrusted_app.te \
    platform_app.te \
    system_app.te \
    zygote.te \
    aal.te \
    aee_core_forwarder.te \
    akmd09911.te \
    akmd8963.te \
    akmd8975.te \
    ami304d.te \
    atcid.te \
    atci_service.te \
    audiocmdservice_atci.te \
    batterywarning.te \
    bmm050d.te \
    bmm056d.te \
    boot_logo_updater.te \
    br_app_data_service.te \
    BGW.te \
    ccci_fsd.te \
    ccci_mdinit.te \
    statusd.te \
    flashlessd.te \
    ccci_rpcd.te \
    eemcs_fsd.te \
    eemcs_mdinit.te \
    dhcp6c.te \
    dm_agent_binder.te \
    dualmdlogger.te \
    dumpstate.te \
    em_svr.te \
    enableswap.te \
    factory.te \
    fota1.te \
    geomagneticd.te \
    GoogleOtaBinder.te \
    gsm0710muxdmd2.te \
    gsm0710muxd.te \
    guiext-server.te \
    ipod.te \
    matv.te \
    mc6420d.te \
    mdlogger.te \
    mdnsd.te \
    memsicd3416x.te \
    memsicd.te \
    meta_tst.te \
    mmp.te \
    mnld.te \
    mobile_log_d.te \
    mpud6050.te \
    msensord.te \
    mtk_6620_launcher.te \
    mtk_agpsd.te \
    mtkbt.te \
    muxreport.te \
    netdiag.te \
    nvram_agent_binder.te \
    nvram_daemon.te \
    orientationd.te \
    permission_check.te \
    poad.te \
    pppd_dt.te \
    pppd_via.te \
    pq.te \
    resmon.te \
    mtkrild.te \
    mtkrildmd2.te \
    viarild.te \
    s62xd.te \
    sn.te \
    epdg_wod.te \
    ipsec.te \
    terservice.te \
    thermald.te \
    thermal_manager.te \
    thermal.te \
    tiny_mkswap.te \
    tiny_swapon.te \
    vdc.te \
    volte_imcb.te \
    volte_ua.te \
    volte_stack.te \
    wmt_loader.te \
    icusbd.te \
    xlog.te \
    mobicore.te 
     
BOARD_SEPOLICY_UNION += \
	adbd.te \
	bluetooth.te \
	bootanim.te \
	clatd.te \
	debuggerd.te \
	drmserver.te \
	dhcp.te \
	dnsmasq.te \
	gpsd.te \
	hci_attach.te \
	healthd.te \
	hostapd.te \
	inputflinger.te \
	init.te \
	init_shell.te \
	isolated_app.te \
	keystore.te \
	kernel.te \
	lmkd.te \
	logd.te \
	mediaserver.te \
	mtp.te \
	nfc.te \
	racoon.te \
	radio.te \
	rild.te \
	runas.te \
	sdcardd.te \
	servicemanager.te \
	shared_relro.te \
	shell.te \
	system_app.te \
	system_server.te \
	surfaceflinger.te \
	tee.te \
	ueventd.te \
	uncrypt.te \
	watchdogd.te \
	wpa_supplicant.te \
	wpa.te \
	property.te \
	property_contexts \
	service.te \
	dmlog.te \
	MtkCodecService.te \
	ppl_agent.te \
	pvrsrvctl.te \
	wifi2agps.te \
	dex2oat.te \
	emdlogger.te \
	autokd.te \
	ppp.te \
	launchpppoe.te \
	sbchk.te \
	service_contexts \
	ril-3gddaemon.te \
	usbdongled.te \
	zpppd_gprs.te \
	md_ctrl.te \
	cmddumper.te \
	tunman.te

# TWRP
# Guide: http://forum.xda-developers.com/showthread.php?t=1943625
# TWRP: https://github.com/omnirom/android_bootable_recovery
# Busybox external: https://github.com/omnirom/android_external_busybox
#RECOVERY_VARIANT := twrp
TW_THEME := portrait_mdpi
# Enables touch event logging to help debug touchscreen issues. Remove this for release
TWRP_EVENT_LOGGING := false
TW_INCLUDE_CRYPTO := true
#TARGET_HW_DISK_ENCRYPTION := true

#EOF
