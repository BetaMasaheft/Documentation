<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="#all" version="2.0">

    <xsl:output encoding="UTF-8" method="xml"/>
    <xsl:output indent="yes"/>

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="//processing-instruction()"/>

    <xsl:template match="/">
        <xsl:processing-instruction name="oxygen">
    <xsl:text>RNGSchema="enrich-betamesaheft.rnc" type="compact"</xsl:text>
</xsl:processing-instruction>

        <xsl:apply-templates/>
    </xsl:template>

<!--
    
    publicationStmt/date is added and contains date and time of upload. will constitute the first online publication date and be comparable to the last update stored in the change section
    -->


    <xsl:template match="t:publicationStmt">
        <xsl:copy>
            <xsl:copy-of select="t:authority"/>
            <xsl:copy-of select="t:pubPlace"/>
            <xsl:copy-of select="t:publisher"/>
            <xsl:copy-of select="t:availability"/>
            <date>
                <xsl:value-of select="current-dateTime()"/>
            </date>
        </xsl:copy>
    </xsl:template>


    <!--all uris to be expanded
        all references to be exapnded
        
        ref/@ref with url temporary base url https://www.betamasaheft.uni-hamburg.de/
-->
    <xsl:template
        match="@ref[parent::t:country | parent::t:region | parent::t:settlement | parent::t:repository | parent::t:title | parent::t:persName | parent::t:placeName]">
        <xsl:attribute name="ref">
            <xsl:value-of select="concat('https://www.betamasaheft.uni-hamburg.de/', .)"/>
        </xsl:attribute>
    </xsl:template>
    
    <xsl:template match="@corresp[parent::t:ref | parent::t:bibl[not(@type='external')] | parent::t:witness[not(@type='external')]]">
        <xsl:attribute name="corresp">
            <xsl:value-of select="concat('https://www.betamasaheft.uni-hamburg.de/', .)"/>
        </xsl:attribute>
    </xsl:template>
    
    <xsl:template match="@type[parent::t:witness]"/>

<!--all names in meaningful items to be expanded-->
    <xsl:template match="t:title">
        <xsl:copy>

            <xsl:apply-templates select="@*"/>
            
            <xsl:choose>
                <xsl:when
                    test="document(concat('../../Works/', @ref, '.xml'))/t:TEI//t:titleStmt">
                    <xsl:if test=".[not(text())]">
                        <xsl:value-of
                            select="document(concat('../../Works/', @ref, '.xml'))/t:TEI//t:titleStmt/t:title[1]"
                        />
                    </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="."/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="t:persName">
        <xsl:copy>
            
            <xsl:apply-templates select="@*"/>
            
            <xsl:choose>
                <xsl:when
                    test="document(concat('../../Persons/', @ref, '.xml'))/t:TEI//t:titleStmt">
                    <xsl:if test=".[not(text())]">
                        <xsl:value-of
                            select="document(concat('../../Persons/', @ref, '.xml'))/t:TEI//t:titleStmt/t:title[1]"
                        />
                    </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="."/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="t:placeName | t:repository">
        <xsl:copy>
            
            <xsl:apply-templates select="@*"/>
            
            <xsl:choose>
                <xsl:when
                    test="document(concat('../../Places/', @ref, '.xml'))/t:TEI//t:titleStmt">
                    <xsl:if test=".[not(text())]">
                        <xsl:value-of
                            select="document(concat('../../Places/', @ref, '.xml'))/t:TEI//t:titleStmt/t:title[1]"
                        />
                    </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="."/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template match="t:ref">
        <xsl:copy>
            
            <xsl:apply-templates select="@corresp"/>
            <xsl:apply-templates select="@type"/>
            <xsl:apply-templates select="@target"/>
            
            
            <!--    populate refs of all types with text -->
            
            <xsl:if test=".[not(text())]">
                
            <xsl:choose>
                <xsl:when test="@type='auth'">
                    <xsl:choose>
                <xsl:when
                    test="document(concat('../../Authority-Files/', @corresp, '.xml'))/t:TEI//t:titleStmt">
                        <xsl:value-of
                            select="document(concat('../../Authority-Files/', @corresp, '.xml'))/t:TEI//t:titleStmt/t:title[1]"
                        />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="."/> 
                    <!--this addes the reference identifier as text if the record does not yet exist-->
                </xsl:otherwise>
            </xsl:choose>
                </xsl:when>
                <xsl:when test="@type='title'">
                    <xsl:choose>
                        <xsl:when
                            test="document(concat('../../Works/', @corresp, '.xml'))/t:TEI//t:titleStmt">
                                <xsl:value-of
                                    select="document(concat('../../Works/', @corresp, '.xml'))/t:TEI//t:titleStmt/t:title[1]"
                                />
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="."/>
                            <!--this addes the reference identifier as text if the record does not yet exist-->
                            
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="@type='work'">
                    <xsl:choose>
                        <xsl:when
                            test="document(concat('../../Works/', @corresp, '.xml'))/t:TEI//t:titleStmt">
                            <xsl:value-of
                                select="document(concat('../../Works/', @corresp, '.xml'))/t:TEI//t:titleStmt/t:title[1]"
                            />
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="."/>
                            <!--this addes the reference identifier as text if the record does not yet exist-->
                            
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="@type='place'">
                    <xsl:choose>
                        <xsl:when
                            test="document(concat('../../Places/', @corresp, '.xml'))/t:TEI//t:titleStmt">
                            <xsl:value-of
                                select="document(concat('../../Places/', @corresp, '.xml'))/t:TEI//t:titleStmt/t:title[1]"
                            />
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="."/>
                            <!--this addes the reference identifier as text if the record does not yet exist-->
                            
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="@type='ins'">
                    <xsl:choose>
                        <xsl:when
                            test="document(concat('../../Institutions/', @corresp, '.xml'))/t:TEI//t:titleStmt">
                            <xsl:value-of
                                select="document(concat('../../Institutions/', @corresp, '.xml'))/t:TEI//t:titleStmt/t:title[1]"
                            />
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="."/>
                            <!--this addes the reference identifier as text if the record does not yet exist-->
                            
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="@type='pers'">
                    <xsl:choose>
                        <xsl:when
                            test="document(concat('../../Persons/', @corresp, '.xml'))/t:TEI//t:titleStmt">
                            <xsl:value-of
                                select="document(concat('../../Persons/', @corresp, '.xml'))/t:TEI//t:titleStmt/t:title[1]"
                            />
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="."/>
                            <!--this addes the reference identifier as text if the record does not yet exist-->
                            
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="@type='group'">
                    <xsl:choose>
                        <xsl:when
                            test="document(concat('../../Persons/', @corresp, '.xml'))/t:TEI//t:titleStmt">
                            <xsl:value-of
                                select="document(concat('../../Persons/', @corresp, '.xml'))/t:TEI//t:titleStmt/t:title[1]"
                            />
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="."/>
                            <!--this addes the reference identifier as text if the record does not yet exist-->
                            
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="@type='author'">
                    <xsl:choose>
                        <xsl:when
                            test="document(concat('../../Persons/', @corresp, '.xml'))/t:TEI//t:titleStmt">
                            <xsl:value-of
                                select="document(concat('../../Persons/', @corresp, '.xml'))/t:TEI//t:titleStmt/t:title[1]"
                            />
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="."/>
                            <!--this addes the reference identifier as text if the record does not yet exist-->
                            
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                
                <xsl:when test="@type='mss' or @type='hand'  or @type='mspart'  or @type='item'  or @type='quire'   or @type='binding'   or @type='deco' ">
                    <xsl:variable name="filename" select="if (contains(@corresp, '#')) then (substring-before(@corresp, '#')) else (@corresp)"/>
                    <xsl:variable name="id" select="if (contains(@corresp, '#')) then (substring-after(@corresp, '#')) else ('')"/>
                    
                    <xsl:choose>
                        <xsl:when
                            test="document(concat('../../Manuscripts/', $filename, '.xml'))/t:TEI//t:titleStmt">
                            <xsl:value-of
                                select="document(concat('../../Manuscripts/', $filename, '.xml'))/t:TEI//t:titleStmt/t:title[1]"
                            /><xsl:if test="$id != ''"><xsl:text>, </xsl:text><xsl:value-of select="$id"/></xsl:if>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="."/>
                            <!--this addes the reference identifier as text if the record does not yet exist-->
                            
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                
            </xsl:choose>
            </xsl:if>
        </xsl:copy>
    </xsl:template>
    
    
    
<!--    relations need to have uris in a ref rather than @name-->

    <xsl:template match="t:relation">
        <xsl:copy>
            <xsl:attribute name="name">
                <xsl:value-of select="@name"/>
            </xsl:attribute>
            <xsl:attribute name="ref">
                <xsl:choose>
                    <xsl:when test="contains(@name, 'saws:')">
                        <xsl:value-of
                            select="concat('http://purl.org/saws/ontology#', substring-after(@name, 'saws:'))"
                        />
                    </xsl:when>
                    <xsl:when test="contains(@name, 'snap:')">
                        <xsl:value-of
                            select="concat('http://data.snapdrgn.net/ontology/snap#', substring-after(@name, 'snap:'))"
                        />
                    </xsl:when>
                    <xsl:when test="contains(@name, 'gn:')">
                        <xsl:value-of
                            select="concat('http://www.geonames.org/ontology#', substring-after(@name, 'gn:'))"
                        />
                    </xsl:when>
                    <xsl:when test="contains(@name, 'dcterms:')">
                        <xsl:value-of
                            select="concat('http://purl.org/dc/terms/', substring-after(@name, 'dcterms:'))"
                        />
                    </xsl:when>
                </xsl:choose>
            </xsl:attribute>
            <xsl:apply-templates select="@*"/>
            
            <xsl:apply-templates/>
            <!--            need to be transformed into uris of the project-->
        </xsl:copy>
    </xsl:template>


    <xsl:template match="@active[parent::t:relation]"> 
        <xsl:attribute name="active">
            <xsl:value-of select="concat('https://www.betamasaheft.uni-hamburg.de/', .)"/>
        </xsl:attribute>
    </xsl:template>

    <xsl:template match="@passive[parent::t:relation]">
        <xsl:attribute name="passive">
            <xsl:value-of select="concat('https://www.betamasaheft.uni-hamburg.de/', .)"/>
        </xsl:attribute>
    </xsl:template>

    <xsl:template match="@mutual[parent::t:relation]">
        <xsl:attribute name="mutual">
            <xsl:for-each select="tokenize(., ' ')">
                <xsl:value-of select="concat('https://www.betamasaheft.uni-hamburg.de/', .)"/>
            </xsl:for-each>
        </xsl:attribute>
    </xsl:template>


    <xsl:template match="t:editor/@key">
        <xsl:choose>
            <xsl:when test=". = 'AB'">Prof. Alessandro Bausi</xsl:when>
            <xsl:when test=". = 'ES'">Eugenia Sokolinski</xsl:when>
            <xsl:when test=". = 'DN'">Dr. Denis Nosnitsin</xsl:when>
            <xsl:when test=". = 'MV'">Massimo Villa</xsl:when>
            <xsl:when test=". = 'SG'">Solomon Gebreye</xsl:when>
            <xsl:when test=". = 'DR'">Dorothea Reule</xsl:when>
            <xsl:when test=". = 'PL'">Dr. Pietro Maria Liuzzo</xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <!--bibliography should be pulled from Zotero in TEI BEFORE indexing, so the API call needs to happen between data entry and indexing in Exist. insert the TEI full record and then reapply style.-->
    
    
    <!--    populate bibl in listbibl type mss with idnos-->
    
    <!--    populate witness with idnos-->
    <xsl:template match="t:bibl[not(parent::t:listBibl[@type = 'relations'])][not(@type='external')] | t:witness[not(@type='external')]">

        <xsl:choose>

            <xsl:when test="@corresp">
                <xsl:copy>
                    <xsl:apply-templates select="@corresp"/>
                    <xsl:variable name="filename">
                        <xsl:choose>
                            <xsl:when test="contains(@corresp, '#')">
                                <xsl:value-of select="substring-before(@corresp, '#')"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="@corresp"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:variable name="file"
                        select="document(concat('../../Manuscripts/', $filename, '.xml'))"/>
                    <idno>
                        <xsl:value-of select="$file//t:msIdentifier/t:idno"/>
                    </idno>
                    <title>
                        <xsl:value-of select="$file//t:titleStmt/t:title"/>
                    </title>
                    <xsl:apply-templates/>
                </xsl:copy>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="t:ptr">
                    <!--                      take all from the zotero record, but not the xml id, 
                            as a record can be cited more than once and would invalidate the file-->
                    <xsl:variable name="zotero"
                        select="document(concat('https://api.zotero.org/groups/358366/items?tag=',t:ptr/@target, '&amp;format=tei'))//t:biblStruct"/>
                    <bibl corresp="{$zotero/@corresp}" type="{$zotero/@type}">
                        <xsl:copy-of select="$zotero//t:title"/>
                        <xsl:copy-of select="$zotero//t:author"/>
                        <xsl:copy-of select="$zotero//t:editor"/>
                        <xsl:copy-of select="$zotero//t:pubPlace"/>
                        <xsl:copy-of select="$zotero//t:publisher"/>
                        <xsl:copy-of select="$zotero//t:date"/>
                        <xsl:copy-of select="$zotero//t:series"/>
                        <xsl:copy-of select="$zotero//t:biblScope"/>
                        <xsl:copy-of select="$zotero//t:note"/>

                        <xsl:if test="t:citedRange">
                            <xsl:copy-of select="t:citedRange"/>
                        </xsl:if>
                    </bibl>
                </xsl:if>

            </xsl:otherwise>
        </xsl:choose>


    </xsl:template>


<!--parchment not @key also in element binding-->
    <xsl:template match="t:material | t:condition">
        <xsl:copy>
            <xsl:value-of select="@key"/>
        </xsl:copy>
    </xsl:template>
    
    <!--    custEvent in element, not in type-->
    <xsl:template match="t:custEvent">
        <xsl:copy>
            <xsl:value-of select="@type"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    
<!--    populate locus with text -->

    <xsl:template match="t:locus">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:choose>
            <xsl:when test="not(text())"><xsl:choose>
                <xsl:when test="@target">
                    <xsl:choose>
                        <xsl:when test="contains(@target,' ')">
                            <xsl:choose><xsl:when test="//t:extent/t:measure[@unit='page']">pp.</xsl:when><xsl:otherwise><xsl:text>ff. </xsl:text></xsl:otherwise></xsl:choose>
                            <xsl:for-each select="tokenize(@target,' ')">
                                    <xsl:value-of select="concat(substring-after(.,'#'), ' ')"/>
  
                            </xsl:for-each>
                        </xsl:when><xsl:otherwise>
                            <xsl:choose><xsl:when test="//t:extent/t:measure[@unit='page']">p.</xsl:when><xsl:otherwise><xsl:text>f. </xsl:text></xsl:otherwise></xsl:choose>
                            <xsl:value-of select="substring-after(@target,'#')"/>
                        </xsl:otherwise></xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:choose><xsl:when test="//t:extent/t:measure[@unit='page']">pp.</xsl:when><xsl:otherwise><xsl:text>ff. </xsl:text></xsl:otherwise></xsl:choose>
                        <xsl:value-of select="@from"/>
                    <xsl:text>-</xsl:text>
                        <xsl:value-of select="@to"/>
                </xsl:otherwise>
            </xsl:choose>
                <xsl:if test="@n">
                    <xsl:text>, l.</xsl:text>
                    <xsl:value-of select="@n"/>
                </xsl:if></xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="@target">
                            <xsl:value-of select="."/>
                    </xsl:when>
                    <xsl:otherwise>
                            <xsl:value-of select="."/>
                    </xsl:otherwise>
                </xsl:choose>
                
                
            </xsl:otherwise></xsl:choose>
        <xsl:text> </xsl:text>
        </xsl:copy>
    </xsl:template>
    

    
</xsl:stylesheet>
