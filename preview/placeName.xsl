<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" 
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="t:placeName | t:region | t:country | t:settlement">
      
        <xsl:choose><xsl:when test="@corresp"><xsl:choose>
            <xsl:when test="contains(@corresp, 'LOC')">
                <xsl:choose>
                    <xsl:when test="document(concat('../../Places/', @corresp, '.xml'))//t:TEI">
                        <a href="../../Places/{@corresp}">
                            <xsl:choose>
                                <xsl:when test="text()">
                                    <xsl:value-of select="."/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:if test="@type = 'qušat'"><xsl:text>qušat </xsl:text></xsl:if>
                                    <xsl:if test="@type = 'waradā'"><xsl:text>waradā </xsl:text></xsl:if>
                                    <xsl:value-of
                                        select="document(concat('../../Places/', @corresp, '.xml'))//t:TEI//t:placeName[not(@type = 'alt')]"
                                    />
                                </xsl:otherwise>
                            </xsl:choose>
                        </a>
                    </xsl:when>
                    <xsl:otherwise><b style="color:red;
                        text-align:center;">No record for Place <xsl:value-of select="@corresp"
                        />** = <xsl:value-of select="."/> **</b></xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when
                        test="document(concat('../../Institutions/', @corresp, '.xml'))//t:TEI">
                        <a href="../../Institutions/{@corresp}">
                            <xsl:choose>
                                <xsl:when test="text()">
                                    <xsl:value-of select="."/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:if test="@type = 'qušat'"><xsl:text>qušat </xsl:text></xsl:if>
                                    <xsl:if test="@type = 'waradā'"><xsl:text>waradā </xsl:text></xsl:if>
                                    
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
            </xsl:otherwise>
        </xsl:choose>
    </xsl:when>
        <xsl:otherwise><xsl:apply-templates/></xsl:otherwise></xsl:choose>
        <xsl:if test="@when">
            (information recorded on: <xsl:value-of select="@when"/>)
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>