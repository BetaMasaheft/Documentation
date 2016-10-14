<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:t="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all" version="2.0">
    <xsl:template match="t:origDate | t:floruit | t:birth | t:death">
        <p class="lead">
            <xsl:choose>
                <xsl:when test="@when">
                    <xsl:value-of select="@when"/>
                </xsl:when>
                <xsl:when test="@from |@to">
                    <xsl:choose>
                        <xsl:when test="@from and @to">
                            <xsl:value-of select="@from"/>
                            <xsl:text>-</xsl:text>
                            <xsl:value-of select="@to"/>
                        </xsl:when>
                        <xsl:when test="@from and not(@to)">
                            <xsl:text>Before </xsl:text>
                            <xsl:value-of select="@to"/>
                        </xsl:when>
                        <xsl:when test="@to and not(@from)">
                            <xsl:text>After </xsl:text>
                            <xsl:value-of select="@from"/>
                        </xsl:when>
                    </xsl:choose>
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
            <xsl:if test="@evidence"> (<xsl:value-of select="@evidence"/>)</xsl:if>
            <xsl:if test="@cert = 'low'">?</xsl:if>
        </p>
        <xsl:if test="child::t:* or text()">
            <p class="lead">
                <xsl:apply-templates select="child::node()"/>
            </p>
        </xsl:if>
    </xsl:template>
    <xsl:template match="t:origPlace">
        <p>
            <b>Original Location: </b>
            <xsl:apply-templates/>
        </p>
        <p>
            <xsl:apply-templates select="parent::t:origin/t:provenance"/>
        </p>
    </xsl:template>
    <xsl:template match="t:origin">
        <xsl:apply-templates/>
    </xsl:template>
</xsl:stylesheet>