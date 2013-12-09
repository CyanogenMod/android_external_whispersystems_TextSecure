LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := thoughtcrimegson
LOCAL_SDK_VERSION := 8
LOCAL_SRC_FILES := $(call all-java-files-under, ../../../gson/src/main/java)
LOCAL_JARJAR_RULES := $(LOCAL_PATH)/gson-jarjar-rules.txt

include $(BUILD_STATIC_JAVA_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := TextSecureLibrary
LOCAL_SDK_VERSION := 8
LOCAL_SRC_FILES := $(call all-java-files-under, src)
LOCAL_STATIC_JAVA_LIBRARIES := libphonenumbergoogle thoughtcrimegson spongycastle-light-jdk15on protobuf-java-2.4.1

LOCAL_STATIC_LIBRARIES := libcurve25519-donna libcurve25519
LOCAL_ADDITIONAL_DEPENDENCIES += libcurve25519

include $(BUILD_STATIC_JAVA_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := libs/protobuf-java-2.4.1.jar
LOCAL_MODULE := protobuf-java-2.4.1
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT)/fake_packages/$(LOCAL_SRC_FILES)

include $(BUILD_PREBUILT)

include $(call all-makefiles-under,$(LOCAL_PATH))
