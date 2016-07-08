<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml"  
    exclude-result-prefixes="#all"
    version="2.0">
    <xsl:template match="t:colophon">
        <hr style="border-top: dotted 2px;"/>
        <h3 id="{@xml:id}">Colophon</h3>
        
            <p>
                <xsl:apply-templates select="descendant::t:locus"/>
            </p>
            <p>
                <xsl:value-of select="text()"/>
            </p>
            
            <xsl:if test="t:foreign">
                <p>
                    <b>Translation <xsl:value-of select="t:foreign/@xml:lang"/>: </b>
                    <xsl:value-of select="t:foreign"/>
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
        
    </xsl:template>
</xsl:stylesheet>