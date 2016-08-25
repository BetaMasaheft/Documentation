<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs t"
    version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="t:titleStmt">
        <titleStmt>
            <xsl:copy-of select="node()| @*"/>
            <xsl:if test="not(t:editor)"><editor role="generalEditor" key="AB"/></xsl:if>
            <xsl:if test="not(t:funder)"><funder>Akademie der Wissenschaften in Hamburg</funder></xsl:if>
        </titleStmt>
    </xsl:template>
    
    <xsl:template match="t:publicationStmt">
        <publicationStmt>
            <authority>Gazetteer of Places related to Ethiopian Written tradition, Hiob Ludolf Zentrum für Äthiopistik</authority>
            <pubPlace>Hamburg</pubPlace>
            <publisher>Die Schriftkultur des christlichen Äthiopiens: Eine multimediale
                Forschungsumgebung / beta maṣāḥǝft</publisher>
            <availability>
                <licence target="http://creativecommons.org/licenses/by-sa/4.0/">
                    <p> This file is licensed
                        under the Creative Commons Attribution-ShareAlike 4.0. </p>
                </licence>
            </availability>
            <xsl:copy-of select="node() except t:authority| @*"/>
        </publicationStmt>
    </xsl:template>
    
</xsl:stylesheet>