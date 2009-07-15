#!/bin/sh
svn export svn+ssh://svn.sourceforge.jp/svnroot/samba-jp/trunc
cp -pvr trunc/docs-xml/manpages-3/* docs-xml/manpages-3
cp -pvr trunc/docs-xml/smbdotconf/* docs-xml/smbdotconf
cp -pv  trunc/docs-xml/build/DTD/samba.entities docs-xml/build/DTD/
cp -pv  trunc/docs-xml/xslt/expand-smbconfdoc.xsl docs-xml/xslt/
cat $(pwd)/docs-xml/build/catalog.xml.in | sed -e "s|@BUILDDIR@|$(pwd)/docs-xml|g" > $(pwd)/docs-xml/build/catalog.xml
mv  $(pwd)/docs-xml/build/catalog.xml.in  $(pwd)/docs-xml/build/catalog.xml.in.org
mv  $(pwd)/docs-xml/build/catalog.xml     $(pwd)/docs-xml/build/catalog.xml.in

