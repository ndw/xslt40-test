<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:xs="http://www.w3.org/2001/XMLSchema" 
  xmlns:math="http://www.w3.org/2005/xpath-functions/math"
  xmlns:array="http://www.w3.org/2005/xpath-functions/array"
  xmlns:saxon="http://saxon.sf.net/" 
  extension-element-prefixes="saxon" exclude-result-prefixes="xs math saxon" version="3.0" expand-text="true">
  
  <!-- array matching in patterns -->
  
  <xsl:template match="array(*)[array:size(.)=0]"/>
    
    <xsl:template match="array(xs:long)">
      <L><xsl:next-match/></L>
    </xsl:template>
    
    <xsl:template match="array(xs:integer)">
      <I><xsl:next-match/></I>
    </xsl:template>
    
    <xsl:template match="array(xs:decimal)">
      <D><xsl:next-match/></D>
    </xsl:template>
    
    <xsl:template match="array(tuple(first, last))">
      <AT/>
    </xsl:template> 
    
    <xsl:template name="xsl:initial-template">
      <out>
        <xsl:apply-templates select="[xs:long(42)]"/>
      </out>
    </xsl:template>
    
</xsl:stylesheet>