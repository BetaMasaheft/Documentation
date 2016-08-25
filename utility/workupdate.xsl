<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs t"
    version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
  
    <xsl:template match="t:titleStmt">
        <titleStmt>
            <xsl:copy-of select="node()| @*"/>
        <xsl:if test="not(t:editor)"><editor role="generalEditor" key="AB"/></xsl:if>
            <xsl:if test="not(t:funder)"><funder>Akademie der Wissenschaften in Hamburg</funder></xsl:if>
        </titleStmt>
    </xsl:template>
    
</xsl:stylesheet>