#
# settings for gnu-compatible platforms
#

#
# Tools
#
CXX = g++
CC = gcc
MAKEDEPEND = $(CXX) -MM -MG
CMAKEDEPEND = $(CC) -MM -MG

RANLIB = ranlib


#
# General Flags
#

DEBUG_CFLAGS = -g
OPT_CFLAGS = -O3
PROFILE_CFLAGS = -pg
PROFILE_LFLAGS = -pg

ifdef CHPL_GCOV
CFLAGS += -fprofile-arcs -ftest-coverage
LDFLAGS += -fprofile-arcs
endif


#
# Flags for compiler, runtime, and generated code
#
COMP_CFLAGS = $(CFLAGS)
COMP_CFLAGS_NONCHPL = -Wno-error
RUNTIME_CFLAGS = -std=c99 $(CFLAGS)
GEN_CFLAGS = -std=c99

#
# a hacky flag necessary currently due to our use of setenv in the runtime code
#
SUPPORT_SETENV_CFLAGS = -std=gnu89

#
# Flags for turning on warnings for C++/C code
#
WARN_CXXFLAGS = -Wall -Werror -Wpointer-arith -Wwrite-strings
WARN_CFLAGS = $(WARN_CXXFLAGS) -Wmissing-declarations -Wmissing-prototypes -Wstrict-prototypes -Wnested-externs -Wdeclaration-after-statement -Wmissing-format-attribute
WARN_GEN_CFLAGS = $(WARN_CFLAGS) -Wno-unused

#
# developer settings
#
ifdef CHPL_DEVELOPER
COMP_CFLAGS += $(WARN_CXXFLAGS)
RUNTIME_CFLAGS += $(WARN_CFLAGS)
# GEN_CFLAGS gets warnings added via WARN_GEN_CFLAGS in comp-generated Makefile
endif
