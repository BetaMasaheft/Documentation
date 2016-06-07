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
    
    <xsl:template match="//processing-instruction()"/>
    
    <xsl:template match="/">
        <xsl:processing-instruction name="oxygen">
    <xsl:text>RNGSchema="enrich-betamesaheft.rnc" type="compact"</xsl:text>
</xsl:processing-instruction>
        
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="t:TEI/@type"/>
    
    <xsl:template match="t:publicationStmt">
        <xsl:copy>
            <xsl:copy-of select="t:pubPlace"/>
            <xsl:copy-of select="t:authority"/>
            <xsl:copy-of select="t:publisher"/>
            <xsl:apply-templates select="t:availability"/>
            <date>
                <xsl:value-of select="current-dateTime()"/>
            </date>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="t:availability">
        <xsl:copy>
            <licence target="http://creativecommons.org/licenses/by-sa/4.0/">
                <p>
                    <xsl:value-of select="t:licence"/>
                </p>
            </licence>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template
        match="@corresp[parent::t:repository | parent::t:title | parent::t:persName | parent::t:placeName | parent::t:ref]">
        <xsl:attribute name="ref">
            <xsl:value-of select="concat('https://www.betamasaheft.uni-hamburg.de/', .)"/>
        </xsl:attribute>
    </xsl:template>
    
    
    <xsl:template match="t:title">
        <xsl:copy>
            
            <xsl:apply-templates select="@corresp"/>
            <xsl:choose>
                <xsl:when test="@type = 'Complete'">
                    <xsl:attribute name="type">uniform</xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="type">supplied</xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:choose>
                <xsl:when
                    test="document(concat('../../Works/', @corresp, '.xml'))/t:TEI//t:titleStmt">
                    <xsl:if test=".[not(text())]">
                        <xsl:value-of
                            select="document(concat('../../Works/', @corresp, '.xml'))/t:TEI//t:titleStmt/t:title[1]"
                        />
                    </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="."/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="t:relation">
        <xsl:copy>
            <xsl:attribute name="name">
                <xsl:value-of select="@name"/>
            </xsl:attribute>
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
            <xsl:attribute name="active">
                <xsl:choose>
                    <xsl:when test="starts-with(., '#')">
                        <xsl:value-of
                            select="concat('https://www.betamasaheft.uni-hamburg.de/', //t:TEI/@xml:id, .)"
                        />
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="concat('https://www.betamasaheft.uni-hamburg.de/', .)"
                        />
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:apply-templates/>
            <!--            need to be transformed into uris of the project-->
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template match="@active[parent::t:relation]"> </xsl:template>
    
    <xsl:template match="@passive[parent::t:relation]">
        <xsl:attribute name="passive">
            <xsl:value-of select="concat('https://www.betamasaheft.uni-hamburg.de/', .)"/>
        </xsl:attribute>
    </xsl:template>
    
    <xsl:template match="@mutual[parent::t:relation]">
        <xsl:attribute name="mutual">
            <xsl:for-each select="tokenize(., ' ')">
                <xsl:value-of select="concat('https://www.betamasaheft.uni-hamburg.de/', .)"/>
            </xsl:for-each>
        </xsl:attribute>
    </xsl:template>
    
    
    <xsl:template match="t:editor/@key">
        <xsl:choose>
            <xsl:when test=". = 'AB'">Prof. Alessandro Bausi</xsl:when>
            <xsl:when test=". = 'ES'">Eugenia Sokolinski</xsl:when>
            <xsl:when test=". = 'DN'">Dr. Denis Nosnitsin</xsl:when>
            <xsl:when test=". = 'MV'">Massimo Villa</xsl:when>
            <xsl:when test=". = 'SG'">Solomon Gebreye</xsl:when>
            <xsl:when test=". = 'DR'">Dorothea Reule</xsl:when>
            <xsl:when test=". = 'PL'">Dr. Pietro Maria Liuzzo</xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    <xsl:template match="t:bibl[not(parent::t:listBibl[@type = 'relations'])]">
        
        <xsl:choose>
            
            <xsl:when test="@corresp">
                <xsl:copy>
                    <xsl:attribute name="corresp">
                        <xsl:value-of select="@corresp"/>
                    </xsl:attribute>
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
                    <xsl:variable name="file"
                        select="document(concat('../../Manuscript/', $filename, '.xml'))"/>
                    <title>
                        <xsl:value-of select="$file//t:titleStmt/t:title"/>
                    </title>
                    <xsl:apply-templates/>
                </xsl:copy>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="t:ptr">
                    <!--                      take all from the zotero record, but not the xml id, 
                            as a record can be cited more than once and would invalidate the file-->
                    <xsl:variable name="zotero"
                        select="document(concat('https://api.zotero.org/groups/358366/items?tag=',t:ptr/@target, '&amp;format=tei'))//t:biblStruct"/>
                    <bibl corresp="{$zotero/@corresp}" type="{$zotero/@type}">
                        <xsl:copy-of select="$zotero//t:title"/>
                        <xsl:copy-of select="$zotero//t:author"/>
                        <xsl:copy-of select="$zotero//t:editor"/>
                        <xsl:copy-of select="$zotero//t:pubPlace"/>
                        <xsl:copy-of select="$zotero//t:publisher"/>
                        <xsl:copy-of select="$zotero//t:date"/>
                        <xsl:copy-of select="$zotero//t:series"/>
                        <xsl:copy-of select="$zotero//t:biblScope"/>
                        <xsl:copy-of select="$zotero//t:note"/>
                        
                        <xsl:if test="t:citedRange">
                            <xsl:copy-of select="t:citedRange"/>
                        </xsl:if>
                    </bibl>
                </xsl:if>
                
            </xsl:otherwise>
        </xsl:choose>
        
        
    </xsl:template>
    
    <xsl:template match="t:material | t:condition">
        <xsl:copy>
            <xsl:value-of select="@key"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="t:custEvent">
        <xsl:copy>
            <xsl:value-of select="@type"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="t:objectType"/>
    
    <xsl:template match="t:objectDesc">
        <xsl:copy>
            <xsl:attribute name="form">
                <xsl:value-of select="//t:objectType"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="t:keywords">
        <xsl:copy>
            <xsl:attribute name="scheme">#ethioauthlist</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>    
    
    <xsl:template match="@corresp[parent::t:language]"/>
    
</xsl:stylesheet>
