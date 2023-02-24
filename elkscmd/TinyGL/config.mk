#####################################################################
# C compiler

ifeq ("$(TOPDIR)","")
   TOPDIR=$(HOME)/Projects/elks
endif

BASEDIR = $(TOPDIR)/elkscmd
include $(BASEDIR)/Make.defs

CFLAGS += -I$(TOPDIR)/elkscmd/nano-X
LFLAGS := $(LDFLAGS)

# ELKS
#CC=$(TOPDIR)/cross/bin/ia16-elf-gcc
#CFLAGS=-fno-inline -melks-libc -mcmodel=small -mno-segment-relocation-stuff -mtune=i8086 -Wall -Os -Wno-implicit-int -Wno-parentheses  -I$(TOPDIR)/include -I$(TOPDIR)/libc/include -I$(TOPDIR)/elks/include -D__ELKS__ -DELKS_VERSION=\"0.6.0\" -I$(TOPDIR)/elkscmd/nano-X
#LFLAGS=-fno-inline -melks-libc -mcmodel=small -mno-segment-relocation-stuff -mtune=i8086 -Wall -Os 

# linux
#CC= gcc
#CFLAGS= -g -Wall -O2
#LFLAGS=

# for BeOS PPC
#CC= mwcc
#CFLAGS= -I. -i-
#LFLAGS=

#####################################################################
# TinyGL configuration 

#####################################################################
# Select window API for TinyGL: 

# standard X11 GLX like API 
#TINYGL_USE_GLX=y

# BEOS API
#TINYGL_USE_BEOS=y

# Micro Windows NanoX API
TINYGL_USE_NANOX=y

#####################################################################
# X11 configuration (for the examples only)

ifdef TINYGL_USE_GLX
# Linux
UI_LIBS= -L/usr/X11R6/lib -lX11 -lXext
UI_INCLUDES= 
# Solaris
#UI_LIBS= -L/usr/X11/lib -lX11 -lXext -lsocket -lnsl
#UI_INCLUDES= 

UI_OBJS=x11.o
endif

#####################################################################
# Micro windowX11 configuration (for the examples only)

ifdef TINYGL_USE_NANOX
UI_LIBS= -L$(TOPDIR)/elkscmd/nano-X -lnano-X
#-lmwengine -lmwdrivers -lmwfonts
UI_INCLUDES=

# X11 target for nanoX
#UI_LIBS+= -L/usr/X11R6/lib -lX11 -lXext

UI_OBJS=nanox.o 
endif

#####################################################################
# OpenGL configuration (for the examples only)

# use TinyGL 
GL_LIBS= -L../lib -lTinyGL 
GL_INCLUDES= -I../include
#GL_DEPS= ../lib/libTinyGL.a

# use Mesa
#GL_LIBS= -lMesaGL 
#GL_INCLUDES= 
#GL_DEPS=

# use OpenGL
#GL_LIBS= -lGL 
#GL_INCLUDES= 
#GL_DEPS=

####################################################################
# Compile and link control

# UNIX systems
DIRS= src examples

# BeOS
# DIRS= src BeOS
