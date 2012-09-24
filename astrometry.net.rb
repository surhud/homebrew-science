require 'formula'

class AstrometryNet < Formula
  homepage 'http://astrometry.net'
  url 'http://astrometry.net/downloads/astrometry.net-21399.tar.gz'
  sha1 '73b335bcbbe55a354f66dac73dab86f3ed8189bd'

  head 'http://astrometry.net/svn/trunk/src/astrometry', :using => :svn

  depends_on 'wget'
  depends_on 'swig' => :build
  depends_on 'pkg-config' => :build
  depends_on 'netpbm'
  depends_on 'cairo'
  depends_on 'jpeg'
  depends_on 'libpng'

  # from pip
  depends_on 'pyfits' => :python

  # needs "brew tap camphogg/science"
  # or soon maybe "brew tap homebrew/science"
  depends_on 'wcslib'

  def install
    ENV['INSTALL_DIR'] = "#{prefix}"
    ENV['NETPBM_INC'] = "-I#{HOMEBREW_PREFIX}/include/netpbm"
    ENV['NETPBM_LIB'] = "-L#{HOMEBREW_PREFIX}/lib -lnetpbm"

    system "make"
    system "make extra"
    system "make py"
    system "make install"
  end

  def test
    system "solve-field"
  end
end
