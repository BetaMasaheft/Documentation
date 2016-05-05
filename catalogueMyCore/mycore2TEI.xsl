<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xlink="http://www.w3.org/1999/xlink" exclude-result-prefixes="xlink" version="2.0">

    <xsl:output encoding="UTF-8" method="xml"/>
    <xsl:output indent="yes"/>


    <xsl:template match="/">
        <xsl:variable name="msID">
            <xsl:value-of
                select="concat('ES', lower-case(substring-before(//signature[position() = 1], '-')), substring-after(//signature[position() = 1], '-'))"/>

        </xsl:variable>
        <xsl:result-document href="../resultsSchema/{concat($msID ,'.xml')}" method="xml">

            <xsl:processing-instruction name="xml-model">
    <xsl:text>href="https://raw.githubusercontent.com/SChAth/schema/master/tei-betamesaheft.rng" 
schematypens="http://relaxng.org/ns/structure/1.0"</xsl:text>
</xsl:processing-instruction>
            <xsl:processing-instruction name="xml-model">
    <xsl:text>href="https://raw.githubusercontent.com/SChAth/schema/master/tei-betamesaheft.rng" 
type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:text>
</xsl:processing-instruction>
            <TEI xmlns="http://www.tei-c.org/ns/1.0" xml:id="{$msID}" xml:lang="en" type="mss">
                <teiHeader>
                    <fileDesc>
                        <titleStmt>
                            <title>
                                <xsl:value-of select="//titles/title"/>
                            </title>
                            <xsl:for-each select="//regby">
                                <editor key="{replace(.,'\.','')}"/>
                            </xsl:for-each>
                            <editor role="generalEditor" key="AB"/>
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
                            <date>
                                <xsl:value-of select="//servdate[@type = 'createdate']"/>
                            </date>
                        </publicationStmt>
                        <sourceDesc>
                            <msDesc xml:id="ms">
                                <msIdentifier>
                                    <xsl:variable name="institutionID"
                                        select="
                                            concat('INS',
                                            format-number(
                                            number(
                                            substring-after(//locationlink/@xlink:href, 'domlib_institution_')), '0000'),
                                            if (contains(//locationlink/@xlink:title, '/'))
                                            then
                                                (replace(substring-after(//locationlink/@xlink:title, '/'), ' ', ''))
                                            else
                                                (substring(//locationlink/@xlink:title, 0, 5)))
                                            "/>


                                    <!--further info might be retrived following link and reading xml doc-->
                                    <repository corresp="{$institutionID}"/>
                                    <collection>Ethio-Spare</collection>
                                    <xsl:for-each select="//signature">
                                        <xsl:choose>
                                            <xsl:when test="position() = 1">

                                                <idno>
                                                  <xsl:value-of select="."/>
                                                </idno>

                                            </xsl:when>
                                            <xsl:otherwise>
                                                <altIdentifier>
                                                  <idno>
                                                  <xsl:value-of select="."/>
                                                  </idno>
                                                </altIdentifier>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:for-each>
                                </msIdentifier>
                                <msContents>



                                    <xsl:for-each select="//desccontent">
                                        <xsl:sort order="descending" select="."/>
                                        <msItem xml:id="{concat('ms_i',position())}">
                                            <xsl:if test="./folios">
                                                <locus>
                                                  <xsl:attribute name="from">
                                                  <xsl:value-of
                                                  select="substring-before(normalize-space(./folios), '-')"
                                                  />
                                                  </xsl:attribute>

                                                  <xsl:attribute name="to">
                                                  <xsl:value-of
                                                  select="substring-after(normalize-space(./folios), '-')"
                                                  />
                                                  </xsl:attribute>
                                                  <xsl:value-of select="./folios"/>
                                                </locus>
                                            </xsl:if>
                                            <xsl:if test="./text">
                                                <title>
                                                  <xsl:attribute name="type">
                                                  <xsl:value-of select="./completeness"/>
                                                  </xsl:attribute>
                                                  <xsl:value-of select="./text"/>
                                                </title>
                                            </xsl:if>
                                            <rubric>
                                                <xsl:value-of select="//rubrication"/>
                                            </rubric>
                                            <incipit>
                                                <xsl:value-of
                                                  select="normalize-space(./incipit)"
                                                  disable-output-escaping="yes"/>
                                                <foreign xml:lang="en">
                                                  <xsl:value-of
                                                  select="normalize-space(./itranslation)"
                                                  disable-output-escaping="yes"/>
                                                </foreign>
                                            </incipit>
                                            <explicit>

                                                <xsl:value-of
                                                  select="normalize-space(./explicit)"
                                                  disable-output-escaping="yes"/>
                                                <foreign xml:lang="en">
                                                  <xsl:value-of
                                                  select="normalize-space(./etranslation)"
                                                  disable-output-escaping="yes"/>
                                                </foreign>
                                            </explicit>

                                            <xsl:if test="./mss">
                                                <listBibl type="mss">
                                                  <!--here is a list of related manuscript-->
                                                  <xsl:for-each select="tokenize(./mss, '&#13;')">
                                                  <bibl>

                                                  <xsl:analyze-string select="normalize-space(.)"
                                                  regex="(.+)(\s)((\(.+\)),\s)(\((.+)\)(;|.))">
                                                  <xsl:matching-substring>
                                                  <xsl:attribute name="corresp">
                                                  <xsl:value-of
                                                  select="replace(regex-group(1), ' ', '_')"/>
                                                  </xsl:attribute>
                                                  <xsl:value-of select="regex-group(6)"/>
                                                  <date>
                                                  <xsl:value-of select="regex-group(4)"/>
                                                  </date>
                                                  </xsl:matching-substring>
                                                  <xsl:non-matching-substring>
                                                  <xsl:value-of select="."/>
                                                  </xsl:non-matching-substring>
                                                  </xsl:analyze-string>

                                                  </bibl>
                                                  </xsl:for-each>
                                                </listBibl>
                                            </xsl:if>

                                            <note>
                                                <xsl:value-of
                                                  select="normalize-space(substring-before(substring-after(./details, '&lt;p&gt;'), '&lt;/p&gt;'))"
                                                  disable-output-escaping="yes"/>
                                            </note>
                                        </msItem>
                                    </xsl:for-each>

                                    <!--                                        MISSING ELEMENT IN MYCORE SAMPLE : "OTHER IMPORTANT PASSAGES"-->

                                    <!--                                    this requires breaking string text and clarification on how info is entered.
                                    
                                    unstructured list + additiones 
                                    
                                    language can be used to analyze-string.
                                    
                                    assign combination of ms identifier and points in list as xml:id to each msItem
                                    -->
                                    <xsl:for-each select="//colophon/col">
                                        <xsl:sort select="position()"/>
                                        <msItem xml:id="coloph{position()}">
                                            <colophon>
                                                <locus>
                                                  <xsl:variable name="locus">
                                                  <xsl:value-of
                                                  select="normalize-space(substring-before(substring-after(., '&lt;p&gt;'), ':'))"
                                                  />
                                                  </xsl:variable>
                                                  <xsl:analyze-string select="$locus"
                                                  regex="(Fol\.\s)(\d+\w{{1,2}})">
                                                  <xsl:matching-substring>


                                                  <xsl:attribute name="target">
                                                  <xsl:value-of select="regex-group(2)"/>
                                                  </xsl:attribute>

                                                  </xsl:matching-substring>
                                                  </xsl:analyze-string>
                                                  <xsl:value-of select="$locus"/>
                                                </locus>
                                                <xsl:value-of
                                                  select="normalize-space(.)"
                                                  disable-output-escaping="yes"/>
                                                
                                                <foreign xml:lang="en"><xsl:if test="following-sibling::tran"><xsl:value-of select="following-sibling::tran" disable-output-escaping="yes"/></xsl:if></foreign>
                                                <note><xsl:value-of select="//colophon/det"/></note>
                                            </colophon>
                                        </msItem>
                                    </xsl:for-each>
                                </msContents>

                                <physDesc>


                                    <objectDesc>
                                        <supportDesc>
                                            <support>
                                                <xsl:if test="//bwatermark = 'true'">
                                                  <watermark>Watermark</watermark>
                                                </xsl:if>
                                                <material>
                                                  <xsl:variable name="id"
                                                  select="//wmaterial/@categid"/>
                                                  <xsl:attribute name="key">
                                                  <xsl:value-of
                                                  select="lower-case(document('controlledList.xml')//tr[@xml:id = 'WritingMaterial']/option[@value = $id])"
                                                  />
                                                  </xsl:attribute>
                                                </material>
                                            </support>
                                            <extent>Made of <measure unit="leaf"><xsl:value-of
                                                  select="//folio"/></measure> folios, <xsl:if
                                                  test="//blankfolio">of which <measure unit="leaf"
                                                  type="blank"><xsl:value-of select="//blankfolio"
                                                  /></measure> blank, </xsl:if>in <measure
                                                  unit="quire"><xsl:value-of select="//quire"
                                                  /></measure> quires. <!-- each of the above information has a note field, the name of which is not yet known, which would need to be added in the statement-->
                                                <dimensions type="outer">
                                                  <height unit="cm">
                                                  <xsl:value-of select="normalize-space(//mheights)"
                                                  />
                                                  </height>
                                                  <width unit="cm">
                                                  <xsl:value-of select="normalize-space(//mwidth)"/>
                                                  </width>
                                                  <depth unit="cm">
                                                  <xsl:value-of
                                                  select="normalize-space(//mthickness)"/>
                                                  </depth>
                                                  <!--ratio for dispaly can be evaluated on transformation-->
                                                </dimensions>
                                            </extent>

                                            <foliation/>

                                            <xsl:if test="//squire">
                                                <collation>
                                                  <list>
                                                  <xsl:for-each
                                                  select="
                                                                if (contains(//squire, '—')) then
                                                                    (tokenize(//squire, '—'))
                                                                else
                                                                    (tokenize(//squire, '–'))">
                                                  <xsl:sort order="ascending" select="position()"/>
                                                  <item xml:id="{concat('q',position())}">
                                                  <xsl:analyze-string select="."
                                                  regex="(.+\()(\d+)(.+)">
                                                  <xsl:matching-substring>
                                                  <dim unit="leaf">
                                                  <xsl:value-of select="regex-group(2)"/>
                                                  </dim>
                                                  </xsl:matching-substring>
                                                  </xsl:analyze-string>
                                                  <xsl:analyze-string select="."
                                                  regex="(\d+\w)(\-?)(\d+\w)?">
                                                  <xsl:matching-substring>
                                                  <locus>
                                                  <xsl:choose>
                                                  <xsl:when test="regex-group(3)">
                                                  <xsl:attribute name="from">
                                                  <xsl:value-of select="regex-group(1)"/>
                                                  </xsl:attribute>
                                                  <xsl:attribute name="to">
                                                  <xsl:value-of select="regex-group(3)"/>
                                                  </xsl:attribute>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:attribute name="target">
                                                  <xsl:value-of select="regex-group(1)"/>
                                                  </xsl:attribute>
                                                  </xsl:otherwise>
                                                  </xsl:choose>
                                                  </locus>
                                                  </xsl:matching-substring>
                                                  </xsl:analyze-string>

                                                  <xsl:value-of select="."/>
                                                  </item>
                                                  </xsl:for-each>
                                                  </list>
                                                </collation>
                                            </xsl:if>

                                            <condition>
                                                <xsl:variable name="id" select="//catstate/@categid"/>
                                                <xsl:attribute name="key">
                                                  <xsl:value-of
                                                  select="document('controlledList.xml')//tr[@xml:id = 'StatePreservation']/option[@value = $id]"
                                                  />
                                                </xsl:attribute>
                                                <xsl:value-of select="//txstate"/>
                                            </condition>

                                        </supportDesc>
                                        <layoutDesc>



                                            <xsl:for-each select="//taunit">
                                                <layout>
                                                  <xsl:if test="./cl-nm">
                                                  <xsl:attribute name="columns">
                                                  <xsl:value-of select="./cl-nm"/>
                                                  </xsl:attribute>
                                                  </xsl:if>
                                                  <xsl:if test="./ln-nm">
                                                  <xsl:attribute name="writtenLines">
                                                  <xsl:value-of select="./ln-nm"/>
                                                  </xsl:attribute>
                                                  </xsl:if>

                                                  <dimensions unit="mm">
                                                  <height>
                                                  <xsl:value-of select="./ta-height * 10"/>
                                                  </height>
                                                  <width>
                                                  <xsl:value-of select="./ta-width * 10"/>
                                                  </width>
                                                  <dim type="intercolumn">
                                                  <xsl:value-of select="./ta-col2 * 10"/>
                                                  </dim>
                                                  </dimensions>

                                                  <dimensions type="margin">

                                                  <dim type="top">
                                                  <xsl:value-of select="./mr-top * 10"/>
                                                  </dim>
                                                  <dim type="bottom">
                                                  <xsl:value-of select="./mr-bottom * 10"/>
                                                  </dim>
                                                  <dim type="right">
                                                  <xsl:value-of select="./mr-right * 10"/>
                                                  </dim>
                                                  <dim type="left">
                                                  <xsl:value-of select="./mr-left * 10"/>
                                                  </dim>
                                                  <dim type="intercolumn">
                                                  <xsl:value-of select="./mr-col2 * 10"/>
                                                  </dim>
                                                  </dimensions>

                                                  <note>
                                                  <xsl:value-of select="./mr-info"/>
                                                  </note>
                                                  <ab type="ruling">
                                                  <xsl:value-of select="./ln-info"/>
                                                  </ab>
                                                  <xsl:for-each
                                                  select="tokenize(./rl-info, '&#13;')">
                                                  <ab><xsl:choose>
                                                      <xsl:when test="contains(lower-case(.),'ruling') and contains(lower-case(.),'pattern')">
                                                          <xsl:attribute name="type">ruling</xsl:attribute>
                                                          <xsl:attribute name="subtype">patter</xsl:attribute>
                                                          </xsl:when>
                                                      
                                                      <xsl:when test="contains(lower-case(.),'pricking') and contains(lower-case(.),'pattern')">
                                                          <xsl:attribute name="type">pricking</xsl:attribute>
                                                          <xsl:attribute name="subtype">patter</xsl:attribute>
                                                      </xsl:when>
                                                      
                                                      <xsl:when test="contains(lower-case(.),'pricking') or contains(lower-case(.),'pricks')">
                                                          <xsl:attribute name="type">pricking</xsl:attribute>
                                                      </xsl:when>
                                                      
                                                      <xsl:when test="contains(lower-case(.),'ruling')">
                                                          <xsl:attribute name="type">ruling</xsl:attribute>
                                                      </xsl:when>
                                                  </xsl:choose>
                                                      <xsl:value-of select="."/>
                                                  </ab>
                                                  </xsl:for-each>
                                                </layout>
                                            </xsl:for-each>

                                            <layout>
                                                <xsl:if test="//ppunctuation">
                                                  <xsl:for-each
                                                  select="tokenize(//ppunctuation, '&#13;')">

                                                  <!--                                                    punctuation does not reallz belong into layout, but as cruces it would go into the text
                                                    element punctuation in the encoding description describes how the punctuation has been treated for edition
                                                    
                                                    -->



                                                  <xsl:if
                                                  test="contains(., 'Executed') or contains(., 'Usage')">
                                                  <ab type="punctuation">
                                                  <xsl:attribute name="subtype">
                                                  <xsl:value-of
                                                  select="normalize-space(substring-before(., ':'))"
                                                  />
                                                  </xsl:attribute>

                                                  <xsl:value-of
                                                  select="normalize-space(substring-after(., ':'))"
                                                  />
                                                  </ab>
                                                  </xsl:if>




                                                  </xsl:for-each>
                                                  <xsl:variable name="regularizeCount">
                                                  <xsl:choose>
                                                  <xsl:when
                                                  test="contains(//ppunctuation, 'Executed') and contains(//ppunctuation, 'Usage')"
                                                  >-2</xsl:when>
                                                  <xsl:when
                                                  test="contains(//ppunctuation, 'Executed') or contains(//ppunctuation, 'Usage')"
                                                  >-1</xsl:when>
                                                  <xsl:otherwise>0</xsl:otherwise>
                                                  </xsl:choose>
                                                  </xsl:variable>
                                                  <ab type="punctuation">

                                                  <list>
                                                  <xsl:for-each
                                                  select="tokenize(//ppunctuation, '&#13;')">
                                                  <xsl:sort order="ascending" select="position()"/>


                                                  <xsl:if
                                                  test="not(contains(., 'Executed') or contains(., 'Usage'))">
                                                  <xsl:variable name="idnum"
                                                  select="position() + $regularizeCount"/>

                                                  <item xml:id="{concat('div', $idnum)}">
                                                  <xsl:value-of select="."/>
                                                  </item>
                                                  </xsl:if>
                                                  </xsl:for-each>
                                                  </list>
                                                  </ab>
                                                </xsl:if>

                                                <!--in this case, because there are only references in the field, it can be made into a targeting locus. 
                                                    ATTENTION, THIS HAS NO MEANING if there isn't a text with the ids of the pages.
                                                    -->
                                                <!--     cruces do not reallz belong into layout, but as punctuation it would go into the text-->
                                                <xsl:if test="//pcruxansata != ''">
                                                  <ab type="CruxAnsata">
                                                  <xsl:choose>
                                                  <xsl:when test="//pcruxansata = 'no'"
                                                  >no</xsl:when>
                                                      <xsl:when test="//pcruxansata = 'none'"
                                                          >no</xsl:when>
                                                  <xsl:otherwise>
                                                  <locus>
                                                  <xsl:attribute name="target">
                                                  <xsl:for-each
                                                  select="tokenize(substring-after(//pcruxansata, 'fols. '), ',')">
                                                  <xsl:if test="not(position() = last())">
                                                  <xsl:value-of
                                                  select="concat('#', normalize-space(.), ' ')"/>
                                                  </xsl:if>
                                                  </xsl:for-each>
                                                  </xsl:attribute>
                                                  </locus>
                                                  </xsl:otherwise>
                                                  </xsl:choose>
                                                  </ab>
                                                </xsl:if>

                                                <xsl:if test="//pchirhosigns != ''">
                                                  <ab type="ChiRho">
                                                  <xsl:choose>
                                                  <xsl:when test="//pchirhosigns = 'no'"
                                                  >no</xsl:when>
                                                  <xsl:otherwise>
                                                  <locus>
                                                  <xsl:attribute name="target">
                                                  <xsl:for-each
                                                  select="tokenize(substring-after(//pchirhosigns, 'fols. '), ',')">
                                                  <xsl:if test="not(position() = last())">
                                                  <xsl:value-of
                                                  select="concat('#', normalize-space(.), ' ')"/>
                                                  </xsl:if>
                                                  </xsl:for-each>
                                                  </xsl:attribute>
                                                  </locus>
                                                  </xsl:otherwise>
                                                  </xsl:choose>
                                                  </ab>
                                                </xsl:if>


                                                <xsl:if test="//pcoroniss">
                                                  <ab type="coronis">
                                                  <xsl:choose>
                                                  <xsl:when test="//pcoroniss = 'no'">no</xsl:when>
                                                  <xsl:otherwise>
                                                  <locus>
                                                  <xsl:attribute name="target">
                                                  <xsl:for-each
                                                  select="tokenize(substring-after(//pcoroniss, 'fols. '), ',')">
                                                  <xsl:if test="not(position() = last())">
                                                  <xsl:value-of
                                                  select="concat('#', normalize-space(.), ' ')"/>
                                                  </xsl:if>
                                                  </xsl:for-each>
                                                  </xsl:attribute>
                                                  </locus>
                                                  </xsl:otherwise>
                                                  </xsl:choose>
                                                  </ab>
                                                </xsl:if>
                                            </layout>

                                        </layoutDesc>
                                    </objectDesc>
                                    <handDesc>
                                        <xsl:comment>ACHTUNG! first HandNote comes from writing system in Ethiospare. the others are one for each CHANGE OF HAND</xsl:comment>
                                        <xsl:variable name="matchid" select="//wsystem/@categid"/>
                                        <xsl:variable name="id"
                                            select="
                                                if ($matchid != '') then
                                                    (document('controlledList.xml')//tr[@xml:id = 'WritingSystem']/option[@value = $matchid])
                                                else
                                                    ('Ethiopic')"/>

                                        <handNote xml:id="h1" script="{$id}">

                                            <ab type="script">
                                                <xsl:value-of select="//phandwriting"/>
                                            </ab>
                                            <seg type="ink">
                                                <xsl:value-of select="//ink"/>
                                            </seg>
                                            <xsl:for-each select="//nmcopyist">
                                                <persName role="scribe" corresp="PRS00000">
                                                  <xsl:value-of select="."/>
                                                </persName>
                                            </xsl:for-each>
                                            <xsl:for-each select="//copyist">
                                                <xsl:value-of select="."/>
                                            </xsl:for-each>
                                            <date>
                                                <xsl:value-of select="//ptypeofscript"/>
                                            </date>
                                            <xsl:if test="//abbreviation"><list type="abbreviations">
                                            <xsl:for-each select="tokenize(//abbreviation, '&#13;')">
    
                                                <item><xsl:analyze-string select="normalize-space(.)" regex="(.+)(\s)(for)(\s)(.+)(\()">
            <xsl:matching-substring><abbr><xsl:value-of select="regex-group(1)"/></abbr> for <expan><xsl:value-of select="regex-group(5)"/></expan> (</xsl:matching-substring>
            <xsl:non-matching-substring><xsl:value-of select="."/></xsl:non-matching-substring>
            
        </xsl:analyze-string></item>
   
</xsl:for-each> </list></xsl:if>
                                        </handNote>

                                        <xsl:for-each select="tokenize(//pchangeofhand, '&#13;')">
                                            <xsl:sort order="ascending" select="position()"/>
                                            <handNote xml:id="{concat('h',position() + 1)}"
                                                script="{$id}">
                                                <xsl:value-of select="substring-after(., ': ')"/>
                                            </handNote>
                                        </xsl:for-each>
                                    </handDesc>


                                    <xsl:if test="//drawings or //frames">
                                        <decoDesc>
                                            <xsl:for-each select="//drawing">

                                                <decoNote type="miniature">
                                                  <xsl:attribute name="xml:id">
                                                  <xsl:value-of select="concat('d', position())"/>
                                                  </xsl:attribute>
                                                  <xsl:analyze-string
                                                  select="normalize-space(./info)"
                                                  regex="(.+:\s)(.+)">
                                                  <xsl:matching-substring>

                                                  <locus>
                                                  <xsl:attribute name="target">
                                                  <xsl:value-of
                                                  select="concat('#', substring-after(substring-before(regex-group(1), ':'), 'Fol. '))"
                                                  />
                                                  </xsl:attribute>
                                                  <xsl:value-of select="regex-group(1)"/>
                                                  </locus>
                                                  <desc>
                                                  <xsl:value-of select="regex-group(2)"/>
                                                  </desc>

                                                  </xsl:matching-substring>
                                                  </xsl:analyze-string>

                                                </decoNote>
                                            </xsl:for-each>
                                            <xsl:variable name="numberofdrawings"
                                                select="count(//drawing)"/>
                                            <xsl:for-each select="tokenize(//frame, '&#13;')">
                                                <!--                                            tokenization leaves blanks and counts for them... source data to be fixed...-->
                                                <decoNote type="frame">
                                                  <xsl:attribute name="xml:id">
                                                  <xsl:value-of
                                                  select="concat('d', position() + $numberofdrawings)"
                                                  />
                                                  </xsl:attribute>
                                                  <xsl:analyze-string select="normalize-space(.)"
                                                  regex="(\d+\)\s)(.+:\s)(.+)">
                                                  <xsl:matching-substring>
                                                  <locus>
                                                  <xsl:attribute name="target">
                                                  <xsl:value-of
                                                  select="concat('#', substring-after(substring-before(regex-group(2), ':'), 'Fol. '))"
                                                  />
                                                  </xsl:attribute>
                                                  <xsl:value-of select="regex-group(2)"/>
                                                  </locus>
                                                  <desc>
                                                  <xsl:value-of select="regex-group(3)"/>
                                                  </desc>
                                                  </xsl:matching-substring>
                                                  <xsl:non-matching-substring>
                                                  <xsl:value-of select="."/>
                                                  </xsl:non-matching-substring>
                                                  </xsl:analyze-string>
                                                </decoNote>
                                            </xsl:for-each>
                                        </decoDesc>
                                    </xsl:if>


                                    <xsl:if test="//additionals">
                                        <additions>
                                            <xsl:comment>THIS element in domlib CONTAINS ESCAPED HTML, thus it is not possible to reliably extract the information about pages. Please watch out.</xsl:comment>

                                            <list>
                                                <xsl:for-each select="//additional">
                                                  <item>
                                                  <!--THIS CONTAINS ESCAPED HTML!!!
                                                  disabled escaping of entities (!!)
                                                  span elements containing floating info remain and the post processing to remove them is unlikely
                                                  could be done with a second layer of processing to match span and kill it
                                                  -->
                                                  <xsl:attribute name="xml:id">
                                                  <xsl:value-of select="concat('a', position())"/>
                                                  </xsl:attribute>

                                                  <locus/>

                                                  <!-- <xsl:analyze-string select="./cont"
                                                      regex="(Fol\.\s)(\d{{1,3}}\w{{1,2}})(,\sl\.\s)?(\d{{1,3}})?(-\d{{1,3}})?">
                                                  <xsl:matching-substring>
                                                  <xsl:attribute name="target">
                                                  <xsl:value-of select="concat('#', regex-group(2))"
                                                  />
                                                  </xsl:attribute>
                                                      <xsl:attribute name="n">
                                                          <xsl:value-of select="concat('#', regex-group(4))"
                                                          />
                                                      </xsl:attribute>
                                                  </xsl:matching-substring>
                                                      <xsl:non-matching-substring>
                                                          <xsl:attribute name="target">#00</xsl:attribute>
                                                      </xsl:non-matching-substring>
                                                     </xsl:analyze-string>-->

                                                  <xsl:value-of
                                                  select="normalize-space(./cont)"
                                                  disable-output-escaping="yes"/>
                                                  
                                                  <q xml:lang="gez">
                                                  <xsl:value-of
                                                  select="normalize-space(./add)"
                                                  disable-output-escaping="yes"/>
                                                  </q>
                                                  <!--language assumed-->
                                                  <q xml:lang="en">
                                                  <xsl:value-of
                                                  select="normalize-space(./tran)"
                                                  disable-output-escaping="yes"/>
                                                  </q>
                                                  <!--translation-->
                                                  <p>
                                                  <xsl:value-of
                                                  select="./det"
                                                  disable-output-escaping="yes"/>
                                                  </p>
                                                  </item>
                                                </xsl:for-each>
                                                <xsl:if test="//extra">
                                                  <xsl:for-each select="//extra">
                                                  <item>
                                                  <xsl:attribute name="xml:id">
                                                  <xsl:value-of select="concat('e', position())"/>
                                                  </xsl:attribute>
                                                  <xsl:value-of select="."/>
                                                  </item>
                                                  </xsl:for-each>
                                                </xsl:if>
                                            </list>
                                        </additions>
                                    </xsl:if>
                                    <bindingDesc>

                                        <xsl:variable name="id" select="//bnoriginal/@categid"/>
                                        <binding>
                                            <xsl:if test="$id != ''">
                                                <xsl:attribute name="contemporary">
                                                  <xsl:value-of
                                                  select="document('controlledList.xml')//tr[@xml:id = 'OriginalBinding']/option[@value = $id]"
                                                  />
                                                </xsl:attribute>
                                            </xsl:if>

                                            <decoNote xml:id="b1">
                                                <xsl:value-of select="//binding"/>
                                            </decoNote>
                                            <decoNote xml:id="b2" type="bindingMaterial">
                                                <xsl:for-each select="//bnmaterial">
                                                  <material>

                                                  <xsl:variable name="idmat" select="@categid"/>
                                                  <xsl:attribute name="key">
                                                  <xsl:value-of
                                                  select="document('controlledList.xml')//tr[@xml:id = 'BindingMaterial']/option[@value = $idmat]"
                                                  />
                                                  </xsl:attribute>
                                                  </material>
                                                </xsl:for-each>
                                            </decoNote>
                                            <decoNote xml:id="b3" type="Endbands">
                                                <xsl:if test="//bnendbands = 'true'">
                                                  <desc type="Headband"/>
                                                  <desc type="Tailband"/>
                                                </xsl:if>
                                            </decoNote>
                                            <decoNote xml:id="b4" type="Other">
                                                <xsl:value-of select="//bnother"/>
                                            </decoNote>

                                            <!--                                            elements in model for headband and tailband not known, might be used to fill this with a choose element falling back on Endbands-->

                                        </binding>

                                    </bindingDesc>
                                </physDesc>

                                <history>
                                    <origin>
                                        <origPlace>
                                            <xsl:variable name="institutionIDorig"
                                                select="
                                                    concat('INS',
                                                    format-number(
                                                    number(
                                                    substring-after(//originlink/@xlink:href, 'domlib_institution_')), '0000'),
                                                    if (contains(//originlink/@xlink:title, '/'))
                                                    then
                                                        (replace(substring-after(//originlink/@xlink:title, '/'), ' ', ''))
                                                    else
                                                        (substring(//originlink/@xlink:title, 0, 5)))"/>

                                            <placeName corresp="{$institutionIDorig}">
                                                <xsl:value-of select="//originlink/@xlink:title"/>
                                            </placeName>
                                        </origPlace>
                                        <origDate>
                                            <xsl:attribute name="notBefore">
                                                <xsl:value-of select="//fdating"/>
                                                <!--check formatting-->
                                            </xsl:attribute>
                                            <xsl:attribute name="notAfter">
                                                <xsl:value-of select="//tdating"/>
                                                <!--check formatting-->
                                            </xsl:attribute>
                                            <xsl:value-of select="//dcomment"/>
                                        </origDate>
                                    </origin>

                                </history>
                                <!--                                boolean fields these perhaps use xsl:if to enter appropriate info
                                    
                                    
                                
                                Dated :	no  :               this would be determined by the presence of a @when in origDate  
Palimpsest :	no    :              rs[@type='palimpsest']  NO ELEMENT NAME KNOWN in mycore
Composite :	no     :             this would be determined by the presence of msPart into msDesc NO ELEMENT NAME KNOWN in mycore
Fragment :	no      :            this would be stated in element     condition NO ELEMENT NAME KNOWN in mycore
Illuminated :	no    :              this belongs to decoDesc    NO ELEMENT NAME KNOWN in mycore
Additiones :	yes   :               These are all listed in additions and get an id 
Musical notation :	no   in rs[@type='musicalNotation'] within handDesc or layoutDesc NO ELEMENT NAME KNOWN in mycore
Autograph :	no      NO ELEMENT NAME KNOWN in mycore
Printed part :	no NO ELEMENT NAME KNOWN in mycore
Incomplete :	no    this would be stated in condition NO ELEMENT NAME KNOWN in mycore
Colophon :	no  in colophon element NO ELEMENT NAME KNOWN in mycore
Restoration :	none  rs[@type=restorations] in custodialHist 
 
 number of texts 
 number of production units
                                -->
                                <additional>
                                    <adminInfo>
                                        <recordHist>
                                            <source>
                                                <listBibl type="catalogue">
                                                  <bibl/>
                                                </listBibl>
                                            </source>
                                            <!--
                                               
                                                <p>
                                                <note>
                                                  <xsl:value-of select="normalize-space(//nmunits)"
                                                  />
                                                </note>
                                            </p>
                                            
                                                not really appropriate, but it is where the number of production unit would belong theoretically
                                            
                                        both this value and nmtexts should be inferred from the number of msParts and divs in the text transcription for nmtexts
                                        identification of these should follow urn patters and be reproduced in the text
                                        
                                        my impression is that the parts are not actually pyhsical parts being listed, and are rather the texts, thus belonging to divs in the text, while in msPart only well described production units should be described
                                        -->
                                        </recordHist>
                                        <custodialHist>

                                            <custEvent type="restorations">
                                                <xsl:variable name="id"
                                                  select="//restoration/@categid"/>
                                                <xsl:attribute name="subtype">
                                                  <xsl:value-of
                                                  select="document('controlledList.xml')//tr[@xml:id = 'Restoration']/option[@value = $id]"
                                                  />
                                                </xsl:attribute>
                                            </custEvent>
                                        </custodialHist>
                                    </adminInfo>
                                    <surrogates>
                                        <bibl/>
                                    </surrogates>
                                    <listBibl type="secondary">
                                        <bibl>
                                            <xsl:value-of select="//mslit"/>
                                        </bibl>
                                    </listBibl>

                                </additional>
                            </msDesc>
                        </sourceDesc>
                    </fileDesc>

                    <encodingDesc>
                        <projectDesc>
                            <p>Encoded according to TEI P5 Guidelines.</p>
                        </projectDesc>
                    </encodingDesc>
                    <profileDesc>
                        <particDesc>
                            <listPerson>
                                <person>
                                    <xsl:comment>donor</xsl:comment>
                                    <persName corresp="PRS0000">
                                        <xsl:value-of select="//donor"/>
                                    </persName>
                                    <xsl:comment>ACHTUNG! This is actually paragraphic information identifying the donor. 
                                        Person/persName should only contain the person name, not all the paragraph.</xsl:comment>

                                </person>
                                <xsl:for-each select="//nmcopyist">
                                    <person>
                                        <persName role="scribe" corresp="PRS00000">
                                            <xsl:value-of select="."/>
                                        </persName>

                                    </person>
                                </xsl:for-each>
                                <person>
                                    <persName corresp="PRS00000"/>
                                    <xsl:comment>other</xsl:comment>

                                </person>
                            </listPerson>
                        </particDesc>
                        <xsl:if test="//subject">
                            <textClass>
                                <keywords>
                                    <xsl:for-each select="//subject">
                                        <term>
                                            <xsl:variable name="id" select="./@categid"/>
                                            <xsl:attribute name="key">
                                                <xsl:value-of
                                                  select="replace(document('controlledList.xml')//tr[@xml:id = 'subject']/option[@value = $id], ' ', '')"
                                                />
                                            </xsl:attribute>
                                        </term>
                                    </xsl:for-each>
                                </keywords>
                            </textClass>
                        </xsl:if>
                        <langUsage>
                            <language ident="en">Inglese</language>
                            <language ident="it">Italiano</language>
                            <xsl:for-each select="//language">
                                <language>
                                    <xsl:variable name="id"
                                        select="
                                            if (./@categid != 'Lan00') then
                                                (./@categid)
                                            else
                                                (./@other)"/>
                                    <xsl:choose>
                                        <xsl:when test="./@categid = 'Lan00'">
                                            <xsl:value-of select="./@other"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:attribute name="ident">
                                                <xsl:value-of
                                                  select="document('controlledList.xml')//tr[@xml:id = 'language']/option[@value = $id]/@name"
                                                />
                                            </xsl:attribute>
                                            <xsl:attribute name="xml:id">
                                                <xsl:value-of
                                                  select="document('controlledList.xml')//tr[@xml:id = 'language']/option[@value = $id]/@value"
                                                />
                                            </xsl:attribute>
                                            <xsl:value-of
                                                select="document('controlledList.xml')//tr[@xml:id = 'language']/option[@value = $id]"
                                            />
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </language>
                            </xsl:for-each>
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
                                        <xsl:when test="contains(., 'ethioleader')">DN</xsl:when>
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
                        <ab/>
                    </body>
                </text>
            </TEI>

        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>
