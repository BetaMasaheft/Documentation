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
        match="@corresp[parent::t:country | parent::t:region | parent::t:settlement | parent::t:title | parent::t:persName[not(parent::t:person)] | parent::t:placeName[not(parent::t:place)]]">
        <xsl:attribute name="ref">
            <xsl:value-of select="."/>
        </xsl:attribute>
    </xsl:template>
    
   <xsl:template match="@corresp[parent::t:language]"/>
    
</xsl:stylesheet>
