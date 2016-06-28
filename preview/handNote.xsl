<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" 
    exclude-result-prefixes="xs"
    version="2.0">

<xsl:template match="t:handNote">
    <h4 id="{@xml:id}">Hand <xsl:value-of select="substring-after(@xml:id, 'h')"/>
        <xsl:if test="./ancestor::t:msPart"><xsl:variable
        name="currentMsPart">
        <a href="{./ancestor::t:msPart/@xml:id}"><xsl:value-of
            select="./ancestor::t:msPart/@xml:id"/></a></xsl:variable> of
        <xsl:value-of select="$currentMsPart"/></xsl:if></h4>
    <p><xsl:value-of select="@script"/><xsl:if test="t:ab[@type = 'script']">: <xsl:value-of select="t:ab[@type = 'script']"/></xsl:if></p>
    <xsl:if test="t:seg[@type = 'ink']"><p>Ink: <xsl:value-of select="t:seg[@type = 'ink']"/></p></xsl:if>
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
        <b>Scribe</b>
        <p>
            <xsl:apply-templates select="t:persName[@role = 'scribe']"/>
        </p>
    </xsl:if>
    <xsl:apply-templates
        select="child::node() except (t:list | t:ab[@type = 'script'] | t:seg)"/>
</xsl:template>
</xsl:stylesheet>