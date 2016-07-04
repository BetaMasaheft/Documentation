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
    
    <xsl:template match="t:provenance">
       
            <b>Provenance:</b>
             <p><xsl:apply-templates/></p>
       
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
        <p>    <b>Incipit <xsl:value-of select="@xml:lang"/>: </b>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    
    <xsl:template match="t:explicit">
        <p>
            <b>Explicit <xsl:value-of select="@xml:lang"/>: </b>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    
    <xsl:template match="t:rubric">
        <p>
            <b>Rubric <xsl:value-of select="@xml:lang"/>: </b>
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
    
    <xsl:template match="t:text">
        <h2>Transcription</h2>
        <xsl:apply-templates/>        
    </xsl:template>
    
    <xsl:template match="t:body">

    <xsl:apply-templates/> 
    </xsl:template>
    
    <xsl:template match="t:div[ancestor::t:body]">
        <div class="row" id="{@xml:id}" style="padding-left: 50px;">
            <head><a href="{@corresp}"><xsl:value-of select="replace(substring-after(@corresp, '#'), '_', ' ')"/><xsl:text>, </xsl:text><xsl:value-of select="@subtype"/><xsl:text>: </xsl:text><xsl:value-of select="@n"/></a></head><br/>
        <xsl:apply-templates/>        
</div>
        <br/>
    </xsl:template>
    
    <xsl:template match="t:ab">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="t:l">
        <sup><xsl:value-of select="@n"/></sup>
        <xsl:value-of select="."/>
        <xsl:apply-templates/>
    </xsl:template>
    
    
    <!--lb-->
    <xsl:template match="t:lb[parent::t:ab]">
        <xsl:text> | </xsl:text>
    </xsl:template>
    <xsl:template match="t:lb[not(parent::t:ab)]">
        <xsl:variable name="line">
            <xsl:if test="@n">
                <xsl:value-of select="@n"/>
            </xsl:if>
        </xsl:variable>
<br/> <!--hard coded carriage return would not be recognized-->
 <xsl:choose>
     <xsl:when test="number(@n) and @n mod number(5) = 0 and not(@n = 0)">
         <xsl:call-template name="margin-num"/>
     </xsl:when>
     <xsl:otherwise>  <xsl:call-template name="line-numbering-tab" /></xsl:otherwise>
 </xsl:choose>
      
    </xsl:template>
    
    <xsl:template name="margin-num">
        <xsl:value-of select="@n"/>
        <!-- template »line-numbering-tab« found in txt-tpl-linenumberingtab.xsl respectively odf-tpl-linenumberingtab.xsl -->
        <xsl:call-template name="line-numbering-tab" />
    </xsl:template>
    
    <!-- $Id: txt-tpl-linenumberingtab.xsl 1543 2011-08-31 15:47:37Z ryanfb $ -->
       <xsl:template name="line-numbering-tab">
           <!--<xsl:text>&#x9;&#x9;</xsl:text>-->
           <span style="padding-left: 5em;"/> <!--double tab would look much better but would not be recognized in browser-->
        </xsl:template>
        
    
    
</xsl:stylesheet>