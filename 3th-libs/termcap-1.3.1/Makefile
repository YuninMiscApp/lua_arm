# Generated automatically from Makefile.in by configure.
# Makefile for GNU termcap library.
# Copyright (C) 1992, 1993, 1994 Free Software Foundation, Inc.

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2, or (at your option)
# any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

#### Start of system configuration section. ####

srcdir = .

CC ?= gcc
AR ?= ar
RANLIB ?= ranlib

INSTALL = /usr/bin/install -c
INSTALL_DATA = ${INSTALL} -m 644

MAKEINFO = makeinfo

DEFS =  -DHAVE_STRING_H=1 -DHAVE_UNISTD_H=1 -DSTDC_HEADERS=1  -DTERMCAP_FILE=\"$(termcapfile)\"

CFLAGS ?= -g

prefix ?= /usr/local
exec_prefix = ${prefix}

# Directory in which to install libtermcap.a.
libdir = $(exec_prefix)/lib

# Directory in which to install termcap.h.
includedir = $(prefix)/include

# Directory in which to optionally also install termcap.h,
# so compilers besides gcc can find it by default.
# If it is empty or not defined, termcap.h will only be installed in
# includedir. 
oldincludedir = /usr/include


# File to which `install-data' should install the data file
# if --enable-install-termcap was given.
termcapfile = /etc/termcap

#### End of system configuration section. ####

SHELL = /bin/sh

SRCS = termcap.c tparam.c version.c
OBJS = termcap.o tparam.o version.o
HDRS = termcap.h


all:	libtermcap.a libtermcap.so

.c.o:
	$(CC) -c $(CPPFLAGS) $(DEFS) -I. -I$(srcdir) $(CFLAGS) $<

install: all installdirs 
	$(INSTALL_DATA) libtermcap.a $(libdir)/libtermcap.a
	$(INSTALL_DATA) libtermcap.so $(libdir)/libtermcap.so
	-$(RANLIB) $(libdir)/libtermcap.a
	cd $(srcdir); $(INSTALL_DATA) termcap.h $(includedir)/termcap.h

uninstall: 
	rm -f $(libdir)/libtermcap.a $(libdir)/libtermcap.so $(includedir)/termcap.h

# These are separate targets to avoid trashing the user's existing
# termcap file unexpectedly.
install-data:
	$(INSTALL_DATA) ${srcdir}/termcap.src ${termcapfile}

uninstall-data:
	rm -f ${termcapfile}

installdirs:
	$(SHELL) ${srcdir}/mkinstalldirs $(bindir) $(libdir) \
	$(includedir) $(infodir)



libtermcap.a: $(OBJS)
	$(AR) rc $@ $(OBJS)
	-$(RANLIB) $@
	
libtermcap.so: $(OBJS)
	$(CC) -shared -o $@ $(OBJS)
	
TAGS:	$(SRCS)
	etags $(SRCS)

clean:
	rm -f *.a *.o core *.so *.bak

mostlyclean: clean

distclean: clean
