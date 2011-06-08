#!/bin/sh
svn export https://svn.sourceforge.jp/svnroot/samba-jp/$DOWNLOAD
cp -pvr $DOWNLOAD/docs-xml/manpages-3/* docs-xml/manpages-3/
cp -pvr $DOWNLOAD/docs-xml/smbdotconf/* docs-xml/smbdotconf/
cp -pv  $DOWNLOAD/docs-xml/build/DTD/samba.entities docs-xml/build/DTD/
cp -pv  $DOWNLOAD/docs-xml/xslt/* docs-xml/xslt/
cat docs-xml/build/catalog.xml.in | sed -e "s|@BUILDDIR@|$(pwd)/docs-xml|g" > docs-xml/build/catalog.xml
mv  docs-xml/build/catalog.xml.in  docs-xml/build/catalog.xml.in.org
mv  docs-xml/build/catalog.xml     docs-xml/build/catalog.xml.in
cd docs-xml
./configure
make smbdotconf/parameters.all.xml
