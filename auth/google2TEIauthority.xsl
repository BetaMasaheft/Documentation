<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:t="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs t" version="2.0">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <xsl:result-document href="People/list.xml">
            <TEI xmlns="http://www.tei-c.org/ns/1.0">
                <xsl:attribute name="xml:id">Persons</xsl:attribute>
                <teiHeader>
                    <fileDesc>
                        <titleStmt>
                            <title/>
                            <author/>
                        </titleStmt>
                        <publicationStmt>
                            <p>List of Persons related to Ethiopian Written tradition</p>
                        </publicationStmt>
                        <sourceDesc>
                            <p>A TEI file converted from the ETHIO-authority google spreadsheet</p>
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
                        <change who="Pietro Liuzzo" when="{current-dateTime()}"> Created XML file
                            from google spreadsheet </change>
                        <change who="Eugenia Sokolinski" when="2016-02-09-12:00">CREATED
                            list</change>
                    </revisionDesc>
                </teiHeader>
                <text>
                    <body>

                        <listPerson>
                            <xsl:for-each select=".//t:row">
                                <xsl:variable name="filename"
                                    select="concat(./t:cell[@n = '1'], '.xml')"/>

                                <person>
                                    <xsl:attribute name="corresp">
                                        <xsl:value-of select="$filename"/>
                                    </xsl:attribute>
                                    <persName>
                                        <xsl:value-of select="./t:cell[@n = '2']"/>
                                    </persName>
                                </person>

                                <xsl:result-document href="{concat('People/', $filename)}">
                                    <TEI xmlns="http://www.tei-c.org/ns/1.0">
                                        <xsl:attribute name="xml:id"><xsl:value-of select="./t:cell[@n = '1']"/></xsl:attribute>
                                        <teiHeader>
                                            <fileDesc>
                                                <titleStmt>
                                                  <title>
                                                  <xsl:value-of select="./t:cell[@n = '2']"/>
                                                  </title>
                                                  <author/>
                                                </titleStmt>
                                                <publicationStmt>
                                                  <authority>Prosopography of
                                                  Ethiopian Written tradition</authority>
                                                  <date>
                                                  <xsl:value-of select="current-dateTime()"/>
                                                  </date>
                                                </publicationStmt>
                                                <sourceDesc>
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
                                                <change who="Pietro Liuzzo"
                                                  when="{current-dateTime()}"> Created file from
                                                  google spreadsheet </change>
                                                <change who="Eugenia Sokolinski"
                                                  when="2016-02-09-12:00">CREATED: place</change>
                                            </revisionDesc>
                                        </teiHeader>
                                        <text>
                                            <body>

                                                <listPerson>
                                                  <person>
                                                      <xsl:if test="./t:cell[@n = '7']/text()">
                                                          <xsl:attribute name="sex">
                                                          <xsl:choose>
                                                              <xsl:when test="./t:cell[@n = '7'] = 'm'">1</xsl:when>
                                                              <xsl:when test="./t:cell[@n = '7'] = 'f'">2</xsl:when>
                                                             
                                                          </xsl:choose>
                                                      </xsl:attribute></xsl:if>
                                                      <persName>
                                                          <xsl:choose>
                                                              <xsl:when test="./t:cell[@n = '3']">
                                                                  <forename><xsl:value-of select="./t:cell[@n = '3']"/></forename>
                                                                  <surname><xsl:value-of select="./t:cell[@n = '2']"/></surname>
                                                              </xsl:when>
                                                              <xsl:otherwise><xsl:value-of select="./t:cell[@n = '2']"/></xsl:otherwise>
                                                          </xsl:choose>
                                                          
                                                  </persName>
                                                  <xsl:if test="./t:cell[@n = '4']/text()">
                                                  <persName type="alt">
                                                  <xsl:value-of select="./t:cell[@n = '4']"/>
                                                  </persName>
                                                  </xsl:if>
                                                  <xsl:if test="./t:cell[@n = '5']/text()">
                                                  <persName type="alt">
                                                  <xsl:value-of select="./t:cell[@n = '5']"/>
                                                  </persName>
                                                  </xsl:if>
                                                  <xsl:if test="./t:cell[@n = '6']/text()">
                                                      <persName type="alt">
                                                  <xsl:value-of select="./t:cell[@n = '6']"/>
                                                  </persName>
                                                  </xsl:if>
                                                  <xsl:if test="./t:cell[@n = '8']/text()">
                                                  <nationality>
                                                  <xsl:value-of select="./t:cell[@n = '8']"/>
                                                  </nationality>
                                                  </xsl:if>
                                                      
                                                      <xsl:if test="./t:cell[@n = '9']/text()">
                                                          <faith>
                                                              <xsl:value-of select="./t:cell[@n = '9']"/>
                                                          </faith>
                                                      </xsl:if>
                                                      
                                                      <xsl:if test="./t:cell[@n = '11']/text()">
                                                          <occupation>
                                                              <xsl:value-of select="./t:cell[@n = '11']"/>
                                                          </occupation>
                                                      </xsl:if>
                                                      <xsl:if test="./t:cell[@n = '12']/text()">
                                                          <occupation>
                                                              <xsl:value-of select="./t:cell[@n = '12']"/>
                                                          </occupation>
                                                      </xsl:if>
                                                      <xsl:if test="./t:cell[@n = '13']/text()">
                                                          <xsl:choose> <xsl:when test="contains(./t:cell[@n = '13'], 'd.')"><death>
                                                              <xsl:value-of select="./t:cell[@n = '13']"/>
                                                          </death></xsl:when>
                                                              <xsl:when test="contains(./t:cell[@n = '13'], 'b.')"><birth>
                                                                  <xsl:value-of select="./t:cell[@n = '13']"/>
                                                              </birth></xsl:when>
                                                              <xsl:otherwise><floruit>
                                                                  <xsl:value-of select="./t:cell[@n = '13']"/>
                                                              </floruit></xsl:otherwise>
                                                          </xsl:choose>
                                                      </xsl:if>
                                                      
                                                      <xsl:if test="./t:cell[@n = '14']/text()">
                                                          <residence>
                                                              <placeName><xsl:value-of select="./t:cell[@n = '14']"/></placeName>
                                                          </residence>
                                                      </xsl:if>
                                                      
                                                      
                                                      
                                                  </person>
                                                    
                                                    <xsl:if test="./t:cell[@n = '10']/text()">
                                                          <listRelation>
                                                              <relation>
                                                                  <xsl:attribute name="name">
                                                                      <xsl:choose>
                                                                          <xsl:when test="contains(./t:cell[@n = '10'], 'daugh.')">daughterOf</xsl:when>
                                                                          <xsl:when test="contains(./t:cell[@n = '10'], 'son ')">sonOf</xsl:when>
                                                                          <xsl:when test="contains(./t:cell[@n = '10'], 'fath.')">fatherOf</xsl:when>
                                                                          <xsl:when test="contains(./t:cell[@n = '10'], 'grandf')">grandfatherOf</xsl:when>
                                                                          <xsl:when test="contains(./t:cell[@n = '10'], 'wife')">wifeOf</xsl:when>
                                                                          <xsl:when test="contains(./t:cell[@n = '10'], 'moth.')">motherOf</xsl:when>
                                                                          <xsl:when test="contains(./t:cell[@n = '10'], 'sis.')">sisterOf</xsl:when>
                                                                          <xsl:when test="contains(./t:cell[@n = '10'], 'br.')">brotherOf</xsl:when>
                                                                          <xsl:otherwise>unspecified</xsl:otherwise>
                                                                      </xsl:choose>
                                                                  </xsl:attribute>
                                                              <desc><xsl:value-of select="./t:cell[@n = '10']"/></desc>
                                                          </relation>
                                                          </listRelation>
                                                      </xsl:if>
                                                    
                                                </listPerson>
                                            </body>
                                        </text>
                                    </TEI>
                                </xsl:result-document>



                            </xsl:for-each>
                        </listPerson>
                    </body>
                </text>
            </TEI>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>
