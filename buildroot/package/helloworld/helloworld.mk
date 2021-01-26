#
# helloworld
# basic building rules
#
HELLOWORLD_VERSION = 1.1
HELLOWORLD_SOURCE = helloworld-$(HELLOWORLD_VERSION).tar.gz
HELLOWORLD_SITE = http://helloworld.com/dl/$(HELLOWORLD_SOURCE)

HELLOWORLD_INSTALL_STAGING = YES

define HELLOWORLD_BUILD_CMDS
    $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
endef

define HELLOWORLD_INSTALL_STAGING_CMDS
    $(MAKE) DESTDIR=$(STAGING_DIR) -C $(@D) install
endef

define HELLOWORLD_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/helloworld \
                          $(TARGET_DIR)/bin/helloworld
endef

$(eval $(call GENTARGETS,package,helloworld))
