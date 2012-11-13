require 'formula'

class Htt < Formula
  homepage 'http://htt.sourceforge.net/'
  url 'http://sourceforge.net/projects/htt/files/htt2.2/httest-2.2.11/httest-2.2.11.tar.gz'
  sha1 'fee2ef8a3ffd3ac9fd6b4d3378dc484c19ae5e94'
  version '2.2.11'

  option 'with-lua', "Compile with Lua support"

  depends_on 'pcre'
#* libapr-1
#* libapr-util-1
#* libssl
  depends_on 'lua' if build.include? 'with-lua'

  def install
    args = %W[
      --prefix=#{prefix}
    ]

    args << "--enable-lua-module" if build.include? 'with-lua'

    system "./configure", *args
    system "make install"
  end
end
