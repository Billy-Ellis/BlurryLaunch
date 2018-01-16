ARCHS = armv7 arm64 

include theos/makefiles/common.mk

TWEAK_NAME = BlurryLaunch
BlurryLaunch_FILES = Tweak.xm
BlurryLaunch_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += blurrylaunch
include $(THEOS_MAKE_PATH)/aggregate.mk
