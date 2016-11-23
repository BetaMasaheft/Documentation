<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/"> 
        <xsl:for-each select="//tr">       
            <xsl:result-document href="newPersons/{normalize-space(td[1])}.xml">
                <xsl:processing-instruction name="xml-model">
    <xsl:text>href="https://raw.githubusercontent.com/SChAth/schema/master/tei-betamesaheft.rng" 
schematypens="http://relaxng.org/ns/structure/1.0"</xsl:text>
</xsl:processing-instruction>
                <xsl:processing-instruction name="xml-model">
    <xsl:text>href="https://raw.githubusercontent.com/SChAth/schema/master/tei-betamesaheft.rng" 
type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:text>
</xsl:processing-instruction>
                <TEI xmlns="http://www.tei-c.org/ns/1.0"
                    type="pers"
                    xml:lang="en"
                    xml:id="{normalize-space(td[1])}">
                    <teiHeader>
                        <fileDesc>
                            <titleStmt>
                                <title xml:id="t1"><xsl:value-of select="td[2]"/></title>
                               
                                
                            </titleStmt>
                            <publicationStmt>
                                <authority>Hiob Ludolf Zentrum für Äthiopistik</authority>
                                <publisher>Die Schriftkultur des christlichen Äthiopiens: Eine
                                    multimediale Forschungsumgebung / beta maṣāḥǝft</publisher>
                                <pubPlace>Hamburg</pubPlace>
                                <availability>
                                    <licence target="http://creativecommons.org/licenses/by-sa/4.0/">
                                        <p>
                                            This file is licensed under the Creative Commons
                                            Attribution-ShareAlike 4.0. </p>
                                    </licence>
                                </availability>
                            </publicationStmt>
                            <sourceDesc>
                                <p>Prosopography of Ethiopian Written tradition</p>
                                <p>A TEI file converted from the ETHIO-authority
                                    google spreadsheet</p>
                            </sourceDesc>
                        </fileDesc>
                        <profileDesc>
                            <langUsage>
                                <language ident="en">English</language>
                                <language ident="ar">Arabic</language>
                                <language ident="it">Italiano</language>
                                <language ident="gez">Gǝʿǝz</language>
                            </langUsage>
                        </profileDesc>
                        <revisionDesc>
                            <change who="PL" when="2016-11-17">Created XML record from Ethio authority google spreadsheet</change>
                        </revisionDesc>
                    </teiHeader>
                    <text>
                        <body>
                            <listPerson>
                                <person>
                                    <xsl:choose>
                                        <xsl:when test="td[7] = 'm'"><xsl:attribute name="sex">1</xsl:attribute></xsl:when>
                                        <xsl:when test="td[7] = 'f'"><xsl:attribute name="sex">2</xsl:attribute></xsl:when>
                                    </xsl:choose>
                                    <persName>
                                        <xsl:choose><xsl:when test="td[2]"><forename><xsl:value-of select="td[3]"/></forename><surname><xsl:value-of select="td[2]"/></surname></xsl:when>
                                            <xsl:otherwise><xsl:value-of select="td[3]"/></xsl:otherwise></xsl:choose>
                                    </persName>
                                    <xsl:if test="td[4]/text()"><persName><xsl:value-of select="td[4]"/></persName></xsl:if>
                                    <xsl:if test="td[5]/text()"><persName><xsl:value-of select="td[5]"/></persName></xsl:if>
                                    <xsl:if test="td[6]/text()"><persName><xsl:value-of select="td[6]"/></persName></xsl:if>
                                    <xsl:if test="td[8]/text()"><nationality><xsl:value-of select="td[8]"/></nationality></xsl:if>
                                    <xsl:if test="td[9]/text()"><faith><xsl:value-of select="td[9]"/></faith></xsl:if>
                                    <xsl:if test="td[13]/text()"><floruit><xsl:value-of select="td[13]"/></floruit><xsl:comment>From Time field, to be changed into DEATH, BIRTH, or whatever is actually relevant!</xsl:comment></xsl:if>
                                   <xsl:if test="td[11]/text()"><occupation><xsl:value-of select="td[11]"/></occupation></xsl:if>
                                    <xsl:if test="td[12]/text()"><note><xsl:value-of select="td[12]"/></note></xsl:if>
                                </person>
                                <xsl:if test="td[10]/text() or td[14]/text()or td[16]/text()">
                                    <listRelation>
                                        <xsl:if test="td[10]/text()"><relation><xsl:value-of select="td[10]"/></relation></xsl:if>
                                        <xsl:if test="td[14]/text()"><relation name="syriaca:has-relation-to-place" active="{td[1]}"><xsl:value-of select="td[14]"/></relation></xsl:if>
                                        <xsl:if test="td[16]/text()"><relation name="lawd:hasAttestation" active="{td[1]}" passive="{td[16]}"><xsl:comment>Please fix the relation of this item with <xsl:value-of select="td[16]"/></xsl:comment></relation></xsl:if>
                                    </listRelation>
                                </xsl:if>
                            </listPerson>
                            
                        </body>
                    </text>
                </TEI>
                
                
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>