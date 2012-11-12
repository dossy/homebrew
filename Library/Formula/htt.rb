require 'formula'

class Htt < Formula
  homepage 'http://htt.sourceforge.net/'
  url 'http://sourceforge.net/projects/htt/files/htt2.2/httest-2.2.11/httest-2.2.11.tar.gz'
  sha1 'fee2ef8a3ffd3ac9fd6b4d3378dc484c19ae5e94'
  version '2.2.11'

  depends_on 'pcre'
#* libapr-1
#* libapr-util-1
#* libssl

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end
end
