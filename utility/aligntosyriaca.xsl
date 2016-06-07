<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="#all" version="2.0">
    
    <xsl:output encoding="UTF-8" method="xml"/>
    <xsl:output indent="yes"/>
    
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template match="t:publicationStmt">
        <xsl:copy>
            <xsl:copy-of select="t:authority"/>
            <xsl:copy-of select="t:pubPlace"/>
            <xsl:copy-of select="t:publisher"/>
            <xsl:apply-templates select="t:availability"/>
            <date>
                <xsl:value-of select="current-dateTime()"/>
            </date>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="t:availability">
        <xsl:copy>
            <licence target="http://creativecommons.org/licenses/by-sa/4.0/">
                <p>
                    <xsl:value-of select="t:licence"/>
                </p>
            </licence>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template
        match="@corresp[parent::t:repository | parent::t:title | parent::t:persName | parent::t:placeName]">
        <xsl:attribute name="ref">
            <xsl:value-of select="."/>
        </xsl:attribute>
    </xsl:template>
    
    <xsl:template match="t:ab[@type='rubrication'] | t:ab[@type='script']">
       <seg>
           <xsl:attribute name="type"><xsl:value-of select="@type"/></xsl:attribute>
           <xsl:copy-of select="@*"/>
           <xsl:apply-templates/>
       </seg>
    </xsl:template>
    
    <xsl:template match="t:q">
        <quote> 
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
        </quote>
    </xsl:template>
   
    
    <xsl:template match="t:objectType"/>
    
    <xsl:template match="t:objectDesc">
        <xsl:copy>
            <xsl:if test=".//t:objectType">
                <xsl:attribute name="form">
                <xsl:value-of select=".//t:objectType"/>
            </xsl:attribute></xsl:if>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="t:keywords">
        <xsl:copy>
            <xsl:attribute name="scheme">#ethioauthlist</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>    
    
   <xsl:template match="t:msItem[child::t:colophon]">
       <colophon><xsl:copy-of select="t:colophon/@*"/><xsl:copy-of select="@*"/><xsl:apply-templates select="t:locus"/><xsl:value-of select="t:colophon"/><xsl:apply-templates select="t:note"/></colophon>
   </xsl:template>
    
    <xsl:template match="@corresp[parent::t:language]"/>
    
</xsl:stylesheet>
