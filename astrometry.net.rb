require 'formula'

class AstrometryNet < Formula
  homepage 'http://astrometry.net'
  url 'http://astrometry.net/downloads/astrometry.net-21172.tar.gz'
  version '21172'
  sha1 '3a214c5266f152ac6a38b940a1330fa6c8669fe4'

  head 'http://astrometry.net/svn/trunk/src/astrometry', :using => :svn

  depends_on 'wget'
  depends_on 'swig'
  depends_on 'pkg-config'
  depends_on 'netpbm'
  depends_on 'cairo'
  depends_on 'jpeg'
  depends_on 'libpng'

  # from pip
  depends_on 'pyfits' => :python

  # needs "brew tap camphogg/science"
  depends_on 'wcslib'

  def install
    # ENV.j1  # if your formula's build system can't parallelize

    ENV['INSTALL_DIR'] = "#{prefix}"
    ENV['NETPBM_INC'] = "#{HOMEBREW_PREFIX}/include/netpbm"

    system "make"
    system "make extra"
    system "make py"
    system "make install"
  end

  def test
    system "solve-field"
  end
end
