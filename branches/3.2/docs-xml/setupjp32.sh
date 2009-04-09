#!/bin/sh
svn export svn+ssh://svn.sourceforge.jp/svnroot/samba-jp/branches/3.2
cp -pvr branches/3.2/docs-xml/manpages-3/* docs-xml/manpages-3
cp -pvr branches/3.2/docs-xml/smbdotconf/* docs-xml/smbdotconf
cp -pv  branches/3.2/docs-xml/build/DTD/samba.entities docs-xml/build/DTD/
cp -pv  branches/3.2/docs-xml/xslt/expand-smbconfdoc.xsl docs-xml/xslt/
