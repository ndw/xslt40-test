<?xml version="1.0"?>
<?spec xslt#named-templates?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="4.0"
  xmlns:ext="http://extensions.com/" extension-element-prefixes="ext">

  <!-- FileName: namedtemplate11 -->
  <!-- Document: http://www.w3.org/TR/xslt -->
  <!-- DocVersion: 19991116 -->
  <!-- Section: 11.6 -->
    <!-- Purpose: Test for-each inside xsl:with-param. -->

<xsl:template match="doc">
  <out>
    <ext:ntmp1 pvar1="a!string(.)"/>
  </out>
</xsl:template>

<xsl:template name="ext:ntmp1">
  <xsl:param name="pvar1">pvar1 default data</xsl:param>
  <xsl:text>This template got passed </xsl:text>
  <xsl:value-of select="$pvar1"/>
</xsl:template>

</xsl:stylesheet>