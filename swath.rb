class Swath < Formula
  homepage "http://www.cs.cmu.edu/~paisarn/software.html"
  url "ftp://linux.thai.net/pub/thailinux/software/swath/swath-0.5.3.tar.xz"
  sha256 "24d4c7b4184c0ffde10af5b7e36ccba82f3cf7e7b7845af51b53eb0b2397a136"
  head "http://linux.thai.net/svn/software/swath/trunk", :using => :svn

  depends_on "pkg-config" => :build
  depends_on "libtool" => :build
  depends_on "cosmo0920/tokenizers/datrie"

  def install
    args = %W[
      --disable-dependency-tracking
      --prefix=#{prefix}
    ]

    system "./autogen.sh" if build.head?
    system "./configure", *args
    system "make install"
  end
end
