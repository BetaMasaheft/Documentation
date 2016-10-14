<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:t="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all" version="2.0">
    <xsl:template match="t:dimensions[@type = 'outer']">
        <h2>Physical description<xsl:if test="./ancestor::t:msPart">
                <xsl:variable name="currentMsPart">
                    <a href="{./ancestor::t:msPart/@xml:id}">
                        <xsl:value-of select="substring-after(./ancestor::t:msPart/@xml:id, 'p')"/>
                    </a>
                </xsl:variable> of codicological unit
            <xsl:value-of select="$currentMsPart"/>
            </xsl:if>
        </h2>
        <h3>Outer dimension<xsl:if test="./ancestor::t:msPart">
                <xsl:variable name="currentMsPart">
                    <a href="{./ancestor::t:msPart/@xml:id}">
                        <xsl:value-of select="substring-after(./ancestor::t:msPart/@xml:id, 'p')"/>
                    </a>
                </xsl:variable> of codicological unit
            <xsl:value-of select="$currentMsPart"/>
            </xsl:if>
        </h3>
        <p>H: <span class="lead">
                <xsl:value-of select="t:height"/>
            </span>
            <xsl:value-of select="@unit"/> x W: 
            <span class="lead">
                <xsl:value-of select="t:width"/>
            </span>
            <xsl:value-of select="@unit"/>
            <xsl:if test="t:depth"> x D: <span class="lead">
                    <xsl:value-of select="t:depth"/>
                </span>
                <xsl:value-of select="@unit"/>
            </xsl:if>
        </p>
        <p>(proportion height/width: <xsl:value-of select="format-number(number(t:height div t:width), '#0.0###')"/> ) </p>
        <xsl:apply-templates select="node() except (t:height | t:width | t:depth)"/>
    </xsl:template>
</xsl:stylesheet>