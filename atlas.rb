require 'formula'

class Atlas < Formula
  homepage 'http://math-atlas.sourceforge.net/'
  url 'http://dl.sourceforge.net/project/math-atlas/Stable/3.10.0/atlas3.10.0.tar.bz2'
  sha1 '085e8219d01626485079b785309d4d6502ab1ac0'

  def install
    ENV.j1 # Atlas does its own parallel build
    ENV.fortran # pull in gfortran
    # set FC environment variable to use different gfortran

    system "mkdir -p BUILD"
    cd "BUILD"
    # HACK -- pull in netlib LAPACK
    system "curl", "-C", "-", "-o", "lapack-3.4.2.tgz", "http://www.netlib.org/lapack/lapack-3.4.2.tgz"
    # This was failing for me [dstn]... but then we don't get dynamic libs!
    #    "--shared",
    system "../configure",
        "--with-netlib-lapack-tarfile=" + pwd() + "/lapack-3.4.2.tgz",
        "--prefix=#{prefix}"
    system "make build"
    system "make check"
    # system "make time"
    system "make install"
  end
end

