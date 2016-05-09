<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="*">
       <xsl:for-each select="tr"> 
           <xsl:variable name="id" select="@xml:id"/>
        <xsl:result-document href="{$id}.xml">  
        <TEI xmlns="http://www.tei-c.org/ns/1.0" xml:id="{$id}">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title/>
                        <author/>
                    </titleStmt>
                    <publicationStmt>
                        <p><xsl:value-of select="$id"/><xsl:text> Authority file</xsl:text></p>
                    </publicationStmt>
                    <sourceDesc>
                        <p>A TEI file generated from database selectors in MyCore</p>
                    </sourceDesc>
                </fileDesc>
                <encodingDesc>
                    <classDecl>
                        <taxonomy>
                            <bibl>Ethiosphere</bibl>
                            <xsl:for-each select="option">
                                <category xml:id="{@value}">
                                    <catDesc><xsl:value-of select="."/></catDesc>
                                </category>
                            </xsl:for-each>
                        </taxonomy>
                    </classDecl>
                </encodingDesc>
                <profileDesc>
                    <langUsage>
                        <language ident="en">English</language>
                        <language ident="ar">Arabic</language>
                        <language ident="it">Italiano</language>
                        <language ident="gez">Gǝʿǝz</language>
                    </langUsage>
                </profileDesc>
                <revisionDesc>
                    <change who="Pietro Liuzzo" when="{current-dateTime()}"> Created XML file
                        from google spreadsheet </change>
                    <change who="Ethiosphere" when="2016-02-09-12:00">CREATED
                        list</change>
                </revisionDesc>
            </teiHeader>
            <text>
                <body>
                    <ab/>
                </body>
            </text>
        </TEI></xsl:result-document>
       </xsl:for-each>
        
        
    </xsl:template>
</xsl:stylesheet>