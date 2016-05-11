<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" 
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="t:locus">
        <xsl:choose>
            <xsl:when test="not(text())"><xsl:choose>
            <xsl:when test="@target">
                <xsl:choose>
                    <xsl:when test="contains(@target,' ')">
                    <xsl:text>Fols. </xsl:text>
                        <xsl:for-each select="tokenize(@target,' ')">
                        <a href="{.}">
                            <xsl:value-of select="concat(substring-after(.,'#'), ' ')"/>
                        </a>   
                    </xsl:for-each>
                </xsl:when><xsl:otherwise><a href="{@target}">
                    <xsl:text>Fol. </xsl:text>
                    <xsl:value-of select="substring-after(@target,'#')"/>
                </a></xsl:otherwise></xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>Fols. </xsl:text>
                <a href="{@from}">
                    <xsl:value-of select="@from"/>
                </a>
                <xsl:text>-</xsl:text>
                <a href="{@to}">
                    <xsl:value-of select="@to"/>
                </a>
            </xsl:otherwise>
        </xsl:choose>
            <xsl:if test="@n">
                <xsl:text>, l.</xsl:text>
                <xsl:value-of select="."/>
            </xsl:if></xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="@target">
                        <a href="{@target}">
                            <xsl:value-of select="."/>
                        </a>
                    </xsl:when>
                    <xsl:otherwise>
                        <a href="{@from}">
                            <xsl:value-of select="."/>
                        </a>
                    </xsl:otherwise>
                </xsl:choose>
                
                
            </xsl:otherwise></xsl:choose>
        <xsl:text> </xsl:text>
    </xsl:template>
</xsl:stylesheet>