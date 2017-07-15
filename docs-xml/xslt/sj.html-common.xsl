<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- samba-ja: 当プロジェクト固有の日本語化設定を読み込む -->
  <xsl:param name="local.l10n.xml" select="document('local.ja.xml')"/>

  <!-- samba-ja: 出力エンコーディングを定める -->
  <xsl:output method="html" encoding="UTF-8"/>

</xsl:stylesheet>
