<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="2.0">
    <xsl:template match="t:date">
        <xsl:choose>
            <xsl:when test="text()">
                <xsl:value-of select="."/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="@when">
                        <xsl:value-of select="@when"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="@notBefore"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="@notAfter"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="@evidence"> (<xsl:value-of select="@evidence"/>)</xsl:if>
        <xsl:if test="@cert = 'low'">?</xsl:if>
    </xsl:template>

</xsl:stylesheet>
