require 'formula'

class UcspiTcp < Formula
  url 'http://cr.yp.to/ucspi-tcp/ucspi-tcp-0.88.tar.gz'
  homepage 'http://cr.yp.to/ucspi-tcp.html'
  sha1 '793b4189795b563085602c030dd8aa0d206ddc0e'

  def install
    #system "echo gcc -O2 -include /usr/include/errno.h > conf-cc"
    system "echo gcc -O2 > conf-cc"
    system "echo #{prefix} > conf-home"
    system "echo gcc > conf-ld"
    bin.mkpath
    (prefix+'etc').mkpath
    system "make setup check"
  end
end
