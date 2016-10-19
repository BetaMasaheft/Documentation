<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:t="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs t" version="2.0">

    <xsl:output method="xml" indent="yes" name="xml"/>


    <xsl:template match="/">
        <xsl:for-each select="//t:row">
            <xsl:result-document href="{concat('ethnics/', ./t:cell[1], '.xml')}" format="xml">
                <xsl:processing-instruction name="xml-model">
    <xsl:text>href="https://raw.githubusercontent.com/SChAth/schema/master/tei-betamesaheft.rng" 
schematypens="http://relaxng.org/ns/structure/1.0"</xsl:text>
</xsl:processing-instruction>
                <xsl:processing-instruction name="xml-model">
    <xsl:text>href="https://raw.githubusercontent.com/SChAth/schema/master/tei-betamesaheft.rng" 
type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:text>
</xsl:processing-instruction>
                <TEI xmlns="http://www.tei-c.org/ns/1.0">
                    <xsl:attribute name="xml:id">
                        <xsl:value-of select="./t:cell[1]"/>
                    </xsl:attribute>
                    <xsl:attribute name="type">pers</xsl:attribute>
                    <teiHeader>
                        <fileDesc>
                            <titleStmt>
                                <title>
                                    <xsl:value-of select="./t:cell[2]"/>
                                </title>
                                <author/>
                            </titleStmt>
                            <publicationStmt>
                                <authority>Hiob Ludolf Zentrum für Äthiopistik</authority>
                                <publisher>Die Schriftkultur des christlichen Äthiopiens: Eine
                                    multimediale Forschungsumgebung / beta maṣāḥǝft</publisher>
                                <pubPlace>Hamburg</pubPlace>
                                <availability>
                                    <licence target="http://creativecommons.org/licenses/by-sa/4.0/"
                                        > This file is licensed under the Creative Commons
                                        Attribution-ShareAlike 4.0. </licence>
                                </availability>
                                <date>
                                    <xsl:value-of select="current-dateTime()"/>
                                </date>
                            </publicationStmt>
                            <sourceDesc>
                                <p>A TEI file converted from the ETHIO-authority google
                                    spreadsheet</p>
                            </sourceDesc>
                        </fileDesc>
                        <profileDesc>
                            <langUsage>
                                <language ident="en">English</language>
                                <language ident="gez">Gǝʿǝz</language>
                            </langUsage>
                        </profileDesc>
                        <revisionDesc>
                            <change who="PL" when="{current-date()}"> Created file from google
                                spreadsheet </change>
                            <change who="ES" when="2016-02-09">CREATED: ethnic</change>
                        </revisionDesc>
                    </teiHeader>
                    <text>
                        <body>

                            <listPerson>
                                <personGrp role="ethnic">
                                    <persName xml:id="n1">
                                        <orgName>
                                            <xsl:value-of select="./t:cell[2]"/>
                                        </orgName>
                                    </persName>
                                    <xsl:if test="./t:cell[3]/text()">
                                        <persName xml:id="n2">
                                            <orgName>
                                                <xsl:value-of select="./t:cell[3]"/>
                                            </orgName>
                                        </persName>
                                    </xsl:if>

                                </personGrp>

                            </listPerson>
                        </body>
                    </text>
                </TEI>
            </xsl:result-document>


        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
