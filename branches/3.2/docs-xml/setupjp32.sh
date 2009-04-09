#!/bin/sh
svn export svn+ssh://svn.sourceforge.jp/svnroot/samba-jp/branches/3.2
cp -pvr 3.2/docs-xml/manpages-3/* docs-xml/manpages-3
cp -pvr 3.2/docs-xml/smbdotconf/* docs-xml/smbdotconf
cp -pv  3.2/docs-xml/build/DTD/samba.entities docs-xml/build/DTD/
cp -pv  3.2/docs-xml/xslt/expand-smbconfdoc.xsl docs-xml/xslt/
cat $(pwd)/docs-xml/build/catalog.xml.in | sed -e "s|@BUILDDIR@|$(pwd)|g" > $(pwd)/docs-xml/build/catalog.xml
mv  $(pwd)/docs-xml/build/catalog.xml.in  $(pwd)/docs-xml/build/catalog.xml.in.org
mv  $(pwd)/docs-xml/build/catalog.xml     $(pwd)/docs-xml/build/catalog.xml.in
cd docs-xml
./configure
make smbdotconf/parameters.all.xml

