<?xml version="1.0"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">

<?spec xslt#patterns?>
    <!-- Purpose: filtered "/" in pattern. See bug 18861 -->
  

<xsl:template match="/[doc]">
 <ok/>
</xsl:template>



</xsl:stylesheet>
