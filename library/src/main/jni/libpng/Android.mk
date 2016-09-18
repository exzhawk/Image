# Copyright 2015 Hippo Seven
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := png
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
LOCAL_SRC_FILES := \
    png.c \
    pngerror.c \
    pngget.c \
    pngmem.c \
    pngpread.c \
    pngread.c \
    pngrio.c \
    pngrtran.c \
    pngrutil.c \
    pngset.c \
    pngtrans.c
LOCAL_CFLAGS :=
LOCAL_EXPORT_LDLIBS := -lz
LOCAL_STATIC_LIBRARIES :=

ifeq ($(TARGET_ARCH_ABI), armeabi-v7a)
    LOCAL_SRC_FILES += \
        arm/arm_init.c \
        arm/filter_neon.S \
        arm/filter_neon_intrinsics.c
    LOCAL_CFLAGS += -DPNG_ARM_NEON_OPT=2
    LOCAL_STATIC_LIBRARIES += cpufeatures
else ifeq ($(TARGET_ARCH_ABI), arm64-v8a)
    LOCAL_SRC_FILES += \
        arm/arm_init.c \
        arm/filter_neon.S \
        arm/filter_neon_intrinsics.c
    LOCAL_CFLAGS += -DPNG_ARM_NEON_OPT=2
    LOCAL_STATIC_LIBRARIES := cpufeatures
endif

include $(BUILD_STATIC_LIBRARY)
