<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" 
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="t:title">
       
                    <xsl:choose><xsl:when test="@corresp"><xsl:choose>
                        <xsl:when test="document(concat('../../Works/', @corresp, '.xml'))//t:TEI">
                            <a href="../../Works/{@corresp}">
                                <xsl:choose>
                                    <xsl:when test="text()">
                                         <i><xsl:value-of select="."/></i>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        
                                        <i><xsl:value-of
                                            select="document(concat('../../Works/', @corresp, '.xml'))//t:TEI//t:titleStmt//t:title[not(@type = 'alt')]"
                                        /></i>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </a>
                        </xsl:when>
                        <xsl:otherwise><b style="color:red;
                                text-align:center;">**No record for Work <xsl:value-of select="@corresp"
                                />** = <xsl:value-of select="."/> **</b>
                        </xsl:otherwise>
                    </xsl:choose></xsl:when>
                    <xsl:otherwise><i><xsl:value-of select="."/></i></xsl:otherwise></xsl:choose>
               
            
        
    </xsl:template>
</xsl:stylesheet>