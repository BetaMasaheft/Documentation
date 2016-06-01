<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" 
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="t:dimensions[@type = 'outer']">
        
        
        <h2>Physical description<xsl:if test="./ancestor::t:msPart"><xsl:variable
            name="currentMsPart">
            <a href="{./ancestor::t:msPart/@xml:id}"><xsl:value-of
                select="./ancestor::t:msPart/@xml:id"/></a></xsl:variable> of
            <xsl:value-of select="$currentMsPart"/></xsl:if></h2>
        <p>
            <xsl:value-of select="//t:binding/t:decoNote[position() = 1]"/>
        </p>
        <h3>Outer dimension<xsl:if test="./ancestor::t:msPart"><xsl:variable
            name="currentMsPart">
            <a href="{./ancestor::t:msPart/@xml:id}"><xsl:value-of
                select="./ancestor::t:msPart/@xml:id"/></a></xsl:variable> of
            <xsl:value-of select="$currentMsPart"/></xsl:if></h3>
        
        <p>H: <xsl:value-of select="t:height"/> x W: <xsl:value-of select="t:width"/><xsl:if
            test="t:depth"> x D <xsl:value-of select="t:depth"/>
        </xsl:if><xsl:text> </xsl:text><xsl:value-of select="@unit"/>. </p>
        <p>(proportion height/width: <xsl:value-of
            select="format-number(number(t:height div t:width), '#0.0###')"/> ) </p>
        <xsl:if test="//t:extent/t:note">
            <p>
                <xsl:apply-templates select="//t:extent/t:note"/>
            </p>
        </xsl:if>
        <xsl:apply-templates/>
        
        
    </xsl:template>
</xsl:stylesheet>