LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_KERNEL_CONFIG),)
ifeq ($(TARGET_PREBUILT_KERNEL),)
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel
endif # TARGET_PREBUILT_KERNEL
endif # TARGET_KERNEL_CONFIG

file := $(INSTALLED_KERNEL_TARGET)
ALL_PREBUILT += $(file)
$(file): $(TARGET_PREBUILT_KERNEL) | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT)/lib/libhtc_ril.so
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/proprietary/libhtc_ril.so | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT)/lib/libhtc_acoustic.so
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/proprietary/libhtc_acoustic.so | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT)/lib/libaudioeq.so
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/proprietary/libaudioeq.so | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT_KEYLAYOUT)/h2w_headset.kl
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/h2w_headset.kl | $(ACP)
	$(transform-prebuilt-to-target)
    
file := $(TARGET_RECOVERY_ROOT_OUT)/etc/fstab
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/fstab | $(ACP)
	$(transform-prebuilt-to-target)
    
file := $(TARGET_OUT)/etc/fstab
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/fstab | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT_KEYLAYOUT)/desirec-keypad.kl
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/desirec-keypad.kl | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_ROOT_OUT)/init.desirec.rc
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/init.desirec.rc | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT)/etc/firmware/brf6350.bin
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/proprietary/brf6350.bin | $(ACP)
	$(transform-prebuilt-to-target)


# This will install the file in /system/etc
#
include $(CLEAR_VARS)
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE := AudioFilter.csv
LOCAL_SRC_FILES := proprietary/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE := AudioPreProcess.csv
LOCAL_SRC_FILES := proprietary/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE := AudioPara4.csv
LOCAL_SRC_FILES := proprietary/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE := vold.conf
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE := gps.conf
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)

# WiFi driver and firmware
local_target_dir := $(TARGET_OUT_ETC)/wifi

include $(CLEAR_VARS)
LOCAL_MODULE := Fw1251r1c.bin
LOCAL_MODULE_TAGS := user
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(local_target_dir)
LOCAL_SRC_FILES := proprietary/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := wlan.ko
LOCAL_MODULE_TAGS := user
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT)/lib/modules
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := liboemcamera.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_SRC_FILES := proprietary/$(LOCAL_MODULE)
OVERRIDE_BUILT_MODULE_PATH := $(TARGET_OUT_INTERMEDIATE_LIBRARIES)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libcamera.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_SRC_FILES := proprietary/$(LOCAL_MODULE)
OVERRIDE_BUILT_MODULE_PATH := $(TARGET_OUT_INTERMEDIATE_LIBRARIES)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libmm-adspsvc.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_SRC_FILES := proprietary/$(LOCAL_MODULE)
OVERRIDE_BUILT_MODULE_PATH := $(TARGET_OUT_INTERMEDIATE_LIBRARIES)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libOmxH264Dec.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_SRC_FILES := proprietary/$(LOCAL_MODULE)
OVERRIDE_BUILT_MODULE_PATH := $(TARGET_OUT_INTERMEDIATE_LIBRARIES)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libOmxMpeg4Dec.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_SRC_FILES := proprietary/$(LOCAL_MODULE)
OVERRIDE_BUILT_MODULE_PATH := $(TARGET_OUT_INTERMEDIATE_LIBRARIES)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libOmxVidEnc.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_SRC_FILES := proprietary/$(LOCAL_MODULE)
OVERRIDE_BUILT_MODULE_PATH := $(TARGET_OUT_INTERMEDIATE_LIBRARIES)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libgps.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_SRC_FILES := proprietary/$(LOCAL_MODULE)
OVERRIDE_BUILT_MODULE_PATH := $(TARGET_OUT_INTERMEDIATE_LIBRARIES)
include $(BUILD_PREBUILT)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/proprietary/libGLES_qcom.so:system/lib/egl/libGLES_qcom.so \
    $(LOCAL_PATH)/proprietary/libspeech.so:system/lib/libspeech.so \
    $(LOCAL_PATH)/proprietary/akmd:system/bin/akmd \
    $(LOCAL_PATH)/eri.xml:data/eri.xml \
    $(LOCAL_PATH)/sensors.desirec.so:system/lib/hw/sensors.desirec.so \
    $(LOCAL_PATH)/lights.msm7k.so:system/lib/hw/lights.msm7k.so \
    $(LOCAL_PATH)/desirec-keypad.kcm.bin:system/usr/keychars/desirec-keypad.kcm.bin \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml

ifeq ($(WITH_WINDOWS_MEDIA),true)
        PRODUCT_COPY_FILES += \
            $(LOCAL_PATH)/proprietary/pvasflocal.cfg:system/etc/pvasflocal.cfg \
            $(LOCAL_PATH)/proprietary/libomx_wmadec_sharedlibrary.so:system/lib/libomx_wmadec_sharedlibrary.so\
            $(LOCAL_PATH)/proprietary/libomx_wmvdec_sharedlibrary.so:system/lib/libomx_wmvdec_sharedlibrary.so\
            $(LOCAL_PATH)/proprietary/libpvasfcommon.so:system/lib/libpvasfcommon.so \
            $(LOCAL_PATH)/proprietary/libpvasflocalpbreg.so:system/lib/libpvasflocalpbreg.so \
            $(LOCAL_PATH)/proprietary/libpvasflocalpb.so:system/lib/libpvasflocalpb.so
endif
