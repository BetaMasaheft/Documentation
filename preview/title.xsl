<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" 
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="t:title">
        <h3>
            <xsl:if test="@xml:id">
                <xsl:attribute name="id">
                    <xsl:value-of select="@xml:id"/>
                </xsl:attribute>
            </xsl:if>
            <a>
                <xsl:if test="@corresp">
                    <xsl:choose>
                        <xsl:when test="document(concat('../../Works/', @corresp, '.xml'))//t:TEI">
                            <a href="../../Works/{@corresp}">
                                <xsl:choose>
                                    <xsl:when test="text()">
                                        <xsl:value-of select="."/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        
                                        <xsl:value-of
                                            select="document(concat('../../Works/', @corresp, '.xml'))//t:TEI//t:titleStmt//t:title[not(@type = 'alt')]"
                                        />
                                    </xsl:otherwise>
                                </xsl:choose>
                            </a>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:message>No record for Work <xsl:value-of select="@corresp"
                            /></xsl:message>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
                <xsl:if test="text()">
                    <b>
                        <xsl:value-of select="."/>
                    </b>
                </xsl:if>
            </a>
        </h3>
    </xsl:template>
</xsl:stylesheet>