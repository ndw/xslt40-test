<?spec xslt#named-templates?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="4.0" xmlns:ext="http://extensions.com/" extension-element-prefixes="ext">

<!-- DESCRIPTION: A template is called recursively from within
     one of its own parameters -->

<xsl:param name="n" select="5"/>

<xsl:template match="/">
<doc>
  <ext:fakt n="$n"/>
</doc>
</xsl:template>

<xsl:template name="ext:fakt">
  <xsl:param name="n"/>
  <xsl:param name="m">
    <xsl:if test="$n&lt;=1">
      <xsl:text>1</xsl:text>
    </xsl:if>
    <xsl:if test="$n>1">
      <ext:fakt n="$n - 1"/>
    </xsl:if>
  </xsl:param>
  <xsl:value-of select="$m*$n"/>
</xsl:template>

</xsl:stylesheet>