<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="4.0">
   <xsl:note>Here be a note</xsl:note>
   <xsl:template name="xsl:initial-template">
      <out>
         <xsl:apply-templates select="12">
            <xsl:note>Twelve!</xsl:note>
         </xsl:apply-templates>
      </out>
   </xsl:template>

</xsl:transform>