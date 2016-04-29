<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/"> <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                    <meta charset="utf-8">
                <title><xsl:value-of select="//t:titleStmt/t:title"/></title></head>
            <body>
                <h1><xsl:value-of select="concat(//t:titleStmt/t:title, //t:msIdentifier/t:idno)"
                    /></h1>
                <p><xsl:if test="//t:msIdentifier/t:altIdentifier"><xsl:for-each
                            select="//t:msIdentifier/t:altIdentifier">
                            <xsl:sort/>
                            <xsl:value-of select="concat(., ' ')"/>
                        </xsl:for-each></xsl:if>
                </p>
                <p>Edited by <xsl:value-of
                        select="//t:titleStmt/t:editor[not(@role = 'generalEditor')]/@key"/> on
                        <xsl:value-of
                        select="format-dateTime(//t:publicationStmt/t:date, '[D].[M].[Y]')"/></p>
                <h2>General description</h2> language writing system contents subject matters origin
                current location copyst donor owner dating state of preservation number of texts
                number of units <h2>Physical description</h2> outer dimension binding endbands
                headbands tailbands decoration material original binding other information writing
                material material watermark ink extent foliation collation layout outer margins
                ruling <list>
                    <item/>
                </list> Palaeography type of script hand writing change of hand punctuation crux
                coronis chirho rubrication <h2>Description of content</h2> title similar manuscripts
                structure title incipit explicit <h2>Colophon</h2>
                <xsl:for-each select="//t:msItem[contains(@xml:id, 'coloph')]">
                    <p><xsl:value-of select="colophon"/><xsl:apply-templates/></p>
                </xsl:for-each>
                <h2>Additiones</h2>
                <h2>Decoration</h2>
                <h2>Keywords</h2>
                <h2>Authors</h2>
                <xsl:for-each select="change">
                    <xsl:sort select="count(@who)"/>
                    <xsl:value-of select="@who"/>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="t:locus">
        <xsl:choose>
            <xsl:when test="@target">
                <a href="{@target}"><xsl:text>Fol. </xsl:text><xsl:value-of select="@target"/></a>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>Fols. </xsl:text><a href="{@from}"><xsl:value-of select="@from"/></a><xsl:text>-</xsl:text><a href="{@to}"><xsl:value-of select="@to"/></a>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="@n">
            <xsl:text>, l.</xsl:text><xsl:value-of select="."/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="t:ref"> 
    
    </xsl:template>

    <xsl:template match="t:persName"> </xsl:template>


    <xsl:template match="t:placeName"> </xsl:template>


    <xsl:template match="t:bibl">
        <xsl:choose>
            <xsl:when test="@corresp"/>
            <xsl:otherwise>
                <xsl:variable name="zotero" select="document(concat('https://api.zotero.org/groups/358366/items?tag=',t:ptr/@target, '&amp;format=tei'))"/>
                <a href="{$zotero//t:note[@type='url']}"><xsl:value-of select="$zotero//t:author/t:surname"/><xsl:text> </xsl:text><xsl:value-of select="$zotero//t:date"/><xsl:text>, </xsl:text><xsl:value-of select="t:citedRange/@unit"/><xsl:value-of select="t:citedRange"/></a>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>




























</xsl:stylesheet>
