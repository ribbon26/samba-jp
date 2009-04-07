#!/bin/sh
#svn export svn+ssh://svn.sourceforge.jp/svnroot/samba-jp/trunc
cp -pvr trunc/docs-xml/manpages-3/* docs-xml/manpages-3
cp -pvr trunc/docs-xml/smbdotconf/* docs-xml/smbdotconf
cp -pv  trunc/docs-xml/build/DTD/samba.entities docs-xml/build/DTD/
cp -pv  trunc/docs-xml/xslt/expand-smbconfdoc.xsl docs-xml/xslt/
