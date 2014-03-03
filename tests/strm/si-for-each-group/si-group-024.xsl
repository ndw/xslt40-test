<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes=" xs"
    version="3.0">
   
  <!-- within a streaming template, use xsl:for-each-group group-adjacent, group on attribute nodes -->
  
  <xsl:mode name="s" streamable="yes"/>
       
    
  <xsl:template name="main">
    <xsl:stream href="../docs/transactions.xml">
    	<xsl:apply-templates select="account" mode="s"/>
    </xsl:stream>
  </xsl:template> 


  <xsl:template match="account" mode="s">
     <out>
      <xsl:for-each-group select="transaction/@date"
         group-adjacent="."
         bind-group="g"
         bind-grouping-key="k">
         <group date="{$k}" values="{$g/../@value}"/>
      </xsl:for-each-group> 
    </out>
  </xsl:template>   
       
</xsl:transform>
