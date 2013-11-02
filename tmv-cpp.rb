require 'formula'

class TmvCpp < Formula
  homepage 'http://code.google.com/p/tmv-cpp/'
  url 'http://tmv-cpp.googlecode.com/files/tmv0.71.tar.gz'
  sha1 'd407748ff4f6a0689edca006b070ff883ec59bbe'

  depends_on 'scons' => :build

  def install
    # ENV.j1  # if your formula's build system can't parallelize
    system "scons WITH_OPENMP=false"
    system "scons install PREFIX=#{prefix}"
  end
end
