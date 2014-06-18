require 'formula'

class Juman < Formula
  homepage 'http://nlp.ist.i.kyoto-u.ac.jp/index.php?JUMAN'
  url 'http://nlp.ist.i.kyoto-u.ac.jp/nl-resource/juman/juman-7.0.tar.bz2'
  sha256 'c1df70ad34bd76c0d203c046af2884de87ed8bec74b63ef3075ae9335426e72c'

  def install
    args = %W[
      --disable-dependency-tracking
      --prefix=#{prefix}
    ]

    system './configure', *args
    system 'make install'
  end
end
