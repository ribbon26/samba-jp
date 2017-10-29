<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:import href="latex.xsl"/>

  <!-- samba-ja: 当プロジェクト固有の日本語化設定を読み込む -->
  <xsl:param name="local.l10n.xml" select="document('local.ja.xml')"/>

  <xsl:variable name="l10n.gentext.default.language" select="'ja'"/>
  <xsl:variable name="latex.babel.language">japanese</xsl:variable>
  <!--
  <xsl:variable name="latex.class.book">jreport</xsl:variable>
  -->

  <!-- samba-ja: XeTeX 出力のフォントを設定する -->
  <xsl:param name="xetex.font">
    <xsl:text>\usepackage{xeCJK}</xsl:text>
    <xsl:text>\setCJKmainfont{IPAPMincho}&#10;</xsl:text>
    <xsl:text>\setCJKsansfont{IPAPGothic}&#10;</xsl:text>
    <xsl:text>\setCJKmonofont{IPAGothic}&#10;</xsl:text>
  </xsl:param>

  <!-- samba-ja: 出力エンコーディングを定める -->
  <xsl:param name="chunker.output.encoding" select="'UTF-8'"/>
  <xsl:output method="html" encoding="'UTF-8'"/>

</xsl:stylesheet>
