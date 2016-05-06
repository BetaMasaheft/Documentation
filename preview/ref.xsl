<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="2.0">
    <xsl:template match="t:ref">
        <xsl:choose>
            <xsl:when test="text()">
                <xsl:choose>
                    <xsl:when test="contains(@target, ' ')">
                        <xsl:text>nos. </xsl:text>
                        <xsl:for-each select="tokenize(@target, ' ')">
                            <a href="{.}">
                                <xsl:value-of select="."/>
                            </a>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                        <a href="{@target}">n. <xsl:value-of select="."
                        /></a>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="contains(@target, ' ')">
                        <xsl:text>nos. </xsl:text>
                        <xsl:for-each select="tokenize(@target, ' ')">
                            <a href="{.}">
                                <xsl:value-of select="concat(substring-after(., '#'), ' ')"/>
                            </a>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                        <a href="{@target}">n. <xsl:value-of select="substring-after(@target, '#')"
                            /></a>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
