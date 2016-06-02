<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" 
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="//t:editor/@key | @who[parent::t:change]">
        <xsl:choose>
            <xsl:when test=". = 'AB'">Prof. Alessandro Bausi</xsl:when>
            <xsl:when test=". = 'ES'">Eugenia Sokolinski</xsl:when>
            <xsl:when test=". = 'DN'">Dr. Denis Nosnitsin</xsl:when>
            <xsl:when test=". = 'MV'">Massimo Villa</xsl:when>
            <xsl:when test=". = 'DR'">Dorothea Reule</xsl:when>
            <xsl:when test=". = 'SG'">Solomon Gebreye</xsl:when>
            <xsl:when test=". = 'PL'">Dr. Pietro Maria Liuzzo</xsl:when>
            <xsl:when test=". = 'SA'">Dr Stéphane Ancel</xsl:when>
            <xsl:when test=". = 'SD'">Sophia Dege</xsl:when>
            <xsl:when test=". = 'VP'">Dr Vitagrazia Pisani</xsl:when>
            <xsl:when test=". = 'IF'">Iosif Fridman</xsl:when>
            <xsl:when test=". = 'SH'">Susanne Hummel</xsl:when>
            <xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>