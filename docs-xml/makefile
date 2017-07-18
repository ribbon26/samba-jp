## makefile for building samba-ja documentation
## ======================================================================

TARFILE= 3.6.5-1

SAMBA_DOCS_XML_DIR=	samba-docs-xml

SAMBA_DOCS_XML_CONFIGURE_FILES= \
	Makefile.settings.in \
	$(SAMBA_DOCS_XML_CATALOG_FILE).in \

SAMBA_DOCS_XML_CONFIGURED_FILES= \
	$(SAMBA_DOCS_XML_CONFIGURE_FILES:.in=)

SAMBA_DOCS_XML_CATALOG_FILE=	build/catalog.xml

SAMBA_DOCS_XML_HTML_COMMON_XSL=	xslt/html-common.xsl

SAMBA_DOCS_XML_BUILD_FILES= \
	$(SAMBA_DOCS_XML_CONFIGURE_FILES) \
	configure.ac \
	aclocal.m4 \
	Makefile \
	htmldocs.html \
	xslt/expand-sambadoc.xsl \
	xslt/generate-attributions.xsl \
	xslt/html \
	xslt/html-chunk.xsl \
	xslt/html.xsl \
	xslt/latex.xsl \
	xslt/man.xsl \
	xslt/manpage-summary.xsl \
	xslt/strip-references.xsl \
	smbdotconf/generate-context.xsl \
	smbdotconf/generate-file-list.sh \
	templates \

# FIXME: Remove?
#	xslt/docbook2pearson.xsl \
#	xslt/extract-examples.xsl \
#	xslt/latex \
#	xslt/latex.overrides.xml \
#	xslt/sambadoc2pearson.xsl \
#	xslt/smb.conf-html.xsl \
#	xslt/yodl.xsl \

## ======================================================================

default: help

all: html html-single htmlman3 manpages3

tar::
	tar -cvzf samba-ja-docs-manpages-$(TARFILE).tar.gz output/manpages-3 COPYING README
	tar -cvzf samba-ja-docs-$(TARFILE).tar.gz build manpages-3 output Samba3-Developers-Guide Samba3-HOWTO smbdotconf xslt COPYING makefile README

help: config.stamp $(SAMBA_DOCS_XML_CATALOG_FILE)
	$(MAKE) -f Makefile help

html html-single htmlman3 manpages3:: config.stamp $(SAMBA_DOCS_XML_CATALOG_FILE)
	 XML_CATALOG_FILES="file:///etc/xml/catalog file://`pwd`/$(SAMBA_DOCS_XML_CATALOG_FILE)" \
	 $(MAKE) -f Makefile $@

config.stamp: $(SAMBA_DOCS_XML_BUILD_FILES) $(SAMBA_DOCS_XML_HTML_COMMON_XSL)
	touch $@

$(SAMBA_DOCS_XML_BUILD_FILES):
	@[ -d $(SAMBA_DOCS_XML_DIR) ] || { \
	  echo "You must create a symlink '$(SAMBA_DOCS_XML_DIR)' for Samba docs-xml directory,"; \
	  echo "e.g.: ln -s /path/to/samba-3.X.Y/docs-xml samba-docs-xml"; \
	  exit 1; \
	}
	cp -rp $(SAMBA_DOCS_XML_DIR)/$@ $@

$(SAMBA_DOCS_XML_CONFIGURED_FILES): $(SAMBA_DOCS_XML_CONFIGURE_FILES)
	rm -f $(SAMBA_DOCS_XML_CONFIGURED_FILES)
	$(MAKE) -f Makefile Makefile.settings
	echo 'XSLTPROC += --stringparam chunker.output.encoding UTF-8' >>Makefile.settings
	sed "s|@abs_top_builddir@|`pwd`|g" $(SAMBA_DOCS_XML_CATALOG_FILE).in >$(SAMBA_DOCS_XML_CATALOG_FILE)


$(SAMBA_DOCS_XML_HTML_COMMON_XSL): $(SAMBA_DOCS_XML_DIR)/$(SAMBA_DOCS_XML_HTML_COMMON_XSL)
	awk '/<\/xsl:stylesheet>/ {print "<xsl:output method=\"html\" encoding=\"UTF-8\"/>"} {print}' $< >$@.tmp
	mv $@.tmp $@

clean::
	[ -f Makefile.settings ] || exit 0; $(MAKE) -f Makefile $@

distclean::
	[ -f Makefile.settings ] || exit 0; $(MAKE) -f Makefile $@
	rm -rf $(SAMBA_DOCS_XML_BUILD_FILES) $(SAMBA_DOCS_XML_HTML_COMMON_XSL) */*.tmp
	rm -rf $(SAMBA_DOCS_XML_CONFIGURED_FILES)
	rm -rf configure autom4te.cache
	rm -rf config.stamp output

