<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" 
    
    exclude-result-prefixes="xs"
    version="2.0">
    
    
    <xsl:template match="t:msItem">
        <div>
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="t:msPart">
        <div>
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    
    <xsl:template match="t:msContent">
        <div id="contents">
            <xsl:apply-templates/>
        </div>
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
    
    <xsl:template match="t:textLang">
        <p>
            <b>Language: </b>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="t:rubric">
        <p>
            <b>Rubrication: </b>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="t:idno">
        <h3><xsl:value-of select="."/>, collection <xsl:value-of
            select="following-sibling::t:collection"/></h3>
        <br/>
        <xsl:if test="following-sibling::t:altIdentifier">
            <p>Other identiefiers: <xsl:for-each select="following-sibling::t:altidentifier/t:idno">
                <xsl:sort/>
                <xsl:value-of select="concat(., ' ')"/>
            </xsl:for-each></p>
        </xsl:if>
    </xsl:template>
    
    
    
    <xsl:template match="t:msItem[contains(@xml:id, 'coloph')]">
        <h3>Colophon</h3>
        <xsl:for-each select=".">
            <p>
                <xsl:apply-templates select="descendant::t:locus"/>
            </p>
            <p>
                <xsl:value-of select="t:colophon/text()"/>
            </p>
            
            <p>
                <b>Translation <xsl:value-of select="t:colophon/t:foreign/@xml:lang"/>: </b><xsl:value-of select="t:colophon/t:foreign"/>
            </p>
            <p>
                <xsl:apply-templates select="descendant::t:note"/>
            </p>
            
        </xsl:for-each>
    </xsl:template>
    
    
</xsl:stylesheet>