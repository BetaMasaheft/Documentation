<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" 
    
    exclude-result-prefixes="xs"
    version="2.0">
    
    
    <xsl:template match="t:msItem[parent::t:msContents]">
        <div class="container">
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#item{@xml:id}">expand/collapse</button>
            <h3>Item <xsl:value-of select="@xml:id"/></h3>
            
            <div id="item{@xml:id}" class="collapse"><xsl:apply-templates/></div>
        </div>
        <hr/>
    </xsl:template>
    
    <xsl:template match="t:msItem[parent::t:msItem]">
        
        <div style="padding-left: 50px;">
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <hr style="border-top: dotted 1px;" />
            
            
            <h4>Item <xsl:value-of select="@xml:id"/></h4>
            
            <div><xsl:apply-templates/></div>
        </div>
    </xsl:template>
    
    <xsl:template match="t:msPart[parent::t:sourceDesc]">
        <div>
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            
            <div><xsl:apply-templates/></div>
        </div>
        <hr/>
    </xsl:template>
    
    <xsl:template match="t:msPart[parent::t:msPart]">
        <div style="padding-left: 50px;">
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <hr style="border-top: dotted 1px;" />
            <div><xsl:apply-templates/></div>
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
    
    <xsl:template match="t:idno[parent::t:msIdentifier]">
        <h1><xsl:value-of select="."/></h1>
    </xsl:template>
    <xsl:template match="t:collection">
        <b>Collection: <xsl:value-of
            select="."/></b>
        </xsl:template>
    
    <xsl:template match="t:altIdentifier">
            <p>Other identifiers: <xsl:for-each select="t:idno">
                <xsl:sort/>
                <xsl:value-of select="concat(., ' ')"/>
            </xsl:for-each></p>
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
            
            <xsl:if test="t:colophon/t:foreign"><p>
                <b>Translation <xsl:value-of select="t:colophon/t:foreign/@xml:lang"/>: </b><xsl:value-of select="t:colophon/t:foreign"/>
            </p></xsl:if>
            <xsl:if test="descendant::t:note"><p>
                <xsl:apply-templates select="descendant::t:note"/>
            </p></xsl:if>
            
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="t:measure[. != '']">
        <xsl:value-of select="."/><xsl:text> (</xsl:text><xsl:value-of select="@unit"/><xsl:text>) </xsl:text>
    </xsl:template>
    
    <xsl:template match="t:hi">
       <xsl:choose>
           <xsl:when test="@type = 'apices'">
           <xsl:value-of select="."/>
       </xsl:when>
       <xsl:otherwise><xsl:copy/></xsl:otherwise></xsl:choose>
    </xsl:template>
    
    
</xsl:stylesheet>