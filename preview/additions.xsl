<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" 
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="t:additions">
        
        <div id="additiones">
            <h2>Additiones <xsl:if test="./ancestor::t:msPart"><xsl:variable
                name="currentMsPart">
                <a href="{./ancestor::t:msPart/@xml:id}"><xsl:value-of
                    select="./ancestor::t:msPart/@xml:id"/></a></xsl:variable> of
                <xsl:value-of select="$currentMsPart"/></xsl:if></h2>
            <xsl:text>In this manuscript there are </xsl:text>
            <xsl:for-each
                select="//t:item/t:desc[generate-id() = generate-id(key('additiontype', @type)[1])]">
                <xsl:value-of
                    select="concat(' ', count(key('additiontype', ./@type)), ' ', ./@type)"/>
                <xsl:choose>
                    <xsl:when test="not(position() = last()) and not(position() + 1 = last())">
                        <xsl:text>,</xsl:text>
                    </xsl:when>
                    <xsl:when test="position() + 1 = last()">
                        <xsl:text> and</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>.</xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
            <xsl:if test="t:note">
                <p>
                    <xsl:apply-templates select="t:note"/>
                </p>
            </xsl:if>
            <ol>
                <xsl:for-each select="//t:item[contains(@xml:id, 'a')]">
                    <li>
                        <xsl:attribute name="id">
                            <xsl:value-of select="@xml:id"/>
                        </xsl:attribute>
                        <p>
                            <xsl:apply-templates select="t:locus"/>
                        </p>
                        <p>
                            <xsl:apply-templates select="t:desc"/>
                            <xsl:if test="t:desc/@type"> (Type: <xsl:value-of select="t:desc/@type"
                            />)</xsl:if>
                        </p>
                        <xsl:for-each select="t:quote">
                            <p>
                                <xsl:value-of select="concat('(', @xml:lang, ') ')"/>
                                <xsl:apply-templates select="."/>
                            </p>
                        </xsl:for-each>
                        <p>
                            <xsl:value-of select="./text()"/>
                        </p>
                        <p>
                            <xsl:apply-templates select="t:note"/>
                        </p>
                        <xsl:if test="t:listBibl">
                            <xsl:apply-templates select="t:listBibl"/>
                        </xsl:if>
                    </li>
                </xsl:for-each>
            </ol>
            <xsl:if test="//t:item[contains(@xml:id, 'e')]">
                <h3>Extras <xsl:if test="./ancestor::t:msPart"><xsl:variable
                    name="currentMsPart">
                    <a href="{./ancestor::t:msPart/@xml:id}"><xsl:value-of
                        select="./ancestor::t:msPart/@xml:id"/></a></xsl:variable> of
                    <xsl:value-of select="$currentMsPart"/></xsl:if></h3>
                <ol>
                    <xsl:for-each select="//t:item[contains(@xml:id, 'e')]">
                        <li>
                            <xsl:apply-templates/>
                        </li>
                    </xsl:for-each>
                </ol>
            </xsl:if>
        </div>
        
    </xsl:template>
</xsl:stylesheet>