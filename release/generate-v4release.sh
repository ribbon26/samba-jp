#! /bin/bash
tar -cvzf samba-ja-docs-$1.tar.gz docs-xml/COPYING docs-xml/README docs-xml/Samba3-* docs-xml/build docs-xml/manpages docs-xml/output docs-xml/smbdotconf docs-xml/xslt
tar -cvzf samba-ja-docs-manpages-$1.tar.gz docs-xml/COPYING docs-xml/README docs-xml/output/manpages
