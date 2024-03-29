########################################################################
# Makefile for Nanotech Construction Kit, an interactive molecular
# dynamics simulation.
# Copyright (c) 2008-2011 Oliver Kreylos
#
# This file is part of the WhyTools Build Environment.
# 
# The WhyTools Build Environment is free software; you can redistribute
# it and/or modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2 of the
# License, or (at your option) any later version.
# 
# The WhyTools Build Environment is distributed in the hope that it will
# be useful, but WITHOUT ANY WARRANTY; without even the implied warranty
# of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with the WhyTools Build Environment; if not, write to the Free
# Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
# 02111-1307 USA
########################################################################

# Directory containing the Vrui build system. The directory below
# matches the default Vrui installation; if Vrui's installation
# directory was changed during Vrui's installation, the directory below
# must be adapted.
#VRUI_MAKEDIR := $(HOME)/Vrui-2.2/share/make
VRUI_MAKEDIR := /usr/local/packages/Vrui/2.2-003/share/make

# Base installation directory for the example programs. If this is set
# to the default of $(PWD), the example programs do not have to be
# installed to be run. Created executables and resources will be
# installed in the bin and share directories under the given base
# directory, respectively.
# Important note: Do not use ~ as an abbreviation for the user's home
# directory here; use $(HOME) instead.
#INSTALLDIR := $(shell pwd)
INSTALLDIR := /usr/local/packages/NCK/1.6

########################################################################
# Everything below here should not have to be changed
########################################################################

# Version number for installation subdirectories. This is used to keep
# subsequent release versions of the Nanotech Construction Kit from
# clobbering each other. The value should be identical to the
# major.minor version number found in VERSION in the root package
# directory.
VERSION = 1.6

# Set up resource directories: */
CONFIGDIR = etc/NCK-$(VERSION)

# Include definitions for the system environment and system-provided
# packages
include $(VRUI_MAKEDIR)/SystemDefinitions
include $(VRUI_MAKEDIR)/Packages.System
include $(VRUI_MAKEDIR)/Configuration.Vrui
include $(VRUI_MAKEDIR)/Packages.Vrui

# Set installation directory structure:
EXECUTABLEINSTALLDIR = $(INSTALLDIR)/$(EXEDIR)
ETCINSTALLDIR = $(INSTALLDIR)/$(CONFIGDIR)

########################################################################
# List common packages used by all components of this project
# (Supported packages can be found in $(VRUI_MAKEDIR)/Packages.*)
########################################################################

PACKAGES = MYVRUI

########################################################################
# Specify all final targets
########################################################################

ALL = $(EXEDIR)/NanotechConstructionKit

PHONY: all
all: $(ALL)

########################################################################
# Specify other actions to be performed on a `make clean'
########################################################################

.PHONY: extraclean
extraclean:

.PHONY: extrasqueakyclean
extrasqueakyclean:

# Include basic makefile
include $(VRUI_MAKEDIR)/BasicMakefile

########################################################################
# Specify build rules for executables
########################################################################

NANOTECHCONSTRUCTIONKIT_SOURCES = $(wildcard *.cpp)

$(OBJDIR)/NanotechConstructionKit.o: CFLAGS += -DNANOTECHCONSTRUCTIONKIT_CFGFILENAME='"$(ETCINSTALLDIR)/NCK.cfg"'

$(EXEDIR)/NanotechConstructionKit: $(NANOTECHCONSTRUCTIONKIT_SOURCES:%.cpp=$(OBJDIR)/%.o)
.PHONY: NanotechConstructionKit
NanotechConstructionKit: $(EXEDIR)/NanotechConstructionKit

install: $(ALL)
	@echo Installing Nanotech Construction Kit in $(INSTALLDIR)...
	@install -d $(INSTALLDIR)
	@install -d $(EXECUTABLEINSTALLDIR)
	@install $(ALL) $(EXECUTABLEINSTALLDIR)
	@install -d $(ETCINSTALLDIR)
	@install -m u=rw,go=r $(CONFIGDIR)/NCK.cfg $(ETCINSTALLDIR)
