require 'formula'

class Swath < Formula
  homepage 'http://www.cs.cmu.edu/~paisarn/software.html'
  url 'ftp://linux.thai.net/pub/thailinux/software/swath/swath-0.5.2.tar.xz'
  sha256 '233ef8effa5d21bfe4798b6f415ccbdd4460bf02e9e6cbb769d7585d6cf2fa1d'
  head 'http://linux.thai.net/svn/software/swath/trunk', :using => :svn

  depends_on 'pkg-config' => :build
  depends_on 'libtool'
  depends_on 'cosmo0920/tokenizers/datrie'

  def install
    args = %W[
      --disable-dependency-tracking
      --prefix=#{prefix}
    ]

    system './autogen.sh' if build.head?
    system './configure', *args
    system 'make install'
  end
end
