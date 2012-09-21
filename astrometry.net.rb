require 'formula'

class AstrometryNet < Formula
  homepage 'http://astrometry.net'
  url 'http://astrometry.net/downloads/astrometry.net-21172.tar.gz'
  version '21172'
  sha1 '3a214c5266f152ac6a38b940a1330fa6c8669fe4'

  depends_on 'wget'
  depends_on 'swig'
  depends_on 'pkg-config'
  depends_on 'netpbm'
  depends_on 'cairo'
  depends_on 'jpeg'
  depends_on 'libpng'
  depends_on 'wcslib'

  def install
    # ENV.j1  # if your formula's build system can't parallelize
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    system "make"
    system "make extra"
    system "make py"
    system "make install INSTALL_DIR=#{prefix}"
  end

  def test
    system "solve-field"
  end
end
