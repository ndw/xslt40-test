<?xml version="1.0" encoding="ISO-8859-1"?>
<?spec xpath#id-predicates?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

  <!-- FileName: PREDICATE22 -->
  <!-- Document: http://www.w3.org/TR/xpath -->
  <!-- DocVersion: 19991116 -->
  <!-- Section: 3.4 -->
    <!-- Purpose: Test of implied conversion of node-set to string, and that != is symmetric. -->

<xsl:template match="doc">
  <out>
    <xsl:for-each select="a[descendant::*!='target']">
      <!-- True only when the node has descendants, but none containing "target". -->
      <xsl:value-of select="."/>
    </xsl:for-each>
  </out>
</xsl:template>

</xsl:stylesheet>
