<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="#all"
    version="2.0">
    
    <xsl:output encoding="UTF-8" method="xml"/>
    <xsl:output indent="yes"/>
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="//t:span[not(t:span)]">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="//t:span[t:span]">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="//t:br">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="//t:strong">
        <xsl:apply-templates/>
    </xsl:template>
        
    <xsl:template match="//t:u">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="//t:p[ancestor::t:incipit or ancestor::t:explicit or ancestor::t:p or ancestor::t:colophon or ancestor::t:item[matches(@xml:id, 'a\d+')]]">
        <xsl:apply-templates/>
    </xsl:template>   
    
</xsl:stylesheet>