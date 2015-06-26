class Libstemmer < Formula
  homepage "http://snowball.tartarus.org"
  url "http://snowball.tartarus.org/dist/libstemmer_c.tgz"
  sha1 "1ac6bb16e829e9f3a58f62c27047c26784975aa1"
  version "0.1.0"

  def install
    # Hardcorded include path :<
    build_dir = Dir.pwd
    inreplace "Makefile" do |s|
      s.gsub! "-Iinclude", "-I #{build_dir}/include -Wall -fPIC"
    end
    source_args = %Q(-O2 -Wall -fPIC)
    shared_args = %Q(-fPIC -shared)

    system "make"
    system "#{ENV.cc} #{source_args} -force_load #{build_dir}/libstemmer.o #{shared_args} -o #{build_dir}/libstemmer.dylib"
    mv "#{build_dir}/libstemmer.o", "#{build_dir}/libstemmer.a"
    include.install "include/libstemmer.h"
    bin.install "stemwords"
    lib.install "libstemmer.dylib"
    lib.install "libstemmer.a"
  end
end
