require 'formula'

class Wcslib < Formula
  homepage 'http://www.atnf.csiro.au/people/mcalabre/WCS/'
  url 'ftp://ftp.atnf.csiro.au/pub/software/wcslib/wcslib-4.16.tar.bz2'
  sha1 'd321ee3c82ecb14e447006ed475f3f0217aa589f'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    ENV.deparallelize
    system "make"
    system "make install"
  end
end
