<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" 
    
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="t:repository">
        <xsl:choose>
            <xsl:when test="document(concat('../../Institutions/', @corresp, '.xml'))//t:TEI">
                <a href="../../Institutions/{@corresp}">
                    <xsl:choose>
                        <xsl:when test="text()">
                            <xsl:value-of select="."/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of
                                select="document(concat('../../Institutions/', @corresp, '.xml'))//t:TEI//t:placeName[not(@type = 'alt')]"
                            />
                        </xsl:otherwise>
                    </xsl:choose>
                </a>
            </xsl:when>
            <xsl:otherwise>No record for Institution <xsl:value-of select="@corresp"
            /></xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>