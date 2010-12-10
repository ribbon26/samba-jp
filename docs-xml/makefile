## makefile for building samba-ja documentation
## ======================================================================

SAMBA_DOCS_XML_DIR=	samba-docs-xml

SAMBA_DOCBUILD_FILES= 	\
	configure.ac aclocal.m4 Makefile Makefile.settings.in \
	htmldocs.html \
	build/catalog.xml.in \
	xslt/expand-sambadoc.xsl \
	xslt/generate-attributions.xsl \
	xslt/html \
	xslt/html-chunk.xsl \
	xslt/html-common.xsl \
	xslt/latex.xsl \
	xslt/man.xsl \
	xslt/manpage-summary.xsl \
	xslt/strip-references.xsl \
	smbdotconf/generate-context.xsl \
	smbdotconf/generate-file-list.sh \
	templates \

# FIXME
#	xslt/docbook2pearson.xsl \
#	xslt/extract-examples.xsl \
#	xslt/latex \
#	xslt/latex.overrides.xml \
#	xslt/sambadoc2pearson.xsl \
#	xslt/smb.conf-html.xsl \
#	xslt/yodl.xsl \

SAMBA_XML_CATALOG_FILE=	`pwd`/build/catalog.xml

## ======================================================================

default: config.stamp
	 $(MAKE) -f Makefile

all: html html-single htmlman3 manpages3

html html-single htmlman3 manpages3 clean:: config.stamp
	 XML_CATALOG_FILES="file:///etc/xml/catalog file://$(SAMBA_XML_CATALOG_FILE)" \
	 $(MAKE) -f Makefile $@

config.stamp: $(SAMBA_DOCBUILD_FILES)
	$(MAKE) -f Makefile
	sed "s|@BUILDDIR@|`pwd`|g" $(SAMBA_XML_CATALOG_FILE).in >$(SAMBA_XML_CATALOG_FILE)
	touch config.stamp

$(SAMBA_DOCS_XML_DIR):
	@echo "You must create a symlink '$(SAMBA_DOCS_XML_DIR)' for Samba docs-xml directory,"
	@echo "e.g.: ln -s /path/to/samba-3.X.Y/docs-xml samba-docs-xml"
	@exit 1

$(SAMBA_DOCBUILD_FILES): $(SAMBA_DOCS_XML_DIR)
	cp -rp $(SAMBA_DOCS_XML_DIR)/$@ $@

distclean::
	[ -f Makefile ] || exit 0 ; $(MAKE) -f Makefile $@
	rm -rf $(SAMBA_DOCBUILD_FILES)
	rm -rf configure autom4te.cache Makefile.settings build/catalog.xml
	rm -rf config.stamp output

