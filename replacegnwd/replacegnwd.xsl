<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:t="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:output encoding="UTF-8" method="xml"/>
    <xsl:output indent="yes" method="xml"/>
    

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="@ref | @sameAs | @corresp">
        <xsl:choose>
            <xsl:when test="starts-with(., 'gn:')">
                <xsl:variable name="gn" select="substring-after(., 'gn:')"/>
                <xsl:variable name="wd"
                    select="doc('/users/pietro/Desktop/gnwd.xml')//pair[gn = $gn]/wd"/>
                <xsl:choose>
                    <xsl:when test="$wd">
                        <xsl:message>changed <xsl:value-of select="."/> to <xsl:value-of
                                select="$wd"/></xsl:message>
                        <xsl:attribute name="{./name()}">
                            <xsl:value-of select="$wd"/>
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:message>No matching WD found for <xsl:value-of select="."
                            /></xsl:message>
                        <xsl:copy/>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:message>
                    <xsl:value-of select="."/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="$gn"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="$wd"/>
                </xsl:message>

            </xsl:when>
            <xsl:otherwise>
                <xsl:copy/>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>
</xsl:stylesheet>
