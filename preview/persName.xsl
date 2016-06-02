<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" 
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="t:persName">
        <xsl:choose>
            <xsl:when test="document(concat('../../Persons/', @corresp, '.xml'))//t:TEI">
                <a href="../../Persons/{@corresp}">
                    <xsl:choose>
                        <xsl:when test="text()">
                            <xsl:value-of select="."/>
                        </xsl:when>
                        <xsl:otherwise>
                            
                            <xsl:value-of
                                select="document(concat('../../Persons/', @corresp, '.xml'))//t:TEI//t:persName[not(@type = 'alt')]"
                            />
                        </xsl:otherwise>
                    </xsl:choose>
                </a>
                <xsl:if test="@role"> (<xsl:value-of select="@role"/>)</xsl:if>
                
            </xsl:when>
            <xsl:otherwise> <b style="color:red;
                text-align:center;">**No record for Person <xsl:value-of select="@corresp"/>** = <xsl:value-of select="."/> **</b></xsl:otherwise>
        </xsl:choose>
        <xsl:if test="@evidence"><xsl:text> (</xsl:text><xsl:value-of select="@evidence"/><xsl:text>) </xsl:text></xsl:if>
        <xsl:if test="@cert = 'low'"><xsl:text> ? </xsl:text></xsl:if>
        <xsl:if test="t:note"><xsl:apply-templates select="t:note"/></xsl:if>
    </xsl:template>
</xsl:stylesheet>