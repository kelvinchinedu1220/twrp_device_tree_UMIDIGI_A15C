# BACKUP REPLACE FILE

# BACKUP REPLACE FILE

#
# Copyright (C) 2025 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),A15C)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
