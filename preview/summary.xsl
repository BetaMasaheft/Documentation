<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:t="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all" version="2.0">
    <xsl:template match="t:summary">
        <xsl:variable name="id" select="ancestor::t:*[@xml:id][1]/@xml:id"/>
        <h3>Summary<xsl:if test="./ancestor::t:msPart">
                <xsl:variable name="currentMsPart">
                    <a href="{./ancestor::t:msPart/@xml:id}">
                        <xsl:value-of select="substring-after(./ancestor::t:msPart/@xml:id, 'p')"/>
                    </a>
                </xsl:variable> of codicological unit <xsl:value-of select="$currentMsPart"/>
            </xsl:if>
        </h3>
        <ul class="nav nav-tabs">
            <li class="active">
                <a data-toggle="tab" href="#extracted{$id}">Extracted summary of contents</a>
            </li>
            <li>
                <a data-toggle="tab" href="#given{$id}">Given summary of contents</a>
            </li>
        </ul>
        <div class="tab-content">
            <div id="given{$id}" class="tab-pane fade">
                <xsl:value-of select="."/>
            </div>
            <div id="extracted{$id}" class="tab-pane fade in active">
                <ol class="summary">
                    <xsl:choose>
                        <xsl:when test="ancestor::t:msPart">
                            <xsl:for-each select="ancestor::t:msPart//t:msItem[not(parent::t:msItem)]">
                                <xsl:sort select="position()"/>
                                <li>
                                    <xsl:value-of select="@xml:id"/>
                                    <xsl:if test="./t:locus">
                                        <xsl:text> (</xsl:text>
                                        <xsl:apply-templates select="./t:locus"/>
                                        <xsl:text>)</xsl:text>
                                    </xsl:if>
                                    <xsl:text>, </xsl:text>
                                    <xsl:apply-templates select="./t:title"/>
                                    <xsl:if test="t:msItem">
                                        <ol class="summary">
                                            <xsl:for-each select="t:msItem">
                                                <xsl:sort select="position()"/>
                                                <li>
                                                    <xsl:value-of select="@xml:id"/>
                                                    <xsl:if test="./t:locus">
                                                        <xsl:text> (</xsl:text>
                                                        <xsl:apply-templates select="./t:locus"/>
                                                        <xsl:text>)</xsl:text>
                                                    </xsl:if>
                                                    <xsl:text>, </xsl:text>
                                                    <xsl:apply-templates select="./t:title"/>
                                                </li>
                                            </xsl:for-each>
                                        </ol>
                                    </xsl:if>
                                </li>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:for-each select="ancestor::t:msDesc//t:msItem[not(parent::t:msItem)]">
                                <xsl:sort select="position()"/>
                                <li>
                                    <xsl:value-of select="@xml:id"/>
                                    <xsl:if test="./t:locus">
                                        <xsl:text> (</xsl:text>
                                        <xsl:apply-templates select="./t:locus"/>
                                        <xsl:text>)</xsl:text>
                                    </xsl:if>
                                    <xsl:text>, </xsl:text>
                                    <xsl:apply-templates select="./t:title"/>
                                    <xsl:if test="t:msItem">
                                        <ol class="summary">
                                            <xsl:for-each select="t:msItem">
                                                <xsl:sort select="position()"/>
                                                <li>
                                                    <xsl:value-of select="@xml:id"/>
                                                    <xsl:if test="./t:locus">
                                                        <xsl:text> (</xsl:text>
                                                        <xsl:apply-templates select="./t:locus"/>
                                                        <xsl:text>)</xsl:text>
                                                    </xsl:if>
                                                    <xsl:text>, </xsl:text>
                                                    <xsl:apply-templates select="./t:title"/>
                                                </li>
                                            </xsl:for-each>
                                        </ol>
                                    </xsl:if>
                                </li>
                            </xsl:for-each>
                        </xsl:otherwise>
                    </xsl:choose>
                </ol>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>