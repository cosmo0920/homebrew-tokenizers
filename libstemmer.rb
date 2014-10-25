require "formula"

class Libstemmer < Formula
  homepage "http://snowball.tartarus.org"
  url "http://snowball.tartarus.org/dist/libstemmer_c.tgz"
  sha1 "9b0f120a68a3c688b2f5a8d0f681620465c29d38"

  def install
    # Hardcorded include path :<
    build_dir = Dir.pwd
    inreplace "Makefile" do |s|
      s.gsub! "-Iinclude", "-I #{build_dir}/include"
    end
    source_args = %Q(-O2 -Wall -fPIC)
    shared_args = %Q(-fPIC -shared)

    system "make"
    system "#{ENV.cc} #{source_args} #{build_dir}/libstemmer.o #{shared_args} -o #{build_dir}/libstemmer.dylib"
    system "mv #{build_dir}/libstemmer.o #{build_dir}/libstemmer.a"
    include.install "include"
    bin.install "stemwords"
    lib.install "libstemmer.dylib"
    lib.install "libstemmer.a"
  end
end
