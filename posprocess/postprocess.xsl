<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="#all" version="2.0">

    <xsl:output encoding="UTF-8" method="xml"/>
    <xsl:output indent="yes"/>

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="t:relation">
        <xsl:copy>
            <xsl:attribute name="ref">
                <xsl:choose>
                    <xsl:when test="contains(@name, 'saws:')">
                        <xsl:value-of
                            select="concat('http://purl.org/saws/ontology#', substring-after(@name, 'saws:'))"
                        />
                    </xsl:when>
                    <xsl:when test="contains(@name, 'snap:')">
                        <xsl:value-of
                            select="concat('http://data.snapdrgn.net/ontology/snap#', substring-after(@name, 'snap:'))"
                        />
                    </xsl:when>
                    <xsl:when test="contains(@name, 'gn:')">
                        <xsl:value-of
                            select="concat('http://www.geonames.org/ontology#', substring-after(@name, 'gn:'))"
                        />
                    </xsl:when>
                    <xsl:when test="contains(@name, 'dcterms:')">
                        <xsl:value-of
                            select="concat('http://purl.org/dc/terms/', substring-after(@name, 'dcterms:'))"
                        />
                    </xsl:when>
                </xsl:choose>
            </xsl:attribute>
            <xsl:copy-of select="@active | @passive | @mutual"/>
<!--            need to be transformed into uris of the project-->
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="t:editor/@key">
        <xsl:choose>
            <xsl:when test=". = 'AB'">Prof. Alessandro Bausi</xsl:when>
            <xsl:when test=". = 'ES'">Eugenia Sokolinski</xsl:when>
            <xsl:when test=". = 'DN'">Dr. Denis Nosnitsin</xsl:when>
            <xsl:when test=". = 'MV'">Massimo Villa</xsl:when>
            <xsl:when test=". = 'SG'">Solomon Gebreye</xsl:when>
            <xsl:when test=". = 'PL'">Dr. Pietro Maria Liuzzo</xsl:when>
            <xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="t:publicationStmt/t:date">
        <xsl:copy>
            <xsl:value-of select="current-date()"/>
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template match="t:bibl">
        
            <xsl:choose>
                
                <xsl:when test="@corresp">
                  <xsl:copy>
                      <xsl:attribute name="corresp"><xsl:value-of select="@corresp"/></xsl:attribute>
                        <xsl:variable name="filename"> 
                            <xsl:choose>
                                <xsl:when test="contains(@corresp, '#')">
                                    <xsl:value-of select="substring-before(@corresp, '#')"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="@corresp"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                      <xsl:variable name="file" select="document(concat('../../Manuscript/', $filename,'.xml'))"/>
                    <title><xsl:value-of select="$file//t:titleStmt/t:title"/></title>
                      <xsl:apply-templates/>
                  </xsl:copy>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:if test="//t:ptr">  
<!--                      take all from the zotero record, but not the xml id, as a record can be cited more than once and would invalidate the file-->
                        <xsl:variable name="zotero" select="document(concat('https://api.zotero.org/groups/358366/items?tag=',t:ptr/@target, '&amp;format=tei'))//t:biblStruct"/>
                        <biblStruct corresp="{$zotero/@corresp}" type="{$zotero/@type}">
                            <xsl:copy-of
                        select="$zotero/node()"/>
                       
                        
                           
                        <xsl:if test="t:citedRange">
                                <xsl:copy-of select="t:citedRange"/>
                        </xsl:if>
                        </biblStruct>
                    </xsl:if>
                    
                </xsl:otherwise>
            </xsl:choose>
        
        
    </xsl:template>
    
 
    
</xsl:stylesheet>
