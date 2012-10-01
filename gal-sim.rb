require 'formula'

class GalSim < Formula
  homepage 'https://github.com/GalSim-developers/GalSim'
  url 'https://github.com/GalSim-developers/GalSim/tarball/v0.1'
  head 'https://github.com/GalSim-developers/GalSim'

  depends_on 'scons' => :build
  depends_on 'fftw'
  depends_on 'tmv-cpp'
  depends_on 'boost'

  def install
    # This ought to be part of a standard homebrew install;
    # required so that homebrew creates symlinks
    #   lib/python/galsim -> Cellar/gal-sim/0.1/lib/python/galsim
    # rather than
    #   lib/python -> Cellar/gal-sim/0.1/lib/python
    mkdir_p "#{HOMEBREW_PREFIX}/lib/python"
    system "scons"
    system "scons install PREFIX=#{prefix} PYPREFIX=#{prefix}/lib/python"
  end
end
