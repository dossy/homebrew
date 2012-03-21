require 'formula'

class MactexBasicInstalled < Requirement
  def message; <<-EOS.undent
    You must first install the BasicTeX package.  The mactex-basic
    formula simply creates symlinks.
    You can obtain the BasicTeX package for Mac OS X from:
        http://www.tug.org/mactex/2011/morepackages.html
    EOS
  end
  def satisfied?
    File.directory? '/usr/local/texlive/2011basic'
  end
  def fatal?
    true
  end
end


class MactexBasic < Formula
  homepage 'http://www.tug.org/mactex/2011/'
  #url 'http://mirror.ctan.org/systems/mac/mactex/mactex-basic.pkg.zip', :using => :nounzip
  url 'http://ctan.unixbrain.com/systems/mac/mactex/basictex20110803.pkg.zip.md5', :using => :curl
  md5 'd5d30c877a689963daea2916667d0a15'
  version '20110803'

  depends_on MactexBasicInstalled.new

  def install
    prefix.install 'basictex20110803.pkg.zip.md5'

    dir = '/usr/local/texlive/2011basic/bin/universal-darwin'
    %w[
      T1Wrap afm2tfm allcm allec allneeded bibtex dvi2fax dvilualatex
      dviluatex dvipdfm dvipdfmx dvipdft dvips dvired dvitomp ebb
      etex extractbb fmtutil fmtutil-sys gftodvi gftopk gftype gsftopk
      inimf initex kpseaccess kpsepath kpsereadlink kpsestat kpsetool
      kpsewhere kpsewhich kpsexpand latex lualatex luatex makeindex
      mf mf-nowin mfplain mft mkindex mkocp mkofm mktexfmt mktexlsr
      mktexmf mktexpk mktextfm mpost mptopdf pdfetex pdflatex pdftex
      pktogf pktype pst2pdf rungs simpdftex synctex tcdialog
      teckit_compile tex texconfig texconfig-dialog texconfig-sys
      texhash texlinks texlua texluac thumbpdf tlmgr updmap updmap-sys
      xdv2pdf xdvi xdvi-xaw xdvipdfmx xelatex xetex
    ].each do |f|
      t = HOMEBREW_PREFIX + 'bin' + File.basename(f)
      ln_s f, t unless File.exists? t
    end
  end
end
