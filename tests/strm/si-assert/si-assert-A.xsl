<xsl:transform version="3.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="map xs">
    
    <xsl:variable name="RUN" select="true()" static="yes"/>
    <xsl:strip-space elements="*"/>
  
    <xsl:param name="test" as="xs:boolean" select="true()"/>
  
  <!-- Streaming xsl:assert tests with test evaluating to true -->
   
  <!-- within xsl:source-document, use xsl:assert: atomic values, consuming -->
  
  <xsl:template name="d-001" use-when="$RUN">
    <out>
      <xsl:source-document streamable="yes" href="../docs/transactions.xml">
        <xsl:for-each select="account/transaction[@value &lt; 0]/@value">
          <xsl:assert test="$test"><xsl:sequence select="data(.)"/></xsl:assert>
        </xsl:for-each>
      </xsl:source-document>
    </out>
  </xsl:template>
  
  <!-- within xsl:source-document, use xsl:assert: atomic values, consuming and non-consuming -->
  
  <xsl:template name="d-002" use-when="$RUN">
    <out>
      <xsl:source-document streamable="yes" href="../docs/transactions.xml">
        <xsl:assert test=". instance of document-node()">
          <xsl:for-each select="data(account/transaction[@value &lt; 0]/@value), 101, 102">
            <xsl:sequence select="data(.)"/>
          </xsl:for-each>  
    	</xsl:assert> 
      </xsl:source-document>
    </out>
  </xsl:template>
  
  <!-- within xsl:source-document, use xsl:assert: climbing posture -->
  
  <xsl:template name="d-003" use-when="$RUN">
    <out>
      <xsl:source-document streamable="yes" href="../docs/transactions.xml">
        <xsl:variable name="docs" as="document-node()*">
          <xsl:for-each select="account/transaction[@value &lt; 0]/@value">
            <xsl:assert test=". castable as xs:decimal"><xsl:sequence select="data(.)"/></xsl:assert>
          </xsl:for-each>
        </xsl:variable>
        <xsl:copy-of select="data($docs)"/>  
      </xsl:source-document>
    </out>
  </xsl:template>
  
  <!-- within xsl:source-document, use xsl:assert: climbing posture -->
  
  <xsl:template name="d-004" use-when="$RUN">
    <xsl:variable name="extra" as="element()*">
      <PRICE value="101"/>
      <PRICE value="102"/>
    </xsl:variable>
    <out>
      <xsl:source-document streamable="yes" href="../docs/transactions.xml">
        <xsl:variable name="docs" as="document-node()*">
          <xsl:for-each select="account/transaction[@value &lt; 0]/@value, $extra/@value">
            <xsl:assert test="abs(number(.)) lt 1000000"><xsl:sequence select="data(.)"/></xsl:assert>
          </xsl:for-each>
        </xsl:variable>
        <xsl:copy-of select="data($docs)"/> 
      </xsl:source-document>
    </out>
  </xsl:template>
  
  <!-- within xsl:source-document, use xsl:assert: striding posture, element nodes -->
  
  <xsl:template name="d-005" use-when="$RUN">
    <out>
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <xsl:for-each select="/BOOKLIST/BOOKS/ITEM/PRICE">
          <xsl:assert test="local-name() eq 'PRICE'">
            <xsl:copy-of select="."/>
          </xsl:assert>
        </xsl:for-each>
      </xsl:source-document>
    </out>
  </xsl:template>
  
  <!-- within xsl:source-document, use xsl:assert: striding posture, text nodes -->
  
  <xsl:template name="d-006" use-when="$RUN">
    <out>
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <xsl:for-each select="/BOOKLIST/BOOKS/ITEM/PRICE/text()">
          <xsl:assert test="string-length() gt 0">
            <xsl:copy-of select="."/>
          </xsl:assert>
        </xsl:for-each>
      </xsl:source-document>
    </out>
  </xsl:template>
  
  <!-- within xsl:source-document, use xsl:assert: striding posture, text nodes mixed with atomic values -->
  
  <xsl:template name="d-007" use-when="$RUN">
    <out>
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <xsl:for-each select="/BOOKLIST/BOOKS/ITEM/PRICE/text(), 101, 102">
          <xsl:assert test="$test">
            <xsl:copy-of select="."/>
          </xsl:assert>
        </xsl:for-each>
      </xsl:source-document>
    </out>
  </xsl:template>
  
  <!-- within xsl:source-document, use xsl:assert: striding posture, element nodes mixed with grounded elements -->
  
  <xsl:template name="d-008" use-when="$RUN">
    <xsl:variable name="extra" as="element()*">
      <PRICE>100.00</PRICE>
      <PRICE>101.00</PRICE>
    </xsl:variable>
    <out>
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <xsl:for-each select="$extra, /BOOKLIST/BOOKS/ITEM/PRICE">
          <xsl:assert test="$test">
            <xsl:copy-of select="."/>
          </xsl:assert>
        </xsl:for-each>
      </xsl:source-document>
    </out>
  </xsl:template>
  
  <!-- within xsl:source-document, use xsl:assert: descendant text nodes -->
  
  <xsl:template name="d-009" use-when="$RUN">
    <out>
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <xsl:for-each select="outermost(//PRICE)">
          <xsl:assert test="$test">
            <xsl:sequence select="text()"/>
          </xsl:assert>
        </xsl:for-each>
      </xsl:source-document>
    </out>
  </xsl:template>
  
  <!-- within xsl:source-document, use xsl:assert: descendant text nodes mixed with atomic values -->
  
  <xsl:template name="d-010" use-when="true() or $RUN">
    <out>
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <xsl:for-each select="100, 101, /BOOKLIST/BOOKS/ITEM/PRICE/text()">
          <xsl:assert test="$test">
            <xsl:sequence select="."/>
          </xsl:assert>
        </xsl:for-each>
      </xsl:source-document>
    </out>
  </xsl:template>
  
  <!-- within xsl:source-document, use xsl:assert: whole document unchanged -->
  
  <xsl:template name="d-011" use-when="$RUN">
    <out>
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <head/>
        <xsl:assert test="$test">
          <xsl:copy-of select="child::node()"/>
        </xsl:assert>
        <tail/>
      </xsl:source-document>
    </out>
  </xsl:template>
  

  <!-- dropped tests d-022, -023, -024 which were identical and incomplete -->
  
 

  
</xsl:transform>  