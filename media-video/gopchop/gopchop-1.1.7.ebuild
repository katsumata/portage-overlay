# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="GOPchop is a tool for losslessly cutting and merging hardware-encoded MPEG2 video files"

HOMEPAGE="http://gopchop.sourceforge.net/"
SRC_URI="mirror://sourceforge/gopchop/${P}.tar.gz"
LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="sdl X"

DEPEND=">=media-libs/libmpeg2-0.4.0
		sdl? ( media-libs/libsdl )
		X? ( virtual/x11
			 >=x11-libs/gtk+-1.2* )"

src_compile() {
	econf $(use_enable sdl) $(use_with X x) || die "econf failed"
	emake prefix="/usr" || die "emake failed"
}

src_install() {
	make DESTDIR=${D} install || die

	dodoc README COPYING ChangeLog AUTHORS TODO
}
