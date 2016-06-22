<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" 
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="t:handNote[t:seg[@type = 'ink']]">
        <h3 id="{@xml:id}"><xsl:value-of select="@xml:id"/><xsl:if test="./ancestor::t:msPart"><xsl:variable
            name="currentMsPart">
            <a href="{./ancestor::t:msPart/@xml:id}"><xsl:value-of
                select="./ancestor::t:msPart/@xml:id"/></a></xsl:variable> of
            <xsl:value-of select="$currentMsPart"/></xsl:if></h3>
        <p>Ink<xsl:for-each select=".">
            <xsl:value-of select="concat( ': ', t:seg[@type = 'ink'], ';')"/>
            </xsl:for-each>
        </p>
        <p><xsl:apply-templates select="node() except t:seg[@type = 'ink']"/></p>
    </xsl:template>
</xsl:stylesheet>