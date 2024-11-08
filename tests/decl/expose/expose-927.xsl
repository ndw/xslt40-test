<!-- xsl:expose - error, undeclared prefix in foo:* test -->

<xsl:package
  name="http://www.w3.org/xslt30tests/package-902"  
  package-version="1.0.0"
  version="3.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:p="http://www.w3.org/xslt30tests/use-package-base-001"
  exclude-result-prefixes="xs p">
  
  <xsl:variable name="v1" select="0"/>
  <xsl:variable name="p:v2" select="0"/>
  
 
  <xsl:template name="xsl:initial-template" visibility="public">
    <wrong/>
  </xsl:template>
    
  <xsl:expose visibility="public" component="variable" names="foo:*"/>

</xsl:package>   