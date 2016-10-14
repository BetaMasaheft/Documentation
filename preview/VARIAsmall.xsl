<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:t="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all" version="2.0">
    <xsl:template match="t:desc[parent::t:relation]">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="t:surrogates">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="t:support">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="t:additional">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="t:adminInfo">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="t:recordHist">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="t:source">
        <xsl:apply-templates select="*"/>
    </xsl:template>
    <xsl:template match="t:note">
        <xsl:choose>
            <xsl:when test="t:p">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <p>
                    <xsl:apply-templates/>
                </p>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="t:filiation">
        <p>
            <b>Filiation: </b>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="t:incipit">
        <p>
            <b>Incipit <xsl:value-of select="@xml:lang"/>: </b>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="t:explicit">
        <p>
            <b>Explicit <xsl:value-of select="@xml:lang"/>: </b>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="t:rubric">
        <p>
            <b>Rubric <xsl:value-of select="@xml:lang"/>: </b>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="t:watermark">
        <h3>watermark</h3>
        <p>
            <xsl:choose>
                <xsl:when test=". != ''">Yes</xsl:when>
                <xsl:otherwise>No</xsl:otherwise>
            </xsl:choose>
        </p>
    </xsl:template>
    <xsl:template match="t:custEvent/@restoration">
        <p>
            <xsl:value-of select="//t:custEvent/@restorations"/> restorations :<xsl:value-of select="//t:custEvent/@subtype"/>
        </p>
    </xsl:template>
    <xsl:template match="t:measure[. != '']">
        <xsl:value-of select="."/>
        <xsl:text> (</xsl:text>
        <xsl:value-of select="@unit"/>
        <xsl:if test="@type">
            <xsl:text>, </xsl:text>
            <xsl:value-of select="@type"/>
        </xsl:if>
        <xsl:text>) </xsl:text>
    </xsl:template>
    <xsl:template match="t:hi">
        <xsl:choose>
            <xsl:when test="@rend = 'apices'">
                <sup>
                    <xsl:value-of select="."/>
                </sup>
            </xsl:when>
            <xsl:when test="@rend = 'underline'">
                <u>
                    <xsl:value-of select="."/>
                </u>
            </xsl:when>
            <xsl:when test="@rend = 'rubric'">
                <span class="rubric">
                    <xsl:value-of select="."/>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="t:ab[not(ancestor::t:body)] | t:seg[@type='script'] | t:desc[parent::t:handNote] | t:seg[@type='rubrication']">
        <p>
            <xsl:if test="@type">
                <b>
                    <xsl:value-of select="@type"/>
                </b>
                <xsl:text>: </xsl:text>
            </xsl:if>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="t:textLang">
        <xsl:variable name="curlang" select="@mainLang"/>
        <p>
            <b>Language of text: </b>
            <xsl:value-of select="//t:language[@ident = $curlang]"/>
        </p>
    </xsl:template>
    <xsl:template match="t:signatures">
        <xsl:value-of select="text()"/>
        <xsl:if test="t:note">
            <xsl:text> - </xsl:text>
            <xsl:value-of select="t:note"/>
        </xsl:if>
    </xsl:template>
    <xsl:template match="t:desc[not(parent::t:relation)][not(parent::t:handNote)]">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="t:q">
        <p>
            <xsl:choose>
                <xsl:when test="text()">
                    <xsl:value-of select="concat('(', @xml:lang, ') ')"/>
                    <xsl:apply-templates/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:variable name="lang" select="@xml:lang"/>
                    <xsl:text>Text in </xsl:text>
                    <xsl:value-of select="ancestor::t:TEI/t:teiHeader/t:profileDesc/t:langUsage/t:language[@ident = $lang]/text()"/>
                </xsl:otherwise>
            </xsl:choose>
        </p>
    </xsl:template>
</xsl:stylesheet>