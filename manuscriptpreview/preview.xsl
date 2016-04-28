<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/">'
<html>
    <head><xsl:value-of select="//t:titleStmt/t:title"/></head>
    <body>
        <h1><xsl:value-of select="concat(//t:titleStmt/t:title, //t:msIdentifier/t:idno)"/></h1>
        <p><xsl:if test="//t:msIdentifier/t:altIdentifier"><xsl:for-each select="//t:msIdentifier/t:altIdentifier">
            <xsl:sort/>
            <xsl:value-of select="concat(.,' ')"/>
        </xsl:for-each></xsl:if>
            </p>
        <p>Edited by <xsl:value-of select="//t:titleStmt/t:editor[not(@role='generalEditor')]/@key"/> on <xsl:value-of select="format-dateTime(//t:publicationStmt/t:date, '[D].[M].[Y]')"/></p>
        <h2>General description</h2>
        language
        writing system
        contents
        subject matters
        origin
        current location
        copyst
        donor
        owner
        dating
        state of preservation
        number of texts
        number of units
        
        <h2>Physical description</h2>
        outer dimension
        binding
            endbands
                headbands
               tailbands
           decoration
           material
           original binding
           other information
           
        writing material
           material
           watermark 
        <h2>Description of content</h2>
        
        <h2>Colophon</h2>
        
        <h2>Additiones</h2>
        
        <h2>Decoration</h2>
        
         <h2>Keywords</h2>
       
        <h2>Authors</h2>
        <xsl:for-each select="change">
            <xsl:sort select="count(@who)"/>
            <xsl:value-of select="@who"/>
        </xsl:for-each>
    </body>
</html>
    </xsl:template>
</xsl:stylesheet>