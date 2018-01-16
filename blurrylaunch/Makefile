ARCHS = armv7 arm64 
include theos/makefiles/common.mk

BUNDLE_NAME = BlurryLaunch
BlurryLaunch_FILES = BlurryLaunch.mm
BlurryLaunch_INSTALL_PATH = /Library/PreferenceBundles
BlurryLaunch_FRAMEWORKS = UIKit
BlurryLaunch_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/BlurryLaunch.plist$(ECHO_END)
