<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:import href="http://docbook.sourceforge.net/release/xsl/current/htmlhelp/htmlhelp.xsl"/>

  <!-- samba-ja: 当プロジェクト固有の日本語化設定を読み込む -->
  <xsl:param name="local.l10n.xml" select="document('local.ja.xml')"/>

  <!-- samba-ja: 出力エンコーディングを定める -->
  <!--           htmlhelp は Shift_JIS が必須 -->
  <xsl:output method="html" encoding="'Shift_JIS'"/>
  <xsl:param name="chunker.output.encoding" select="'Shift_JIS'"/>
  <xsl:param name="htmlhelp.encoding" select="'Shift_JIS'"/>

</xsl:stylesheet>
