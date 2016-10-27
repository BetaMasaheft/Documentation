<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"  
    exclude-result-prefixes="#all"
    version="2.0">
    
    <!--    adressing https://github.com/SChAth/ScAthiop/issues/195   
    -->
    
    
    
    <xsl:output encoding="UTF-8" method="xml"/>
    <xsl:output indent="yes"/>
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="t:rubric[t:title]">
        <xsl:variable name="parentID" select="ancestor::t:msItem[1]/@xml:id"/>
        <msItem xml:id="{$parentID}.{count(preceding-sibling::t:rubric) +1}">
                <xsl:apply-templates select="@*|node()"/>
            </msItem>
    </xsl:template>
    
</xsl:stylesheet>