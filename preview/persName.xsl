<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" 
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="t:persName">
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
            <xsl:when test="document(concat('../../Persons/', $filename, '.xml'))//t:TEI">
                <a href="../../Persons/{@ref}">
                    <xsl:choose>
                        <xsl:when test="text()">
                            <xsl:value-of select="."/>
                        </xsl:when>
                        <xsl:otherwise>
                            
                            <xsl:value-of
                                select="document(concat('../../Persons/', $filename, '.xml'))//t:TEI//t:persName[not(@type = 'alt')]"
                            />
                        </xsl:otherwise>
                    </xsl:choose>
                </a>
                <xsl:if test="@role"> (<xsl:value-of select="@role"/>)</xsl:if>
                
            </xsl:when>
            <xsl:otherwise> <b style="color:red;
                text-align:center;">**No record for Person <xsl:value-of select="@ref"/>** = <xsl:value-of select="."/> **</b></xsl:otherwise>
        </xsl:choose>
        <xsl:if test="@evidence"><xsl:text> (</xsl:text><xsl:value-of select="@evidence"/><xsl:text>) </xsl:text></xsl:if>
        <xsl:if test="@cert = 'low'"><xsl:text> ? </xsl:text></xsl:if>
        <xsl:if test="t:note"><xsl:apply-templates select="t:note"/></xsl:if>
    </xsl:template>
</xsl:stylesheet>