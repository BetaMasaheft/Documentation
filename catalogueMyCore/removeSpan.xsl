<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="//t:span[not(t:span)]">
        <xsl:value-of select="text()"/>
    </xsl:template>
    
    <xsl:template match="//t:span[t:span]">
        <xsl:value-of select=".//text()"/>
    </xsl:template>
    
    <xsl:template match="//t:br"/>
    
    <xsl:template match="//t:strong"/>
        
    <xsl:template match="//t:u"/>
      
    
</xsl:stylesheet>