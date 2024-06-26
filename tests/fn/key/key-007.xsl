<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <!-- Purpose: Test for match attribute being first in xsl:key. -->

    <xsl:key match="div" use="title" name="mykey"/>

    <xsl:template match="doc">
        <root>
            <xsl:value-of select="key('mykey', 'Introduction')/p"/>
            <xsl:value-of select="key('mykey', 'Stylesheet Structure')/p"/>
            <xsl:value-of select="key('mykey', 'Expressions')/p"/>
        </root>
    </xsl:template>

</xsl:stylesheet>
