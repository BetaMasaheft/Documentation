<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xlink="http://www.w3.org/1999/xlink" exclude-result-prefixes="xlink" version="2.0">

    <xsl:output encoding="UTF-8" method="xml"/>
    <xsl:output indent="yes"/>


    <xsl:template match="/">
        <xsl:result-document href="results/{concat(mycoreobject/@ID ,'.xml')}" method="xml">
            <TEI xmlns="http://www.tei-c.org/ns/1.0" xml:id="{mycoreobject/@ID}" xml:lang="en">
                <teiHeader>
                    <fileDesc>
                        <titleStmt>
                            <title>
                                <xsl:value-of select="//titles/title"/>
                            </title>
                            <xsl:for-each select="//regbys">
                                <author xml:id="{//regby}"/>
                            </xsl:for-each>
                            <editor xml:id="Bausi">Alessandro Bausi</editor>
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
                                <xsl:value-of select="current-date()"/>
                            </date>
                        </publicationStmt>
                        <sourceDesc>
                            <msDesc>
                                <!--not sure this is the right place in the TEI doc, neither is in the first sample the mycore element name visible-->
                                <msIdentifier>
                                    <xsl:variable name="institutionUrl" select="concat('http://mycms-vs03.rrz.uni-hamburg.de/domlib/receive/',//locationlink/@xlink:href,'?XSL.Style=xml')"/>
                                    
                                    <settlement>
                                        <placeName>
                                            <xsl:attribute name="corresp"><xsl:value-of select="//locationlink/@xlink:href"/></xsl:attribute>
                                            <xsl:element name="geo">
                                                <xsl:value-of select="document($institutionUrl)//latitude"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="document($institutionUrl)//longitude"/>
                                            </xsl:element>
                                           <xsl:value-of select="//locationlink/@xlink:title"/>
                                        <region>
                                        <xsl:value-of select="document($institutionUrl)//area"></xsl:value-of>
                                        
                                    </region>
                                        </placeName>
                                    </settlement>
                                    
                                    <!--further info might be retrived following link and reading xml doc-->
                                    <repository>repository name</repository>
                                    <xsl:for-each select="//signature">
                                        <xsl:choose>
                                            <xsl:when test="position() = last()">
                                                <altIdentifier>
                                                  <idno>
                                                  <xsl:value-of select="."/>
                                                  </idno>
                                                </altIdentifier>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <idno>
                                                  <xsl:value-of select="."/>
                                                </idno>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:for-each>
                                </msIdentifier>
                                <msContents>
                                    
                                    <msItemStruct>
                                        <!--used here to give information which would belong in each item but are given in general
                                        and for some of the information under Description of contents in the mycore database.
                                        
                                        -->
                                        
                                        <xsl:for-each select="//desccontent">
                                            <xsl:if test="./folios"><locus>
                                                <xsl:attribute name="from">
                                                    <xsl:value-of select="substring-before(normalize-space(./folios),'-')"/>
                                                </xsl:attribute>
                                                
                                                <xsl:attribute name="to">
                                                    <xsl:value-of select="substring-after(normalize-space(./folios),'-')"/>
                                                </xsl:attribute>
                                                <xsl:value-of select="./folios"/>
                                            </locus></xsl:if>
                                            <xsl:if test="./text"> <title>
                                                <xsl:attribute name="type"><xsl:value-of select="./completeness"/></xsl:attribute>
                                                <xsl:value-of select="./text"/></title></xsl:if>
                                            <rubric><xsl:value-of select="//rubrication"/></rubric>
                                            <incipit>
                                                <xsl:value-of
                                                    select="normalize-space(substring-before(substring-after(./incipit, '&lt;p&gt;'), '&lt;/p&gt;'))"
                                                disable-output-escaping="yes"/>
                                                <foreign xml:lang="en">
                                                    <xsl:value-of
                                                        select="normalize-space(substring-before(substring-after(./itranslation, '&lt;p&gt;'), '&lt;/p&gt;'))"
                                                        disable-output-escaping="yes"/></foreign></incipit>
                                        <explicit>
                                            
                                            <xsl:value-of
                                                select="normalize-space(substring-before(substring-after(./explicit, '&lt;p&gt;'), '&lt;/p&gt;'))"
                                                disable-output-escaping="yes"/>
                                            <foreign xml:lang="en">
                                                <xsl:value-of
                                                    select="normalize-space(substring-before(substring-after(./etranslation, '&lt;p&gt;'), '&lt;/p&gt;'))"
                                                    disable-output-escaping="yes"/></foreign>
                                        </explicit>
                                            
                                            <xsl:if test="./mss"><listBibl type="mss">
                                                <!--here is a list of related manuscript-->
                                                <xsl:for-each select="tokenize(./mss,'&#13;')">
                                                <bibl>
                                                    
                                                    <xsl:analyze-string select="normalize-space(.)" regex="(.+)(\s)((\(.+\)),\s)(\((.+)\)(;|.))">
                                                        <xsl:matching-substring>
                                                            <xsl:attribute name="corresp"><xsl:value-of select="concat('#',replace(regex-group(1),' ', '_'))"/></xsl:attribute>
                                                            <xsl:value-of select="regex-group(6)"/><date><xsl:value-of select="regex-group(4)"/></date>
                                                        </xsl:matching-substring>
                                                        <xsl:non-matching-substring>
                                                            <xsl:value-of select="."/>
                                                        </xsl:non-matching-substring>
                                                    </xsl:analyze-string>
                                                   
                                                </bibl>
                                                </xsl:for-each>
                                            </listBibl></xsl:if>
                                            
                                            <xsl:if test=".//edition/text"><listBibl type="editions">
                                                    <xsl:for-each select="tokenize(.//edition/text,'&#13;')">
                                                        <bibl>
                                                           <!--only string, this bibliography can be marked up, then pointers and targets can be used-->
                                                                    <xsl:value-of select="."/>
                                                            
                                                        </bibl>
                                                    </xsl:for-each>
                                                
                                            </listBibl></xsl:if>
                                            
                                            <xsl:if test=".//literature/text"><listBibl type="text">
                                                <bibl>
                                                    <xsl:for-each select="tokenize(.//literature/text,'&#13;')">
                                                        <bibl>
                                                            
                                                            <xsl:value-of select="."/>
                                                            
                                                        </bibl>
                                                    </xsl:for-each>
                                                </bibl>
                                            </listBibl></xsl:if>
                                       </xsl:for-each>
                                        <note>
<!--                                            this element largely repeates, if it is not identical to short contents-->
                                            <xsl:value-of
                                                select="normalize-space(substring-before(substring-after(./details, '&lt;p&gt;'), '&lt;/p&gt;'))"
                                                disable-output-escaping="yes"/>
                                        </note>
<!--                                        MISSING ELEMENT IN MYCORE SAMPLE : "OTHER IMPORTANT PASSAGES"-->
                                    </msItemStruct>
                                    
                                    <!--                                    this requires breaking string text and clarification on who info is entered.
                                    
                                    unstructured list + additiones 
                                    
                                    language can be used to analyze-string.
                                    
                                    assign combination of ms identifier and points in list as xml:id to each msItem
                                    -->
                                    <xsl:for-each select="tokenize(//shortcontent, '&#xD;')">
                                        <xsl:analyze-string select="normalize-space(.)"
                                            regex="([A-Z]+\-*\d*\))(\s)(.+)(\(fols.+\))">
                                            <xsl:matching-substring>
                                                <msItem>
                                                  <xsl:attribute name="xml:id">
                                                  <xsl:value-of
                                                  select="concat('msitem_', substring-before(regex-group(1), ')'))"
                                                  />
                                                  </xsl:attribute>
                                                  <locus>
                                                  <xsl:analyze-string select="regex-group(4)" regex="(\()(fols\.\s)([0-9A-Za-z-]+)(\))">
                                                      <xsl:matching-substring>
                                                          <xsl:attribute name="from"><xsl:value-of select="substring-before(regex-group(3),'-')"/></xsl:attribute>
                                                          <xsl:attribute name="to"><xsl:value-of select="substring-after(regex-group(3),'-')"/></xsl:attribute>
                                                          <xsl:value-of select="concat(regex-group(2),regex-group(3))"/>
                                                      </xsl:matching-substring>
                                                      <xsl:non-matching-substring>
                                                          <xsl:value-of select="."/>
                                                      </xsl:non-matching-substring>
                                                  </xsl:analyze-string>
                                                  </locus>
                                                  <!-- given?? <author xml:lang=""></author>-->
                                                  <title type="uniform" xml:lang="la">
                                                  <xsl:value-of select="regex-group(3)"/>
                                                  </title>
                                                  <!-- after list point-->
                                                <!--  <incipit xml:lang=""/>
                                                  <explicit xml:lang=""/>-->
                                                  <textLang mainLang="gez">Ge'ez</textLang>
                                                  <!--info to be retrived for each part?-->
                                                  <!--value mapped to value list not at hand. Once obtained needs to be mapped to proper ISO values ge'ez = gez-->
                                                </msItem>
                                            </xsl:matching-substring>
                                            <xsl:non-matching-substring>
                                                <msItem>
                                                  <title>
                                                  <xsl:value-of select="."/>
                                                  </title>
                                                </msItem>
                                            </xsl:non-matching-substring>
                                        </xsl:analyze-string>
                                    </xsl:for-each>
                                    <msItem>
                                        <colophon>
                                            <locus>
                                                <xsl:value-of
                                                  select="normalize-space(substring-before(substring-after(//colophon/col, '&lt;p&gt;'), ':'))"
                                                />
                                            </locus>
                                            <xsl:value-of
                                                select="normalize-space(substring-before(substring-after(//colophon/col, ':'), '&lt;/p&gt;'))"
                                                disable-output-escaping="yes"/>
                                            <xsl:value-of select="//colophon/det"/>
                                        </colophon>
                                        <!--                                        filiation 
                                            contains information concerning the manuscript's filiation, i.e. its relationship to other surviving manuscripts of the same text, its protographs, antigraphs and apographs.
                                        note contains a note or annotation.-->
                                    </msItem>
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
                                                  <xsl:attribute name="xml:id">
                                                  <xsl:value-of
                                                  select="document('controlledList.xml')//tr[@xml:id = 'WritingMaterial']/option[@value = $id]/@value"
                                                  />
                                                  </xsl:attribute>
                                                  <xsl:value-of
                                                  select="document('controlledList.xml')//tr[@xml:id = 'WritingMaterial']/option[@value = $id]"
                                                  />
                                                </material>
                                            </support>
                                            <extent>Made of <xsl:value-of select="//folio"/> folios,
                                                <xsl:if test="//blankfolio">of which <xsl:value-of select="//blankfolio"/>
                                                blank, </xsl:if>in <xsl:value-of select="//quire"/> quires. <!-- each of the above information has a note field, the name of which is not yet known, which would need to be added in the statement-->
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

                                            <foliation>
                                                <xsl:value-of select="//squire"/>
                                            </foliation>
                                            <condition>
                                                <rs type="statPreserv">
                                                  <xsl:variable name="id"
                                                  select="//catstate/@categid"/>
                                                  <xsl:attribute name="xml:id">
                                                  <xsl:value-of
                                                  select="document('controlledList.xml')//tr[@xml:id = 'StatePreservation']/option[@value = $id]/@value"
                                                  />
                                                  </xsl:attribute>
                                                  <xsl:value-of
                                                  select="document('controlledList.xml')//tr[@xml:id = 'StatePreservation']/option[@value = $id]"
                                                  />
                                                </rs>

                                                <xsl:value-of select="//txstate"/>
                                            </condition>

                                        </supportDesc>
                                        <layoutDesc>
                                            <xsl:for-each select="//taunit">
                                                <layout>
                                                    <xsl:if test="./cl-nm"> 
                                                        <xsl:attribute name="columns">
                                                  <xsl:value-of select="./cl-nm"/>
                                                  </xsl:attribute></xsl:if>
                                                    <xsl:if test="./ln-nm"><xsl:attribute name="writtenLines">
                                                  <xsl:value-of select="./ln-nm"/>
                                                  </xsl:attribute></xsl:if>

                                                  <dimensions>
                                                  <height unit="cm">
                                                  <xsl:value-of select="./ta-height"/>
                                                  </height>
                                                  <width unit="cm">
                                                  <xsl:value-of select="./ta-width"/>
                                                  </width>
                                                  <dim type="intercolumn">
                                                  <xsl:value-of select="./ta-col2"/>
                                                  </dim>
                                                  </dimensions>

                                                  <dimensions type="margin">

                                                  <dim type="top">
                                                  <xsl:value-of select="./mr-top"/>
                                                  </dim>
                                                  <dim type="bottom">
                                                  <xsl:value-of select="./mr-bottom"/>
                                                  </dim>
                                                  <dim type="right">
                                                  <xsl:value-of select="./mr-right"/>
                                                  </dim>
                                                  <dim type="left">
                                                  <xsl:value-of select="./mr-left"/>
                                                  </dim>
                                                  <dim type="intercolumn">
                                                  <xsl:value-of select="./mr-col2"/>
                                                  </dim>
                                                  </dimensions>
                                                  <p>
                                                  <locus>
                                                  <xsl:value-of select="./mr-info"/>
                                                  <!--locus can take specification of the area described with this layout-->
                                                  </locus>
                                                  <xsl:value-of select="./ln-info"/>
                                                  </p>
                                                  <xsl:for-each
                                                  select="tokenize(./rl-info, '&#13;')">
                                                  <p>
                                                  <xsl:value-of select="."/>
                                                  </p>
                                                  </xsl:for-each>

                                                </layout>
                                            </xsl:for-each>
                                            
                                            <xsl:for-each select="tokenize(//ppunctuation,'&#13;')">
                                                <layout>
                                                    
<!--                                                    punctuation does not reallz belong into layout, but as cruces it would go into the text
                                                    element punctuation in the encoding description describes how the punctuation has been treated for edition
                                                    
                                                    -->
                                                    <ab type="punctuation">
                                                        <xsl:if test="contains(.,'Executed') or contains(.,'Usage') ">
                                                            <xsl:attribute name="subtype"><xsl:value-of select="substring-before(.,':')"/></xsl:attribute>
                                                        </xsl:if>
                                                        
                                                        <xsl:value-of select="normalize-space(.)"/>
                                                    
                                                </ab>
                                                </layout>
                                                </xsl:for-each>
                                                
                                            <layout>
                                                    <!--in this case, because there are only references in the field, it can be made into a targeting locus. 
                                                    ATTENTION, THIS HAS NO MEANING if there isn't a text with the ids of the pages.
                                                    -->
                                                    <!--     cruces do not reallz belong into layout, but as punctuation it would go into the text-->
                                                    <xsl:if test="//pcruxansata">
                                                        <ab type="cruces">
                                                       <xsl:choose><xsl:when test="//pcruxansata = 'no'">no</xsl:when><xsl:otherwise><locus> 
                                                      <xsl:attribute name="target">
                                                          <xsl:for-each select="tokenize(substring-after(//pcruxansata,'fols. '),',')">
                                                              <xsl:if test="not(position()=last())"><xsl:value-of select="concat('#',normalize-space(.),' ')"/></xsl:if>
                                                       </xsl:for-each>
                                                      </xsl:attribute>
                                                        </locus></xsl:otherwise></xsl:choose>
                                                    </ab></xsl:if>
                                                </layout>
                                            
<!--                                            CORONIS and CHIRHO ARE NOT IN THE SAMPLE, BUT COULD BE TREATED IN THE VERY SAME WAY-->
                                            
                                            
                                        </layoutDesc>
                                    </objectDesc>
                                    <handDesc>
                                        <handNote>
                                            <xsl:variable name="id" select="//wsystem/@categid"/>
                                            <xsl:attribute name="script">
                                                <xsl:value-of
                                                  select="document('controlledList.xml')//tr[@xml:id = 'WritingSystem']/option[@value = $id]/@value"
                                                />
                                            </xsl:attribute>
                                            <xsl:value-of
                                                select="document('controlledList.xml')//tr[@xml:id = 'WritingSystem']/option[@value = $id]"/>
                                            <rs type="ink">
                                                <xsl:value-of select="//ink"/>
                                            </rs>
                                            <name role="copyst"/>
                                            <!--  <xsl:if test="// "><notatedMusic/></xsl:if>
                                            takes a yes or no from the musical notation boolean, not yet known-->

                                            <!--not in the first sample, no element name to insert value-->

                                            <date>
                                                <xsl:value-of select="//ptypeofscript"/>
                                            </date>

                                        </handNote>
                                        <handNote>
                                            <p>
                                                <xsl:value-of select="//phandwriting"/>
                                            </p>
                                        </handNote><!--each hand can take the id of the scribe-->
                                    </handDesc>
                                    
                                    
                                    <xsl:if test="//drawings or //frames"><decoDesc>
                                        <xsl:for-each select="//drawing">
                                            <decoNote type="miniature">
                                                <xsl:attribute name="xml:id"><xsl:value-of select="concat('min_',position())"/></xsl:attribute>
                                                <xsl:analyze-string select="normalize-space(./info)" regex="(.+:\s)(.+)">
                                                    <xsl:matching-substring>
                                                        <p>
                                                    <locus>
                                                        <xsl:attribute name="target"><xsl:value-of select="concat('#',substring-after(substring-before(regex-group(1),':'),'Fol. '))"/></xsl:attribute>
                                                        <xsl:value-of select="regex-group(1)"/></locus>
                                                    <xsl:value-of select="regex-group(2)"/></p>
                                                    </xsl:matching-substring>
                                                </xsl:analyze-string>
                                            </decoNote>
                                        </xsl:for-each>
                                        
                                        <xsl:for-each select="tokenize(//frame,'&#13;')">
<!--                                            tokenization leaves blanks and counts for them... source data to be fixed...-->
                                            <decoNote type="frames">
                                                <xsl:attribute name="xml:id"><xsl:value-of select="concat('frm_',position())"/></xsl:attribute>
                                                <xsl:analyze-string select="normalize-space(.)" regex="(\d+\)\s)(.+:\s)(.+)">
                                                    <xsl:matching-substring>
                                                        <p>
                                                            <locus>
                                                                <xsl:attribute name="target"><xsl:value-of select="concat('#',substring-after(substring-before(regex-group(2),':'),'Fol. '))"/></xsl:attribute>
                                                                <xsl:value-of select="regex-group(2)"/></locus>
                                                            <xsl:value-of select="regex-group(3)"/></p>
                                                    </xsl:matching-substring>
                                                    <xsl:non-matching-substring>
                                                        <xsl:value-of select="."/>
                                                    </xsl:non-matching-substring>
                                                </xsl:analyze-string>
                                            </decoNote>
                                        </xsl:for-each>
                                    </decoDesc></xsl:if>


                                   <xsl:if test="//additionals"> <additions>
                                        <list>
                                            <xsl:for-each select="//additional">
                                                <item>
                                                  <!--THIS CONTAINS ESCAPED HTML!!!
                                                  disabled escaping of entities (!!)
                                                  span elements containing floating info remain and the post processing to remove them is unlikely
                                                  could be done with a second layer of processing to match span and kill it
                                                  -->
                                                  <xsl:attribute name="xml:id">
                                                  <xsl:value-of
                                                  select="concat('addition_', position())"/>
                                                  </xsl:attribute>
                                                  <locus>
                                                  <xsl:value-of
                                                  select="normalize-space(substring-before(substring-after(./cont, '&lt;p&gt;'), '&lt;/p&gt;'))"
                                                  disable-output-escaping="yes"/>
                                                  </locus>
                                                  <q xml:lang="gez">
                                                  <xsl:value-of
                                                  select="normalize-space(substring-before(substring-after(./add, '&lt;p&gt;'), '&lt;/p&gt;'))"
                                                  disable-output-escaping="yes"/>
                                                  </q>
                                                  <!--language assumed-->
                                                  <q xml:lang="en">
                                                  <xsl:value-of
                                                  select="normalize-space(substring-before(substring-after(./tran, '&lt;p&gt;'), '&lt;/p&gt;'))"
                                                  disable-output-escaping="yes"/>
                                                  </q>
                                                  <!--translation-->
                                                  <p>
                                                  <xsl:value-of
                                                  select="substring-before(substring-after(./det, '&lt;p&gt;'), '&lt;/p&gt;')"
                                                  disable-output-escaping="yes"/>
                                                  </p>
                                                </item>
                                            </xsl:for-each>
                                            <xsl:if test="//extra"><xsl:for-each select="//extra">
                                                <item>
                                                    <xsl:attribute name="xml:id">
                                                        <xsl:value-of
                                                            select="concat('extra_', position())"/>
                                                    </xsl:attribute>
                                                    <xsl:value-of select="."/>
                                                </item>
                                            </xsl:for-each></xsl:if>
                                        </list>
                                    </additions></xsl:if>
                                    <bindingDesc>
                                        <p>
                                            <!--
                                                NEED NAME OF STATE OF BINDING ELEMENT IN MYCORE
                                                
                                                <rs type="statPreserv">
                                                <xsl:variable name="id"
                                                    select="//catstate/@categid"/>
                                                <xsl:attribute name="xml:id">
                                                    <xsl:value-of
                                                        select="document('controlledList.xml')//tr[@xml:id = 'StatePreservation']/option[@value = $id]/@value"
                                                    />
                                                </xsl:attribute>
                                                <xsl:value-of
                                                    select="document('controlledList.xml')//tr[@xml:id = 'StatePreservation']/option[@value = $id]"
                                                />
                                            </rs>-->
                                            <xsl:value-of select="//binding"/>
                                            <xsl:if test="//bnendbands = 'true'">
                                                <rs type="bands">Endbands
                                                  <!--                                            elements in model for headband and tailband not known, might be used to fill this with a choose element falling back on Endbands-->
                                                </rs>
                                            </xsl:if>
                                            <!--boolean value-->
                                            <rs type="original">
                                                <xsl:variable name="id"
                                                  select="//bnoriginal/@categid"/>
                                                <xsl:attribute name="xml:id">
                                                  <xsl:value-of
                                                  select="document('controlledList.xml')//tr[@xml:id = 'OriginalBinding']/option[@value = $id]/@value"
                                                  />
                                                </xsl:attribute>
                                                <xsl:value-of
                                                  select="document('controlledList.xml')//tr[@xml:id = 'OriginalBinding']/option[@value = $id]"
                                                />
                                            </rs>
                                            <!-- probably does not belong here but in custodHist-->

                                            <xsl:for-each select="//bnmaterial">
                                                <material>
                                                <xsl:variable name="id"
                                                  select="@categid"/>
                                                <xsl:attribute name="xml:id">
                                                  <xsl:value-of
                                                  select="document('controlledList.xml')//tr[@xml:id = 'BindingMaterial']/option[@value = $id]/@value"
                                                  />
                                                </xsl:attribute>
                                                <xsl:value-of
                                                  select="document('controlledList.xml')//tr[@xml:id = 'BindingMaterial']/option[@value = $id]"
                                                />
                                            </material></xsl:for-each>
                                        </p>
                                        <p>
                                            <xsl:value-of select="//bnother"/>
                                        </p>
                                    </bindingDesc>
                                </physDesc>

                                <history>
                                    <origin>
                                        <origPlace>
                                            <xsl:value-of select="//originlink/@xlink:title"/>
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
                                            <p>
                                                <note>
                                                  <xsl:value-of select="normalize-space(//nmunits)"
                                                  />
                                                </note>
                                            </p>
                                            <!--
                                                not really appropriate, but it is where the number of production unit would belong theoretically
                                            
                                        both this value and nmtexts should be inferred from the number of msParts and divs in the text transcription for nmtexts
                                        identification of these should follow urn patters and be reproduced in the text
                                        
                                        my impression is that the parts are not actually pyhsical parts being listed, and are rather the texts, thus belonging to divs in the text, while in msPart only well described production units should be described
                                        -->
                                        </recordHist>
                                        <custodialHist>
                                            <p>
                                                <rs type="restorations">
                                                  <xsl:variable name="id"
                                                  select="//restoration/@categid"/>
                                                  <xsl:attribute name="xml:id">
                                                  <xsl:value-of
                                                  select="document('controlledList.xml')//tr[@xml:id = 'Restoration']/option[@value = $id]/@value"
                                                  />
                                                  </xsl:attribute>
                                                  <xsl:value-of
                                                  select="document('controlledList.xml')//tr[@xml:id = 'Restoration']/option[@value = $id]"/>

                                                </rs>
                                            </p>
                                        </custodialHist>

                                    </adminInfo>
                                    <listBibl>
                                        <bibl>
                                            <xsl:value-of select="//mslit"/>
                                        </bibl>
                                        <!--only one statement in example, might be having many and need string analysis-->
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
                                    <p>
                                        <xsl:value-of select="//donor"/>
                                    </p>
                                    <!--this is actually paragraphic information identification of donor might neeed to 
                                                    be part of postprocessing and content taken out of persName -->

                                </person>
                                <person>
                                    <xsl:comment>copyst</xsl:comment>
                                    <p/>
                                </person>
                                <person>
                                    <xsl:comment>other</xsl:comment>
                                    <p/>
                                </person>
                            </listPerson>
                        </particDesc>
                        <textClass>
                            <keywords>
                                <xsl:for-each select="//subject">
                                    <term>
                                        <xsl:variable name="id" select="./@categid"/>
                                        <xsl:attribute name="xml:id">
                                            <xsl:value-of
                                                select="document('controlledList.xml')//tr[@xml:id = 'subject']/option[@value = $id]/@value"
                                            />
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="document('controlledList.xml')//tr[@xml:id = 'subject']/option[@value = $id]"/>

                                    </term>
                                </xsl:for-each>
                            </keywords>
                        </textClass>
                        <langUsage>
                            <language ident="en">Inglese</language>
                            <language ident="it">Italiano</language>
                            <xsl:for-each select="//language">
                                <language>
                                    <xsl:variable name="id" select="./@categid"/>
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
                                </language>
                            </xsl:for-each>
                        </langUsage>
                    </profileDesc>
                   
                    <revisionDesc>
                        <xsl:for-each select="//regdate">
                            <change>
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
                                    <xsl:value-of select="."/>
                                </xsl:attribute>
                                <xsl:if test="@type='creator'"><xsl:attribute name="when">
                                    <xsl:value-of select="//servdate[@type='createdate']"/>
                                </xsl:attribute>
                                    <xsl:text>created</xsl:text>
                                </xsl:if>
                                <xsl:if test="@type='editor'"><xsl:attribute name="when">
                                    <xsl:value-of select="//servdate[@type='modifydate']"/>
                                </xsl:attribute>
                                    <xsl:text>last edited</xsl:text>
                                </xsl:if>
                            </change>
                        </xsl:for-each>
                        <change who="PietroLiuzzo" when="{current-dateTime()}">transformed from mycore to TEI P5</change>
                    </revisionDesc>
                </teiHeader>
                 <sourceDoc>
                        <surface>
                            <xsl:for-each select="tokenize(//pchangeofhand, '&#13;')">
                                <line><xsl:analyze-string select="." regex="(Hand\s(\w+):)">
                                    <xsl:matching-substring>
                                            <handShift>
                                            <xsl:attribute name="new"><xsl:value-of select="concat('#hand_',regex-group(2))"/></xsl:attribute>
                                            </handShift>
                                    </xsl:matching-substring>
                                </xsl:analyze-string>
                                    <xsl:value-of select="substring-after(.,': ')"/>
                                        </line>
                            </xsl:for-each>

                        </surface>
                    </sourceDoc>
                <text>
                    <body>
                        <ab/>
                    </body>
                </text>
            </TEI>

        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>
