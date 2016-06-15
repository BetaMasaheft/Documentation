<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" 
    exclude-result-prefixes="xs"
    version="2.0">
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
        <xsl:apply-templates select="* except t:listBibl[@type='catalogue']"/>
    </xsl:template>
    
    <xsl:template match="t:note">
        <xsl:choose>
            <xsl:when test="t:p"><xsl:apply-templates/></xsl:when>
       <xsl:otherwise><p> <xsl:apply-templates/></p></xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    <xsl:template match="t:handDesc">
        <h2>Hands</h2>
        <div><xsl:apply-templates/></div>
    </xsl:template>
    
    
    <xsl:template match="t:msContent">
        <div id="contents">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="t:filiation">
        <p>
            <b>Filiation: </b>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="t:incipit">
        <p>
            <b>Incipit: </b>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    
    <xsl:template match="t:explicit">
        <p>
            <b>Explicit: </b>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    
    <xsl:template match="t:rubric">
        <p>
            <b>Rubrication: </b>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="t:idno[parent::t:msIdentifier]" mode="title">
        <h1>
            <xsl:value-of select="."/>
        </h1>
    </xsl:template>
    
    <xsl:template match="t:collection" mode="title">
        <b>Collection: <xsl:value-of select="."/></b>
    </xsl:template>
    
    <xsl:template match="t:altIdentifier" mode="title">
        <p>Other identifiers: <xsl:for-each select="t:idno">
            <xsl:sort/>
            <xsl:value-of select="concat(., ' ')"/>
        </xsl:for-each></p>
    </xsl:template>
    
    <xsl:template match="t:history">
        <h2>Origin <xsl:if test="./ancestor::t:msPart"><xsl:variable name="currentMsPart">
            <a href="{./ancestor::t:msPart/@xml:id}"><xsl:value-of
                select="./ancestor::t:msPart/@xml:id"/></a></xsl:variable> of
            <xsl:value-of select="$currentMsPart"/></xsl:if></h2>
        <p>
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
        <p><xsl:value-of select="//t:custEvent/@restorations"/> restorations :<xsl:value-of
            select="//t:custEvent/@subtype"/></p>
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
            <xsl:otherwise>
                <xsl:copy/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="t:ab | t:seg[@type='script'] | t:desc[parent::t:handNote] | t:seg[@type='rubrication']">
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
    
</xsl:stylesheet>