<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<?spec xpath#combining_seq?>
    <!-- Purpose: Test for union of preceding-sibling:: and following-sibling:: -->

<xsl:template match="/">
  <out>
    <xsl:for-each select="//center">
      <xsl:apply-templates select="preceding-sibling::*|following-sibling::*"/>
    </xsl:for-each>
  </out>
</xsl:template>

<xsl:template match="*">
  <xsl:text> </xsl:text><xsl:value-of select="name(.)"/>
</xsl:template>

</xsl:stylesheet>
