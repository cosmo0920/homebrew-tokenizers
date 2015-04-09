require "formula"

class Friso < Formula
  homepage "https://code.google.com/p/friso/"
  url "http://downloads.sourceforge.net/project/friso/friso-1.6.1-src-dict.zip"
  sha256 "768ef0c92272355ea3e411b0dfaec26cc6f3b244ee96e4a72c35fbd6e5333cef"

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
    inreplace "friso.ini" do |s|
      s.gsub! "/c/products/friso/dict/UTF-8/", "/usr/local/share/friso/dict/UTF-8/"
    end
    system "cd src && make share && make friso"

    # install header && library && binary
    (include/"friso").install "src/friso.h"
    (include/"friso").install "src/friso_API.h"
    lib.install "src/libfriso.dylib"
    bin.install "src/friso"
    (etc/"friso").install "friso.ini"
    (share/"friso").install "dict"
  end
end
