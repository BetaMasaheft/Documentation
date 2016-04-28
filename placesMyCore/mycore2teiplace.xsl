<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xlink="http://www.w3.org/1999/xlink" exclude-result-prefixes="xlink" version="2.0">

    <xsl:output encoding="UTF-8" method="xml"/>
    <xsl:output indent="yes"/>

    <xsl:template match="/">
        <xsl:variable name="placeID">
            <xsl:value-of
                select="concat('INS', format-number(number(substring-after(mycoreobject/@ID, 'domlib_institution_')), '0000'), if (contains(//name,'/')) then (replace(substring-after(//name, '/'),' ', '')) else (substring(//name,0,5)))"/>

        </xsl:variable>
        <xsl:result-document method="xml" href="xml/{$placeID}.xml">
            <xsl:processing-instruction name="xml-model">
    <xsl:text>href="https://raw.githubusercontent.com/SChAth/schema/master/tei-betamesaheft.rng" 
schematypens="http://relaxng.org/ns/structure/1.0"</xsl:text>
</xsl:processing-instruction>
            <xsl:processing-instruction name="xml-model">
    <xsl:text>href="https://raw.githubusercontent.com/SChAth/schema/master/tei-betamesaheft.rng" 
type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:text>
</xsl:processing-instruction>
            <TEI xmlns="http://www.tei-c.org/ns/1.0" xml:id="{$placeID}" type="ins" xml:lang="en">
                <teiHeader>
                    <fileDesc>
                        <titleStmt>
                            <title>
                                <xsl:value-of select="substring-before(//name, ' /')"/>
                            </title>
                            <xsl:for-each select="//descby">
                                <editor>
                                    <xsl:attribute name="key">
                                        <xsl:value-of select="replace(., '\.', '')"/>
                                    </xsl:attribute>
                                </editor>
                            </xsl:for-each>
                            <editor role="generalEditor" key="AB"/>
                            <funder>Akademie der Wissenschaften in Hamburg</funder>
                        </titleStmt>
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

                        </publicationStmt>
                        <sourceDesc>
                            <p>A TEI file created from Ethio-Spare data</p>
                        </sourceDesc>
                    </fileDesc>
                    <profileDesc>
                        <langUsage>
                            <language ident="en">English</language>
                            <language ident="gez">Gǝʿǝz</language>
                        </langUsage>
                    </profileDesc>
                    <revisionDesc>
                        <xsl:for-each select="//regdate">
                            <change>
                                <xsl:attribute name="who">DN</xsl:attribute>
                                <xsl:attribute name="when">
                                    <xsl:value-of select="."/>
                                </xsl:attribute>
                                <xsl:text>registered</xsl:text>
                                <!--<xsl:attribute name="who"
                                    ><xsl:value-of select=""/> not sure where to take the related value yet</xsl:attribute>-->
                            </change>
                        </xsl:for-each>
                        <xsl:for-each select="//servflag">
                            <change>
                                <xsl:attribute name="who">
                                    <xsl:choose>
                                        <xsl:when test="starts-with(., 'ethio')">DN</xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="substring(., 0, 3)"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:attribute>
                                <xsl:if test="@type = 'creator'">
                                    <xsl:attribute name="when">
                                        <xsl:value-of select="//servdate[@type = 'createdate']"/>
                                    </xsl:attribute>
                                    <xsl:text>created</xsl:text>
                                </xsl:if>
                                <xsl:if test="@type = 'editor'">
                                    <xsl:attribute name="when">
                                        <xsl:value-of select="//servdate[@type = 'modifydate']"/>
                                    </xsl:attribute>
                                    <xsl:text>last edited</xsl:text>
                                </xsl:if>
                            </change>
                        </xsl:for-each>
                        <change who="PL" when="{current-date()}">transformed from mycore to TEI
                            P5</change>
                    </revisionDesc>
                </teiHeader>
                <text>
                    <body>
                        <listPlace>
                            <place type="church monastry" subtype="institution">
                                <placeName>
                                    <xsl:value-of select="substring-before(//name, ' /')"/>
                                </placeName>
                                <xsl:for-each select="//altname">
                                    <placeName type="alt">
                                        <xsl:value-of select="."/>
                                    </placeName>
                                </xsl:for-each>
                                <country>
                                    <xsl:value-of select="//country"/>
                                </country>
                                <region>
                                    <xsl:value-of select="//area"/>
                                </region>
                                <settlement>
                                    <xsl:attribute name="from">
                                        <xsl:value-of select="//visitdate/from"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="to">
                                        <xsl:value-of select="//visitdate/to"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="//town"/>
                                </settlement>
                                <location>
                                    <geo>
                                        <xsl:value-of select="concat(//latitude, ' ', //longitude)"
                                        />
                                    </geo>
                                    <height unit="m">
                                        <xsl:value-of select="//altitude"/>
                                    </height>
                                </location>
                                <note>
                                    <date type="foundation">
                                        <xsl:attribute name="notBefore">
                                            <xsl:value-of select="//foundationdate"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="notAfter">
                                            <xsl:value-of select="//foundtodate"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="concat(//foundationdate, '-', //foundtodate)"/>
                                    </date>
                                    <desc type="foundation">
                                        <xsl:value-of select="//txfndate"/>
                                    </desc>
                                    <xsl:for-each select="//conditions/condition">
                                        <ab type="history">
                                            <xsl:value-of select="."/>
                                        </ab>
                                    </xsl:for-each>
                                    <xsl:for-each select="//description">
                                        <ab type="description">
                                            <xsl:analyze-string select="." regex="(\w{{1,4}})(\-)(\d{{3}})">
                                                <xsl:matching-substring>
                                                <ref>
                                                    <xsl:attribute name="target">
                                                        <xsl:value-of select="concat('ES',lower-case(regex-group(1)), regex-group(3))"/>
                                                    </xsl:attribute>
                                                    <xsl:value-of select="."/>
                                                </ref>    
                                                </xsl:matching-substring>
                                                <xsl:non-matching-substring>
                                                    <xsl:value-of select="."/>
                                                </xsl:non-matching-substring>
                                            </xsl:analyze-string>
                                        </ab>
                                    </xsl:for-each>
                                    <ab type="appellations">
                                        <list>
                                            <item/>
                                        </list>
                                    </ab>
                                </note>
                                <listBibl type="secondary">
                                    <bibl/>
                                </listBibl>
                            </place>
                        </listPlace>
                    </body>
                </text>
            </TEI>

        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>
