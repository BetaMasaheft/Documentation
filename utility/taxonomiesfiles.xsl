<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="/">
        <xsl:for-each select="//catDesc">
            
            <xsl:variable name="filename" select="."/>
            xml:id="AcquisitionNote"
            
        <xsl:result-document href="result/tax/{$filename}.xml" method="xml">
            <TEI xmlns="http://www.tei-c.org/ns/1.0" type="auth" xml:id="{$filename}">
        <teiHeader>
            <fileDesc>
                <titleStmt>
                    <title>
                        <xsl:attribute name="type">
                            <xsl:choose>
                                <xsl:when test="ancestor::category/desc = 'Additiones'">document</xsl:when>
                                <xsl:when test="ancestor::category/desc = 'Art Themes'">art</xsl:when>
                                <xsl:when test="ancestor::category/desc = 'Place types'">placetype</xsl:when>
                                <xsl:when test="ancestor::category/desc = 'Confessions'">confession</xsl:when>
                                <xsl:when test="ancestor::category/desc = 'Feasts'">feast</xsl:when>
                                <xsl:when test="ancestor::category/desc = 'Subjects'">subject</xsl:when>
                            </xsl:choose>
                        </xsl:attribute>
                        <xsl:value-of select="$filename"/></title>
                    <editor key="ES"/>
                    <editor key="AB" role="generalEditor"/>
                    <funder>Akademie der Wissenschaften in Hamburg</funder>
                </titleStmt>
                <publicationStmt>
                    <authority>Hiob Ludolf Zentrum für Äthiopistik</authority>
                    <publisher>Die Schriftkultur des christlichen Äthiopiens: Eine multimediale
                        Forschungsumgebung / beta maṣāḥǝft</publisher>
                    <pubPlace>Hamburg</pubPlace>
                    <availability>
                        <licence target="http://creativecommons.org/licenses/by-sa/4.0/"> This file is
                            licensed under the Creative Commons Attribution-ShareAlike 4.0. </licence>
                    </availability>
                </publicationStmt>
                <sourceDesc>
                    <p/>
                </sourceDesc>
            </fileDesc>
            <revisionDesc>
                <change who="ES" when="2016-06-02">Provided List in Issue 47</change>
                <change who="PL" when="2016-05-11">prepared XML file</change>
            </revisionDesc>
        </teiHeader>
        <text>
            <body>
                <p></p>
            </body>
        </text>
    </TEI></xsl:result-document></xsl:for-each></xsl:template>
</xsl:stylesheet>