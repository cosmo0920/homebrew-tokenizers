require 'formula'

class CjkTokenizer < Formula
  homepage 'https://github.com/rboulton/cjk-tokenizer'
  url 'https://github.com/rboulton/cjk-tokenizer/archive/eb7ec18aabcbc9368542f64dab0ed8f424d52290.zip'
  sha256 'df1f1e635705f8dcb468c4c4f3e60f1be6b4464afda3688b1a587f781fcea0ed'

  depends_on 'xapian'

  def install
    inreplace 'cjk-tokenizer/Makefile' do |s|
      s.change_make_var! 'CPP', ENV.cxx

      # Now change all /usr/local at once to the prefix
      s.gsub! '/usr/local', prefix
    end
    system 'cd cjk-tokenizer && make'
    lib.install 'cjk-tokenizer/libcjk-tokenizer.a'
    include.install 'cjk-tokenizer/cjk-hanconvert.h'
    include.install 'cjk-tokenizer/cjk-tokenizer.h'
  end
end
