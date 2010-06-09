#
# set version
#
set VERSION=3.5.3
#
#compile
#
echo set environment value
cd samba-$VERSION/docs-xml
setenv XML_CATALOG_FILES "file:///etc/xml/catalog file://$cwd/build/catalog.xml"
#
echo compile
#
make clean
make html
make htmlman3
make manpages3
