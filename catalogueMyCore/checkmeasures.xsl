<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns:r="http://www.oxygenxml.com/ns/report"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="text"/>
    <xsl:template match="/">
        <xsl:variable name="file">
            <xsl:for-each select="//r:incident/r:systemID/text()">
            <xsl:sequence select="document(concat('../../Institutions/',.))"/>
            </xsl:for-each>
        </xsl:variable>
        
        <xsl:for-each select="$file/t:TEI">
           <!-- <xsl:variable name="topmargin" select="if (.//t:layoutDesc/t:layout/t:dimensions[@type='margin'][1]/t:dim[@type='top'][1]/text()) then (.//t:layoutDesc/t:layout/t:dimensions[@type='margin'][1]/t:dim[@type='top'][1]) else ('0') "/>
            <xsl:variable name="bottomargin" select="if (.//t:layoutDesc/t:layout/t:dimensions[@type='margin'][1]/t:dim[@type='bottom'][1]/text()) then (.//t:layoutDesc/t:layout/t:dimensions[@type='margin'][1]/t:dim[@type='bottom'][1]) else ('0')  "/>
            <xsl:variable name="rightmargin" select="if (.//t:layoutDesc/t:layout/t:dimensions[@type='margin'][1]/t:dim[@type='rigth'][1]/text()) then (.//t:layoutDesc/t:layout/t:dimensions[@type='margin'][1]/t:dim[@type='rigth'][1]) else ('0') "/>
            <xsl:variable name="leftmargin" select="if (.//t:layoutDesc/t:layout/t:dimensions[@type='margin'][1]/t:dim[@type='left'][1]/text()) then (.//t:layoutDesc/t:layout/t:dimensions[@type='margin'][1]/t:dim[@type='left'][1]) else ('0') "/>
            <xsl:variable name="textwidth" select=".//t:layoutDesc/t:layout/t:dimensions[not(@type)][1]/t:width[1] "/>
            <xsl:variable name="heighText" select=".//t:layoutDesc/t:layout/t:dimensions[not(@type)][1]/t:height[1]"/>
            <xsl:variable name="totalHeight" select="if (.//t:supportDesc/t:extent/t:dimensions[@type='outer']/t:height/text()) then (.//t:supportDesc/t:extent/t:dimensions[@type='outer']/t:height *10) else ('0') "/>
            <xsl:variable name="totalwidth" select="if (.//t:supportDesc/t:extent/t:dimensions[@type='outer']/t:width/text()) then (.//t:supportDesc/t:extent/t:dimensions[@type='outer']/t:width *10) else ('0') "/>
            <xsl:variable name="computedheight" select="number($heighText)+number($bottomargin)+number($topmargin)"/>
            <xsl:variable name="computedwidth" select="number($textwidth)+number($rightmargin)+number($leftmargin)"/>
            
         - Ms--> <xsl:value-of select="@xml:id"/>, <xsl:value-of select=".//t:titleStmt/t:title"/><xsl:text>
            </xsl:text>
          <!-- <xsl:choose> <xsl:when test="number($computedheight) > number($totalHeight)">  
              *  has a sum of layout height of <xsl:value-of select="$computedheight"/>mm which is greater than the object height of <xsl:value-of select="$totalHeight"/>mm
                
            </xsl:when> 
            
            <xsl:when test="number($computedwidth) > number($totalwidth)">  
              *  has a sum of layout width of <xsl:value-of select="$computedwidth"/>mm which is greater than the object width of <xsl:value-of select="$totalwidth"/>mm
                
            </xsl:when> 
            <xsl:otherwise>
                looks ok for measures computed width is: <xsl:value-of select="$computedwidth"/>mm, object width is: <xsl:value-of select="$totalwidth"/>mm, computed height is: <xsl:value-of select="$computedheight"/>mm and object height is: <xsl:value-of select="$totalHeight"/>mm.
            but the following values are recognized as empty: 
                <xsl:if test="number($topmargin) = 0">top margin </xsl:if>
                <xsl:if test="number($bottomargin) = 0">bottom margin </xsl:if>
                <xsl:if test="number($rightmargin) = 0">right margin </xsl:if>
                
                <xsl:if test="number($leftmargin) = 0">left margin </xsl:if>
                
                <xsl:if test="number($totalHeight) = 0">object height </xsl:if>
                
                <xsl:if test="number($totalwidth) = 0">object width </xsl:if>
            </xsl:otherwise>
           
           </xsl:choose>-->
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>