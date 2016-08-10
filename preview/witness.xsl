<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:t="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all" version="2.0">
    <xsl:template match="t:witness">
        <xsl:choose>
            <xsl:when test="@corresp">
                <xsl:variable name="filename">
                    <xsl:choose>
                        <xsl:when test="contains(@corresp, '#')">
                            <xsl:value-of select="substring-before(@corresp, '#')"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="@corresp"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:choose>
                    <xsl:when test="document(concat('../../Manuscripts/',$filename, '.xml'))">
                        
                            <xsl:choose>
                                <xsl:when test="text()">
                                    <a href="{@corresp}">
                                        <xsl:if test="contains(@corresp, '#')">
                                        <xsl:value-of select="concat('Item ',substring-after(@corresp, '#'))"/>
                                        <xsl:text> of </xsl:text> 
                                    </xsl:if>  
                                    <xsl:value-of select="document(concat('../../Manuscripts/',$filename, '.xml'))//t:TEI//t:msIdentifier/t:idno"/></a>
                                    <xsl:text>:  </xsl:text>
                                    <xsl:apply-templates/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <a href="{@corresp}"><xsl:value-of select="document(concat('../../Manuscripts/',$filename, '.xml'))//t:TEI//t:msIdentifier/t:idno"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:if test="contains(@corresp, '#')">
                                        <xsl:value-of select="concat(', ',substring-after(@corresp, '#'))"/>
                                    </xsl:if></a>
                                </xsl:otherwise>
                            </xsl:choose>
                        
                        <xsl:if test="@type"> (<xsl:value-of select="@type"/>)</xsl:if>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="@corresp"/><xsl:text>:  </xsl:text>
                        <xsl:apply-templates/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="@cert = 'low'">
            <xsl:text> ? </xsl:text>
        </xsl:if>
        <xsl:if test="@type">
            <xsl:text> [</xsl:text>
            <xsl:value-of select="@type"/>
            <xsl:text>] </xsl:text>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>