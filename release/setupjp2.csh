#
# set version
#
set VERSION=3.5.6
#
#compile
#
echo set environment value
cd samba-$VERSION/docs-xml
setenv XML_CATALOG_FILES "file:///etc/xml/catalog file://$cwd/build/catalog.xml"
#
setenv | grep XML
#
echo compile
#
make distclean
make smbdotconf/parameters.all.xml
make html
make htmlman3
make manpages3
