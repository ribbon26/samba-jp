#
# set version
#
set VERSION=3.5.3
#
# extract archives
#
echo extract archeives samba-$VERSION
tar -xzf samba-$VERSION.tar.gz
cp -pr samba-$VERSION samba-$VERSION.en
cp -p setupjp.sh samba-$VERSION
#
# get japanese document
#
echo get svn data
(cd samba-$VERSION;sh setupjp.sh)
#
echo check file
#
setenv LANG C ; set LINES=`diff -urq samba-$VERSION.en/docs-xml/manpages-3 samba-$VERSION/docs-xml/manpages-3| grep -v differ| wc -l`

if ($LINES > 0) then
  echo error lines=$LINES
  exit 1
else 
  echo manpages OK
endif
set LINES=`diff -urq samba-$VERSION.en/docs-xml/smbdotconf samba-$VERSION/docs-xml/smbdotconf| grep -v differ| wc -l`

if ($LINES > 0) then
  echo error lines=$LINES
  exit 1
else 
  echo smbdotconf OK
endif
#
#compile
#
cd samba-$VERSION/docs-xml
setenv XML_CATALOG_FILES "file:///etc/xml/catalog file://$cwd/build/catalog.xml"
env | grep XML
