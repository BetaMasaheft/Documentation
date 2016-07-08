<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml"  
    
    exclude-result-prefixes="#all"
    version="2.0">
    <xsl:template match="t:repository" mode="title">
        <xsl:variable name="filename">
            <xsl:choose>
                <xsl:when test="contains(@ref, '#')">
                    <xsl:value-of select="substring-before(@ref, '#')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="@ref"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="document(concat('../../Institutions/', $filename, '.xml'))//t:TEI">
                <a href="../../Institutions/{@ref}">
                    <xsl:choose>
                        <xsl:when test="text()">
                            <xsl:value-of select="."/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of
                                select="document(concat('../../Institutions/', $filename, '.xml'))//t:TEI//t:placeName[not(@type = 'alt')]"
                            />
                            <xsl:if test="contains(@ref, '#')">
                                <xsl:value-of select="concat(', ',substring-after(@ref, '#'))"/>
                            </xsl:if>
                        </xsl:otherwise>
                    </xsl:choose>
                </a>
            </xsl:when>
            <xsl:otherwise>No record for Institution <xsl:value-of select="@ref"
            /></xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>