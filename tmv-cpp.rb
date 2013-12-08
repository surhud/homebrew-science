require 'formula'

class TmvCpp < Formula
  homepage 'http://code.google.com/p/tmv-cpp/'
  url 'http://tmv-cpp.googlecode.com/files/tmv0.71.tar.gz'
  sha1 'd407748ff4f6a0689edca006b070ff883ec59bbe'

  depends_on 'scons' => :build

  def install
    cmd = "scons"
    if ENV.compiler == :clang
      # xcode 5.0.1's clang doesn't support OpenMP
      cmd << " WITH_OPENMP=false"
    end
    system cmd
    system "scons install PREFIX=#{prefix}"
  end
end
