<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns:r="http://www.oxygenxml.com/ns/report"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs r t"
    version="2.0">
    <xsl:output method="xml" indent="yes" name="xml"/>
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:variable name="fileDomLib">
        <xsl:variable name="driver" select="document('/Users/pietro/Documents/BetMes/ScAthiop/catalogueMyCore/foliationFix/driver.xml')//r:report"/>
        <xsl:for-each select="$driver//r:incident/r:systemID">
                <path><xsl:value-of select="."/></path>
            </xsl:for-each>
        </xsl:variable>
    
    <xsl:variable name="signatureInfo">
        <foliations>
            <xsl:for-each select="document($fileDomLib/t:path)//mycoreobject">
                <result><foliationInfo><xsl:value-of select=".//txfolio"/></foliationInfo>
                    <ESfile><xsl:value-of select=".//signature[1]"/></ESfile></result>
            </xsl:for-each></foliations>
    </xsl:variable>
    <!--
    <xsl:template match="/">
        <xsl:copy-of select="$signatureInfo"/>
    </xsl:template>-->
    
    <xsl:template match="t:foliation[not(text())]">
        <xsl:variable name="id" select="ancestor::t:TEI//t:msIdentifier/t:idno/text()"/>
        <foliation>
            <xsl:comment><xsl:value-of select="current-date()"/> Updated <xsl:value-of select="$id"/> from DomLib</xsl:comment>
            <xsl:value-of select="$signatureInfo//t:foliationInfo[following-sibling::t:ESfile/text() = $id]"/>
        </foliation>
    </xsl:template>
    
    <!--document(concat('/Users/pietro/Documents/BetMes/Manuscripts/ES', replace(lower-case($signatureInfo//ESfile), '-', ''), '.xml'))//t:foliation[not(text())]-->
</xsl:stylesheet>