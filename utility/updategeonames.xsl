<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.tei-c.org/ns/1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:t="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all" version="2.0">    


    <xsl:output method="xml" encoding="utf-8" indent="yes"/>
    
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
   <!--
   the driver is geonames file, created from google spreadsheet.
   the first template locates the origin and the result files and applies templates to the first to generate the second. thus the following template applying the change needs to look into the 
   driver again to apply the correct change-->
    
    <xsl:template match="gnames">
        <xsl:for-each select="couple">
            <xsl:variable name="result" select="concat('results/', loc, '.xml')"/>
        <xsl:variable  name="origin" select="doc(concat('../../Places/', loc, '.xml'))"/>
    
    <xsl:result-document href="{$result}">
        <xsl:apply-templates select="$origin"/>
    </xsl:result-document>
            
</xsl:for-each>
</xsl:template>
    
    <xsl:template match="t:place">
        <place>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="sameAs"><xsl:value-of select="doc('geonames.xml')//gn[preceding-sibling::loc = current()//ancestor::t:TEI/@xml:id ]"></xsl:value-of></xsl:attribute>
            <xsl:apply-templates/>
        </place>
    </xsl:template>
    

</xsl:stylesheet>