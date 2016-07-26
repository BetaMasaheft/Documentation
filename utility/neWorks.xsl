<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
   <xsl:template match="/"> 
<xsl:for-each select="//tr">       
       <xsl:result-document href="newWorks/{normalize-space(td[1])}.xml">
           <xsl:processing-instruction name="xml-model">
    <xsl:text>href="https://raw.githubusercontent.com/SChAth/schema/master/tei-betamesaheft.rng" 
schematypens="http://relaxng.org/ns/structure/1.0"</xsl:text>
</xsl:processing-instruction>
           <xsl:processing-instruction name="xml-model">
    <xsl:text>href="https://raw.githubusercontent.com/SChAth/schema/master/tei-betamesaheft.rng" 
type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:text>
</xsl:processing-instruction>
        <TEI xmlns="http://www.tei-c.org/ns/1.0"
            type="work"
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
                        <listWit>
                            <witness/>
                        </listWit>
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
                    <change who="PL" when="2016-07-26">Created XML record from Ethio authority google spreadsheet</change>
                </revisionDesc>
            </teiHeader>
            <text>
                <body>
                    <xsl:choose><xsl:when test="td[3]/text()">
                        <div type="bibliography">
                    <xsl:choose><xsl:when test="contains(td[3], 'Chaine')">
                    
                        <listBibl type="editions">
                            
                                <bibl><ptr target="bm:Chaine1913Rep"/><citedRange unit="item"><xsl:value-of 
                                    select="substring-after(td[3], 'Répertoire Chaine, n. ')"/></citedRange></bibl>
                           
                        </listBibl>
                    </xsl:when>
                    <xsl:when test="td[3]/text() and not(contains(td[3], 'Chaine')) and contains(td[3], 'art of LIT')">
                        <listBibl type="relations">
                            <bibl/>
                            <relation name="saws:formsPartOf" active="{normalize-space(td[1])}" passive="{substring-after(td[3], 'art of ')}">
                                
                            </relation>
                            
                        </listBibl>
                        
                    </xsl:when> 
                            <xsl:otherwise><xsl:comment><xsl:value-of select="td[3]"/></xsl:comment></xsl:otherwise></xsl:choose>
                    </div></xsl:when>
                    <xsl:otherwise><ab/></xsl:otherwise></xsl:choose>
                   
                </body>
            </text>
        </TEI>
        
        
    </xsl:result-document>
</xsl:for-each>
   </xsl:template>
</xsl:stylesheet>