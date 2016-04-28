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
    <xsl:template match="/"><xsl:processing-instruction name="xml-model">
    <xsl:text>href="https://raw.githubusercontent.com/SChAth/schema/master/tei-betamesaheft.rng" 
schematypens="http://relaxng.org/ns/structure/1.0"</xsl:text>
</xsl:processing-instruction>
        <xsl:processing-instruction name="xml-model">
    <xsl:text>href="https://raw.githubusercontent.com/SChAth/schema/master/tei-betamesaheft.rng" 
type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:text>
</xsl:processing-instruction>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="t:TEI">
        <xsl:copy>
            <xsl:attribute name="type">pers</xsl:attribute>
            <xsl:attribute name="xml:lang">en</xsl:attribute>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="t:change/@who">
        <xsl:if test="contains(.,'Pietro Liuzzo')"><xsl:attribute name="who">PL</xsl:attribute></xsl:if>
        <xsl:if test="contains(.,'Eugenia Sokolinski')"><xsl:attribute name="who">ES</xsl:attribute></xsl:if>
    </xsl:template>
    <xsl:template match="t:nationality">
        <xsl:copy><xsl:attribute name="type">
            <xsl:choose>
                <xsl:when test=".='Harar' " ><xsl:value-of select="."/></xsl:when>
                <xsl:when test=".='Spain' " ><xsl:value-of select="."/></xsl:when>
                <xsl:when test=".='Ethiopia' " ><xsl:value-of select="."/></xsl:when>
                <xsl:when test=".='Oromo' " ><xsl:value-of select="."/></xsl:when>
                <xsl:when test=".='France' " ><xsl:value-of select="."/></xsl:when>
                <xsl:when test=".='Italy' " ><xsl:value-of select="."/></xsl:when>
                <xsl:when test=".='Netherlands' " ><xsl:value-of select="."/></xsl:when>
                <xsl:when test=".='Arabia' " ><xsl:value-of select="."/></xsl:when>
                <xsl:when test=".='Adal' " ><xsl:value-of select="."/></xsl:when>
                <xsl:when test=".='Russia' " ><xsl:value-of select="."/></xsl:when>
                <xsl:when test=".='Poland' " ><xsl:value-of select="."/></xsl:when>
                <xsl:when test=".='Egypt' " ><xsl:value-of select="."/></xsl:when>
                <xsl:when test=".='Israel' " ><xsl:value-of select="."/></xsl:when>
                <xsl:when test=".='Afar' " ><xsl:value-of select="."/></xsl:when>
                <xsl:when test=".='Greece' " ><xsl:value-of select="."/></xsl:when>
                <xsl:when test=".='Coptic Egypt'">Coptic Egypt</xsl:when>
                <xsl:when test=".='Christian Ethiopia'">Ethiopia post-Aksumite</xsl:when>
                <xsl:when test=".='Ottoman'">OttomanEmpire</xsl:when>
                <xsl:when test=".='Poland / Canada'">Poland Canada</xsl:when>
            <xsl:otherwise>notSpecified</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="t:faith">
<xsl:copy>
    <xsl:attribute name="type">
        <xsl:value-of select="."/>
    </xsl:attribute>
    <xsl:apply-templates/>
</xsl:copy>
    </xsl:template>
    <xsl:template match="t:surname|t:forename">
        <xsl:choose>
            <xsl:when test="//t:nationality='Spain'"><xsl:copy><xsl:apply-templates/></xsl:copy></xsl:when>
            <xsl:when test="//t:nationality='Italy'"><xsl:copy><xsl:apply-templates/></xsl:copy></xsl:when>
            <xsl:when test="//t:nationality='France'"><xsl:copy><xsl:apply-templates/></xsl:copy></xsl:when>
            <xsl:when test="//t:nationality='Poland'"><xsl:copy><xsl:apply-templates/></xsl:copy></xsl:when>
            <xsl:when test="//t:nationality='Russia'"><xsl:copy><xsl:apply-templates/></xsl:copy></xsl:when>
            <xsl:when test="//t:nationality='Greece'"><xsl:copy><xsl:apply-templates/></xsl:copy></xsl:when>
            <xsl:when test="//t:nationality='Netherlands'"><xsl:copy><xsl:apply-templates/></xsl:copy></xsl:when>
            <xsl:when test="//t:nationality='Greece'"><xsl:copy><xsl:apply-templates/></xsl:copy></xsl:when>
        <xsl:otherwise><xsl:apply-templates/></xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="t:revisionDesc">
        <xsl:copy>
            <change who="PL" when="{current-dateTime()}">batch updated according to requirements and issues.</change>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>