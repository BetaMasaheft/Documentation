<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" 
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template name="colophon">
        <hr style="border-top: dotted 2px;"/>
        <h3>Colophon</h3>
        <xsl:for-each select=".">
            <p>
                <xsl:apply-templates select="descendant::t:locus"/>
            </p>
            <p>
                <xsl:value-of select="t:colophon/text()"/>
            </p>
            
            <xsl:if test="t:colophon/t:foreign">
                <p>
                    <b>Translation <xsl:value-of select="t:colophon/t:foreign/@xml:lang"/>: </b>
                    <xsl:value-of select="t:colophon/t:foreign"/>
                </p>
            </xsl:if>
            <xsl:if test="descendant::t:note">
                <p>
                    <xsl:apply-templates select="descendant::t:note"/>
                </p>
            </xsl:if>
            <xsl:if test="descendant::t:listBibl">
                <xsl:apply-templates select="descendant::t:listBibl"/>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>