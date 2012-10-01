require 'formula'

class GalSim < Formula
  homepage 'https://github.com/GalSim-developers/GalSim'
  url 'https://github.com/GalSim-developers/GalSim/tarball/v0.1'
  sha1 '5fd6b4b93d2aafa854b528ecc8d2a59fb7ff0e64'
  head 'https://github.com/GalSim-developers/GalSim.git'

  depends_on 'scons' => :build
  depends_on 'fftw'
  depends_on 'boost'
  depends_on 'tmv-cpp'

  def install
    # This ought to be part of a standard homebrew install;
    # required so that homebrew creates symlinks
    #   lib/python/galsim -> Cellar/gal-sim/0.1/lib/python/galsim
    # rather than
    #   lib/python -> Cellar/gal-sim/0.1/lib/python
    mkdir_p "#{HOMEBREW_PREFIX}/lib/python"
    system "scons"
    system "scons install PREFIX=#{prefix} PYPREFIX=#{lib}/python"

    ohai ""
    ohai "The GalSim installer may warn you that #{lib}/python isn't in your python search path."
    ohai "You may want to add all Homebrew python packages to the default paths by running:"
    ohai "   sudo bash -c 'echo \"/usr/local/lib/python\" >> \\\\"
    ohai "     /Library/Python/$(python -c \"import sys; print sys.version[:3]\")/site-packages/homebrew.pth'"
    ohai "Which will create the file   /Library/Python/2.7/site-packages/homebrew.pth"
    ohai "  (with 2.7 replaced by the major version of your python)"
    ohai "with contents:"
    ohai "  /usr/local/lib/python"
    ohai ""
  end
end
