class Datrie < Formula
  homepage "http://linux.thai.net/projects/datrie"
  url "ftp://linux.thai.net/pub/ThaiLinux/software/libthai/libdatrie-0.2.4.tar.gz"
  sha256 "b2acfbfd9df07780f91352bc1bb16e4d8a32772dc9194bbc35ae600e0591dfa2"
  head "http://linux.thai.net/svn/software/datrie/trunk", :using => :svn

  depends_on :automake => :build if build.head?
  depends_on :autoconf => :build if build.head?
  depends_on :libtool  => :build if build.head?

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
