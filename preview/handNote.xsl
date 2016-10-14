<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:t="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all" version="2.0">
    <xsl:template match="t:handNote">
        <xsl:if test="count(./ancestor::t:handDesc/t:handNote) gt 1">
            <xsl:choose>
                <xsl:when test="@corresp">
                    <a href="{@corresp}">
                        <h5 id="{@xml:id}">Hand <xsl:value-of select="substring-after(@xml:id, 'h')"/>
                            <xsl:if test="./ancestor::t:msPart">
                                <xsl:variable name="currentMsPart">
                                    <a href="{./ancestor::t:msPart/@xml:id}">
                                        <xsl:value-of select="substring-after(./ancestor::t:msPart/@xml:id, 'p')"/>
                                    </a>
                                </xsl:variable> of codicological unit
                            <xsl:value-of select="$currentMsPart"/>
                            </xsl:if>
                        </h5>
                    </a>
                </xsl:when>
                <xsl:otherwise>
                    <h5 id="{@xml:id}">Hand <xsl:value-of select="substring-after(@xml:id, 'h')"/>
                        <xsl:if test="./ancestor::t:msPart">
                            <xsl:variable name="currentMsPart">
                                <a href="{./ancestor::t:msPart/@xml:id}">
                                    <xsl:value-of select="substring-after(./ancestor::t:msPart/@xml:id, 'p')"/>
                                </a>
                            </xsl:variable> of codicological unit
                        <xsl:value-of select="$currentMsPart"/>
                        </xsl:if>
                    </h5>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
        <p>
            <xsl:value-of select="@script"/>
            <xsl:if test="t:ab[@type = 'script']">: <xsl:value-of select="t:ab[@type = 'script']"/>
            </xsl:if>
        </p>
        <xsl:if test="t:seg[@type = 'ink']">
            <p>Ink: <xsl:value-of select="t:seg[@type = 'ink']"/>
            </p>
        </xsl:if>
        <xsl:if test="t:list[@type = 'abbreviations']">
            <h4> Abbreviations </h4>
            <ul>
                <xsl:for-each select="t:list[@type = 'abbreviations']/t:item">
                    <li>
                        <xsl:apply-templates select="."/>
                    </li>
                </xsl:for-each>
            </ul>
        </xsl:if>
        <xsl:if test="t:persName[@role = 'scribe']">
            <h4>Scribe</h4>
        </xsl:if>
        <xsl:apply-templates select="child::node() except (t:list | t:ab[@type = 'script'] | t:seg)"/>
    </xsl:template>
</xsl:stylesheet>