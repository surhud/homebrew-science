require 'formula'

class TarIgnoreDuplicates < CurlDownloadStrategy
  def stage
    #Homebrew.system('/usr/bin/tar', 'xkf', @tarball_path)
    safe_system '/usr/bin/tar', 'xkf', @tarball_path, '--exclude', '*/man'
    chdir
  end
end

class Wcstools < Formula
  homepage 'http://tdc-www.harvard.edu/wcstools/'
  url 'http://tdc-www.harvard.edu/software/wcstools/wcstools-3.8.6.tar.gz', :using => TarIgnoreDuplicates
  #version '3.8.6'
  sha1 '2c42eb314d422ccd9c3f1999ac2642e9de480b4c'

  def install
    system "make all"

    bin.install Dir['bin/*']
    lib.install 'libwcs/libwcs.a', 'libned/libned.a'
    #mkdir '#{prefix}/include/libwcs'
    #mkdir '#{prefix}/include/libned'
    (include + 'libwcs').install Dir['libwcs/*.h']
    (include + 'libned').install Dir['libned/*.h']
    man1.install Dir['man/man1/*']
  end

  def test
    system "true"
  end
end
