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
            <xsl:if test="not(@type)"><xsl:attribute name="type">work</xsl:attribute></xsl:if>
            <xsl:if test="not(@xml:lang)"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="t:change/@who">
        <xsl:if test="contains(.,'Pietro Liuzzo')"><xsl:attribute name="who">PL</xsl:attribute></xsl:if>
        <xsl:if test="contains(.,'Eugenia Sokolinski')"><xsl:attribute name="who">ES</xsl:attribute></xsl:if>
    </xsl:template>
    <xsl:template match="t:titleStmt/t:title">
        <xsl:copy>
            <xsl:if test="not(@xml:id)"><xsl:attribute name="xml:id">t1</xsl:attribute></xsl:if>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>