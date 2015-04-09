class Datrie < Formula
  homepage 'http://linux.thai.net/projects/datrie'
  url 'ftp://linux.thai.net/pub/ThaiLinux/software/libthai/libdatrie-0.2.4.tar.gz'
  sha256 'b2acfbfd9df07780f91352bc1bb16e4d8a32772dc9194bbc35ae600e0591dfa2'
  head 'http://linux.thai.net/svn/software/datrie', :using => :svn

  def install
    args = %W[
      --disable-dependency-tracking
      --prefix=#{prefix}
    ]

    system './configure', *args
    system 'make install'
  end
end
