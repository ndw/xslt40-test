<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xpath-default-namespace="http://www.w3.org/2012/10/xslt-test-catalog"
    version="3.0">
    
    <xsl:output method="xhtml" />
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Report XSLT test coverage</title>
                <style type="text/css">
                    * { font-family:Helvetica, Arial, Verdana, sans-serif; }
                    h1 {font-size: 20pt; }
                    table {border-collapse: collapse; border:1px solid black;}
                    thead th {text-align: middle; border: 1px solid black }
                    tbody th {text-align: left; border: 1px solid black; }
                    
                    td,
                    th + th,
                    td + th
                    { 
                        width: 60px; 
                        border: 1px solid black;
                        padding: 2px;
                        text-align: right;
                    }
                    .head th { text-align: left } 
                    th + th,
                    td + th {
                        border-right: none;
                    }
                    th + td,
                    th + td + td {  
                    border-left: none; 
                    border-right: none 
                    }
                    th + td + td + td {  
                        border-left: none; 
                    }
                    th + td + td + td + td + td { font-weight: bold; }
                    th + td + td + td + td + td + td + td + td + td { font-weight: bold; }
                </style>
            </head>
            <body>
                <h1>Report XSLT test coverage</h1>
                <div>
                    <table>
                        <thead>
                            <tr class="head">
                                <th>Name</th>
                                <th colspan="4">XSLT 1.0</th>
                                <th colspan="4">XSLT 2.0</th>
                                <th colspan="4">XSLT 3.0</th>
                                <th colspan="2">Unspecified</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="head" >
                                <th>&#xA0;</th>
                                <th>all</th>
                                <th>spec</th>
                                <th>back</th>
                                <th>for</th>
                                <th>all</th>
                                <th>spec</th>
                                <th>back</th>
                                <th>for</th>
                                <th>all</th>
                                <th>spec</th>
                                <th>back</th>
                                <th>for</th>
                                <th>nospec</th>
                                <th>wrong</th>
                            </tr>
                            
                            
                            <xsl:apply-templates select="report/test-set" />
                        </tbody>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="test-set">
        <tr>
            <th>
                <a href="{@uri}" title="{@description}">
                    <xsl:value-of select="@name" />
                </a>
            </th>
        
            <xsl:apply-templates select="test-case-information/(xslt1 | xslt2 | xslt3 | other)" />
        </tr>
    </xsl:template>
    
    <xsl:template match="xslt1 | xslt2 | xslt3">
        <th>
            <xsl:value-of select="@count-total" />
        </th>
        <td>
            <xsl:value-of select="@count-specific" />
        </td>
        <td>
            <xsl:value-of select="@count-backward" />
        </td>
        <td>
            <xsl:value-of select="@count-forward" />
        </td>
    </xsl:template>
    
    <xsl:template match="other">
        <td>
            <xsl:value-of select="@count-nospec" />
        </td>
        <td>
            <xsl:value-of select="@count-wrongvalue" />
        </td>
    </xsl:template>
</xsl:stylesheet>