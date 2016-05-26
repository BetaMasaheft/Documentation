<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xlink="http://www.w3.org/1999/xlink"
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
    <xsl:variable name="id" select="//t:msIdentifier/t:idno"/>
    <xsl:variable name="correspondingDOMLib" select="collection('../catalogueMyCore/mss/')//mycoreobject[//signature = $id]//shortcontent"/>
    <xsl:template match="//t:msContents">
        <xsl:copy><xsl:if test="$correspondingDOMLib !=''"><summary><xsl:value-of select="$correspondingDOMLib"/></summary></xsl:if>
        <xsl:apply-templates/></xsl:copy>
    </xsl:template>
    
    
</xsl:stylesheet>