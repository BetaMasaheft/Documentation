<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" 
    
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="t:origDate">
        <p>
            <b>Date: </b>
            <xsl:choose>
                <xsl:when test="@when">
                    <xsl:value-of select="@when"/>
                </xsl:when>
                <xsl:otherwise><xsl:choose>
                    <xsl:when test="@notBefore and @notAfter"> <xsl:value-of select="@notBefore"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="@notAfter"/></xsl:when>
                    <xsl:when test="@notAfter and not(@notBefore)">
                        <xsl:text>Before </xsl:text> <xsl:value-of select="@notAfter"/>
                    </xsl:when>
                    <xsl:when test="@notBefore and not(@notAfter)">
                        <xsl:text>After </xsl:text> <xsl:value-of select="@notBefore"/>
                    </xsl:when>
                </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="@evidence"> (<xsl:value-of select="@evidence"/>)</xsl:if>
            <xsl:if test="@cert = 'low'">?</xsl:if>
        </p>
         <p>   <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    
    <xsl:template match="t:origPlace">
        
        <p>
            <b>Current Location: </b>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="t:origin">
        <xsl:apply-templates/>
    </xsl:template>
</xsl:stylesheet>