#
# GNUmakefile - Generated by ProjectCenter
#
ifeq ($(GNUSTEP_MAKEFILES),)
 GNUSTEP_MAKEFILES := $(shell gnustep-config --variable=GNUSTEP_MAKEFILES 2>/dev/null)
endif
ifeq ($(GNUSTEP_MAKEFILES),)
 $(error You need to set GNUSTEP_MAKEFILES before compiling!)
endif

include $(GNUSTEP_MAKEFILES)/common.make

#
# Application
#
VERSION = 0.1
PACKAGE_NAME = PaperScan
APP_NAME = PaperScan
PaperScan_APPLICATION_ICON = 
ifeq ($(FOUNDATION_LIB), apple)
PaperScan_MAIN_MARKUP_FILE = MainMenu-OSX.gsmarkup
else
PaperScan_MAIN_MARKUP_FILE = MainMenu-GNUstep.gsmarkup
endif


#
# Resource files
#
PaperScan_RESOURCE_FILES = \
Resources/Main.gsmarkup

ifeq ($(FOUNDATION_LIB), apple)
PaperScan_RESOURCE_FILES += Resources/MainMenu-OSX.gsmarkup
else
PaperScan_RESOURCE_FILES += Resources/MainMenu-GNUstep.gsmarkup
endif


#
# Header files
#
PaperScan_HEADER_FILES = \
AppController.h \
ScannerController.h

#
# Class files
#
PaperScan_OBJC_FILES = \
AppController.m \
ScannerController.m

#
# Other sources
#
PaperScan_OBJC_FILES += \
PaperScan.m 

#
# Makefiles
#
-include GNUmakefile.preamble
include $(GNUSTEP_MAKEFILES)/application.make
-include GNUmakefile.postamble
