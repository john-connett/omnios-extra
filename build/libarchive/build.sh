#!/usr/bin/bash
#
# {{{ CDDL HEADER
#
# This file and its contents are supplied under the terms of the
# Common Development and Distribution License ("CDDL"), version 1.0.
# You may only use this file in accordance with the terms of version
# 1.0 of the CDDL.
#
# A full copy of the text of the CDDL should have accompanied this
# source. A copy of the CDDL is also available via the Internet at
# http://www.illumos.org/license/CDDL.
# }}}

# Copyright 2019 OmniOS Community Edition (OmniOSce) Association.

. ../../lib/functions.sh

PROG=libarchive
VER=3.4.1
PKG=ooce/library/libarchive
SUMMARY="libarchive"
DESC="Multi-format archive and compression library"

OPREFIX=$PREFIX
PREFIX+="/$PROG"

XFORM_ARGS="
    -DPREFIX=${PREFIX#/}
    -DOPREFIX=${OPREFIX#/}
    -DPROG=$PROG
"

reset_configure_opts

CONFIGURE_OPTS="
    --disable-static
"

CONFIGURE_OPTS_32+="
    --libdir=$OPREFIX/lib
"
CONFIGURE_OPTS_64+="
    --bindir=$PREFIX/bin
    --libdir=$OPREFIX/lib/$ISAPART64
"

SKIP_LICENCES=various

init
download_source $PROG $PROG $VER
prep_build
patch_source
build
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:fdm=marker
