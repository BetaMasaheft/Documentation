<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" 
    
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="t:listBibl[not(@type='relations')]">
        <xsl:value-of select="concat(@type, ' Bibliography')"/>
        <ul>
            <xsl:apply-templates/>
        </ul>
    </xsl:template>
    
    <xsl:template match="t:bibl[not(parent::t:listBibl[@type='relations'])]">
        <li>
            <xsl:choose>
                <xsl:when test="@corresp">
                    <a href="{@corresp}"><xsl:value-of select="."/> <xsl:value-of select="t:date"/>
                        <xsl:apply-templates select="t:note"/></a>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:if test="//t:ptr">  <xsl:variable name="zotero"
                        select="document(concat('https://api.zotero.org/groups/358366/items?tag=',t:ptr/@target, '&amp;format=tei'))"/>
                  <xsl:variable name="url">
                      <xsl:choose>
                          <xsl:when test="$zotero//t:note[@type='url']"><xsl:value-of select="$zotero//t:note[@type='url']"/></xsl:when>
                          <xsl:otherwise><xsl:value-of select="concat('https://www.zotero.org/groups/ethiostudies/items/tag/',t:ptr/@target)"/></xsl:otherwise>
                      </xsl:choose>
                  </xsl:variable>
                      <a href="{$url}">
                          <xsl:value-of select="if ($zotero//t:author) then (if ($zotero//t:author/t:surname) then ($zotero//t:author/t:surname) else ($zotero//t:author)) else (if ($zotero//t:editor/t:surname) then ($zotero//t:editor/t:surname) else ($zotero//t:editor))"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="$zotero//t:date"/>
                       <xsl:if test="t:citedRange"> <xsl:text>, </xsl:text>
                        <xsl:value-of select="t:citedRange/@unit"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="t:citedRange"/></xsl:if>
                    </a></xsl:if>
                    <xsl:apply-templates select="t:note"/>
                </xsl:otherwise>
            </xsl:choose>
        </li>
        
    </xsl:template>
    
    <xsl:template match="t:listBibl[ancestor::t:note][not(@type='relations')]">
            <xsl:apply-templates mode="intext"/>
    </xsl:template>
    
    <xsl:template match="t:bibl" mode="intext">
            <xsl:choose>
                <xsl:when test="@corresp">
                    <a href="{@corresp}"><xsl:value-of select="."/> <xsl:value-of select="t:date"/></a>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:if test="//t:ptr"> 
                    <xsl:variable name="zotero"
                        select="document(concat('https://api.zotero.org/groups/358366/items?tag=',t:ptr/@target, '&amp;format=tei'))"/>
                        <xsl:variable name="url">
                            <xsl:choose>
                                <xsl:when test="$zotero//t:note[@type='url']"><xsl:value-of select="$zotero//t:note[@type='url']"/></xsl:when>
                                <xsl:otherwise><xsl:value-of select="concat('https://www.zotero.org/groups/ethiostudies/items/tag/',t:ptr/@target)"/></xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <a href="{$url}">
                            <xsl:value-of select="if ($zotero//t:author) then (if ($zotero//t:author/t:surname) then ($zotero//t:author/t:surname) else ($zotero//t:author)) else (if ($zotero//t:editor/t:surname) then ($zotero//t:editor/t:surname) else ($zotero//t:editor))"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="$zotero//t:date"/>
                        <xsl:if test="t:citedRange"> <xsl:text>, </xsl:text>
                        <xsl:value-of select="t:citedRange/@unit"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="t:citedRange"/>
                        </xsl:if>
                    </a>
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
        
    </xsl:template>
</xsl:stylesheet>