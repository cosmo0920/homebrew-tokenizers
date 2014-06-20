require "formula"

class Friso < Formula
  homepage "https://code.google.com/p/friso/"
  url "https://friso.googlecode.com/files/friso-1.6.0-src-lib-dict.zip"
  sha256 "8d97859fb3cb1711193a3076b3a471f55a297a5cda59ba14a19b43e4a647ce91"

  head do
    url "http://git.oschina.net/lionsoul/friso.git"
  end

  def install
    # Hardcorded install path
    build_dir = Dir.pwd
    inreplace "src/Makefile" do |s|
      s.change_make_var! "CC", ENV.cc
      s.change_make_var! "LIBRARY_DIR", "#{prefix}/lib"
      s.change_make_var! "INCLUDE_DIR", "#{prefix}/include/friso"
      s.change_make_var! "INSTALL_DIR", "#{prefix}/bin"
      s.change_make_var! "LIB_FILE", "libfriso.dylib"
      s.gsub! "-L.", "-L #{build_dir}/src"
    end
    system "cd src && make share && make friso"

    # install header && library && binary
    (include/"friso").install "src/friso.h"
    lib.install "src/libfriso.dylib"
    bin.install "src/friso"
    (etc/"friso").install "friso.ini"
  end
end
