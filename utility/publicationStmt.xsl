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
    <xsl:template match="t:publicationStmt">
        <publicationStmt>
        <authority>Hiob Ludolf Zentrum für Äthiopistik</authority>
        <publisher>Die Schriftkultur des christlichen Äthiopiens: Eine
            multimediale Forschungsumgebung / beta maṣāḥǝft</publisher>
        <pubPlace>Hamburg</pubPlace>
        
        <availability>
            <licence target="http://creativecommons.org/licenses/by-sa/4.0/">
                This file is licensed under the Creative Commons
                Attribution-ShareAlike 4.0. </licence>
        </availability>
        <xsl:copy-of select="t:date"/>
    </publicationStmt>
    </xsl:template>
    <xsl:template match="t:sourceDesc">
        <xsl:copy>
            <p><xsl:value-of select="normalize-space(//t:publicationStmt/t:authority)"/></p>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>