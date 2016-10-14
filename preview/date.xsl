<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:t="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all" version="2.0">
    <xsl:template match="t:date">
        <xsl:choose>
            <xsl:when test="text()">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="@when">
                        <xsl:value-of select="@when"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test="@notBefore and @notAfter">
                                <xsl:value-of select="@notBefore"/>
                                <xsl:text>-</xsl:text>
                                <xsl:value-of select="@notAfter"/>
                            </xsl:when>
                            <xsl:when test="@notAfter and not(@notBefore)">
                                <xsl:text>Before </xsl:text>
                                <xsl:value-of select="@notAfter"/>
                            </xsl:when>
                            <xsl:when test="@notBefore and not(@notAfter)">
                                <xsl:text>After </xsl:text>
                                <xsl:value-of select="@notBefore"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="@evidence"> (<xsl:value-of select="@evidence"/>)</xsl:if>
        <xsl:if test="@cert = 'low'">?</xsl:if>
    </xsl:template>
</xsl:stylesheet>