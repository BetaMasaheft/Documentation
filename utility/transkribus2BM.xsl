<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:t="http://www.tei-c.org/ns/1.0" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    exclude-result-prefixes="#all" version="2.0">
   
   <xsl:output indent="yes"/>
   <xsl:param name="total">
<!--       total number of foliated leaves-->
   </xsl:param>
    
    <!--        number of protective sheets to be left out of foliation count-->
    <xsl:param name="emptyimagesbeginning">0</xsl:param>
    
    <!--    opening or singleSide    -->
    <xsl:param name="imagetype">opening</xsl:param>
    
    <xsl:template match="@*">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
        </xsl:copy>
    </xsl:template>
    
<!--    the input is the result of exporting TEI from Transkribus, output are two documents, one with a copy of the facsimile, the other the text with pointer to the facimile elements, reorganized-->
    <xsl:template match="t:TEI">
        <xsl:result-document method="xml" href="facsimile.xml">
            <facsimile xmlns="http://www.tei-c.org/ns/1.0" xml:id="transkribus{replace(.//t:title[@type='main'], '[\s\.\)\(\-]', '')}">
                <xsl:apply-templates select="//t:surface"/>
            </facsimile>
        </xsl:result-document> 
        <xsl:result-document method="xml" href="transkribusText.xml">
                  <xsl:apply-templates select="t:text"/>
        </xsl:result-document>
    </xsl:template>
    <xsl:template match="t:teiHeader"/>
    
    <xsl:template match="t:graphic  | t:zone">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="t:surface">
        <xsl:copy>
            <xsl:attribute name="xml:id"><xsl:value-of select="parent::t:facsimile/@xml:id"/></xsl:attribute>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="t:text">
        <text 
            xmlns="http://www.tei-c.org/ns/1.0" 
            xml:base="https://betamasaheft.eu/">
      <xsl:apply-templates select="t:body"/>
        </text>
    </xsl:template>
    
    <xsl:template match="t:body">
    <xsl:variable name="this" select="."/>
    <xsl:variable name="totalfolia">
        <xsl:choose>
            <xsl:when test="$imagetype = 'opening'"><xsl:value-of select="$total"/></xsl:when>
            <xsl:otherwise><xsl:value-of select="$total div 2"/></xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:copy>
        <div xmlns="http://www.tei-c.org/ns/1.0" 
            type="edition" xml:id="Transkribus" subtype="transkribus">
            <xsl:for-each select="1 to xs:integer(ceiling($totalfolia))">
<!--                stores the image number as a value in a sequence from 1 to the total-->
                <xsl:variable name="imagenumber" select="."/>
                <xsl:message>image number <xsl:value-of select="$imagenumber"/></xsl:message>
<!--                removing from the total folia the empty protective leaves we have the current folio-->
                <xsl:variable name="folio" 
                    select="$imagenumber - $emptyimagesbeginning"/>
                <xsl:message>folio <xsl:value-of select="$folio"/></xsl:message>
<!--                select the pb relevant for the current folio. if it is an image of an opening takes page breaks with 
                    @n equal to the image number, otherwise multiplies by 2 and removes one to get only the recto-->
                <xsl:variable name="rectoPB" 
                    select="if($imagetype = 'opening') 
                                    then $this//t:pb[@n=$imagenumber] 
                                    else $this//t:pb[@n=(($imagenumber*2) -1)]"/>
                 <xsl:message> recto pb <xsl:value-of select="$rectoPB/@facs"/></xsl:message>
                <xsl:variable name="rectoPBnext" 
                  select="$rectoPB/following-sibling::t:pb[1]"/>
                <xsl:message>next of recto pb<xsl:value-of select="$rectoPBnext/@facs"/></xsl:message>
                <xsl:variable name="colRectoPB" 
                    select="$rectoPB/following-sibling::t:p[. &lt;&lt; $rectoPBnext]"/>
                <xsl:message> col recto pb <xsl:value-of select="$colRectoPB/@facs"/></xsl:message>
                <xsl:variable name="countcolsR" select="count($colRectoPB)"/>
                <xsl:variable name="versoPB" 
                    select="if($imagetype = 'opening') 
                                    then $this//t:pb[@n=($imagenumber +1)] 
                                    else $this//t:pb[@n=($imagenumber*2)]"/>
                <xsl:message>verso pb <xsl:value-of select="$versoPB/@facs"/></xsl:message>
                <xsl:variable name="versoPBnext" 
                    select="$versoPB/following-sibling::t:pb[1]"/>
                <xsl:message>next of verso pb <xsl:value-of select="$versoPBnext/@facs"/></xsl:message>
                <xsl:variable name="colVersoPB" 
                    select="$versoPB/following-sibling::t:p[. &lt;&lt; $versoPBnext]"/>
                <xsl:message>col verso pb <xsl:value-of select="$colVersoPB/@facs"/></xsl:message>
                <xsl:variable name="countcolsV" select="count($colVersoPB)"/>
<!--                for each folio makes a div-->
               <xsl:if test="$folio ge 1"> <div xmlns="http://www.tei-c.org/ns/1.0" type="textpart" subtype="folio" n="{$folio}">
<!--                   adds a comment with the image number and the current folio-->
                    <xsl:comment>image n.<xsl:value-of select="$imagenumber"/>  folio n.<xsl:value-of select="$folio"/> </xsl:comment>
<!--                   make an ab to hold pb, cb, lb s-->
                    <ab>
<!--                        apply templates to the pb for the recto (produces only a pb element copying the correct one selected)-->
                        <xsl:apply-templates select="$rectoPB">
                            <!-- this selects pb-->
                            <xsl:with-param name="folio" select="$folio"/>
                            <xsl:with-param name="side">r</xsl:with-param>
                        </xsl:apply-templates>
<!--                        select which columns to take. given the total of possible columns for the recto, we need the second half of them, 
                            ASSUMING THEY ARE EVEN, i.e. the same number of columns occurrs on each side.-->
                        <xsl:message>count cols R = <xsl:value-of select="$countcolsR"/></xsl:message>
<!--                        start from 2 if there are 2 (will take 2), 
                               from 3 if there are 4 (will take columns at position 3 and 4), 
                               from 4 if there are 6 (will take columns at position 4, 5 and 6), 
                        etc. to do this count, make a ceiling and add 1 -->
                        <xsl:variable name="from" select="(
                            if($countcolsR = 2) then 1 else
                            if($countcolsR gt 2) then xs:integer(ceiling($countcolsR div 2))
                            else 1) + ( if($countcolsR = 2) then 0 else if($folio=1) then 0 else 1)"/>
                        
                        <xsl:message>from : <xsl:value-of select="$from"/></xsl:message>
                        <xsl:for-each select="$colRectoPB[position() = ($from to $countcolsR)]">
                            <xsl:message>
                                facs <xsl:value-of select="@facs"/> ; 
                                position <xsl:value-of select="position()"/> . 
                            </xsl:message>
                            <xsl:apply-templates select=".">
                            <!-- this selects p-->
                            <xsl:with-param name="col">
                                <xsl:choose>
                                    <xsl:when test="position()=1">a</xsl:when>
                                    <xsl:when test="position()=2">b</xsl:when>
                                    <xsl:when test="position()=3">c</xsl:when>
                                    <xsl:when test="position()=4">d</xsl:when>
                                    <xsl:when test="position()=5">e</xsl:when>
                                </xsl:choose>
                            </xsl:with-param>
                        </xsl:apply-templates>
                        </xsl:for-each>
                        <xsl:apply-templates select="$versoPB">
                            <!-- this selects pb-->
                            <xsl:with-param name="folio" select="$folio"/>
                            <xsl:with-param name="side">v</xsl:with-param>
                        </xsl:apply-templates>
                        <xsl:for-each select="$colVersoPB[position() = (1 to xs:integer(ceiling($countcolsV div 2)))]">
                            <xsl:apply-templates select=".">    
                                <!-- this selects p-->
                                <xsl:with-param name="col">
                                    <xsl:choose>
                                        <xsl:when test="position()=1">a</xsl:when>
                                        <xsl:when test="position()=2">b</xsl:when>
                                        <xsl:when test="position()=3">c</xsl:when>
                                        <xsl:when test="position()=4">d</xsl:when>
                                        <xsl:when test="position()=5">e</xsl:when>
                                    </xsl:choose>
                                </xsl:with-param>
                            </xsl:apply-templates>
                        </xsl:for-each>
                    </ab>
                </div>
               </xsl:if> </xsl:for-each>
        </div>
    </xsl:copy>
</xsl:template>
    
    <xsl:template match="t:pb">
       <xsl:param name="folio"/>
        <xsl:param name="side"/>
        <xsl:message>adding pb <xsl:value-of select="$folio"/><xsl:value-of select="$side"/></xsl:message>
        <xsl:copy>
            <xsl:copy-of select="@facs"/>
<!--     copying this generates double xml:ids when dealing with openings! 
                <xsl:copy-of select="@xml:id"/>-->
            <xsl:attribute name="n">
                <xsl:value-of select="concat($folio, $side)"/>
            </xsl:attribute>
        </xsl:copy>
   </xsl:template>
    
    <xsl:template match="t:p">
        <xsl:param name="col"/>
        <xsl:message>adding col <xsl:value-of select="$col"/><xsl:value-of select="./@facs"></xsl:value-of></xsl:message>
        <cb xmlns="http://www.tei-c.org/ns/1.0">
            <xsl:copy-of select="@facs"/>
            <xsl:attribute name="n">
                <xsl:value-of select="$col"/>
            </xsl:attribute>
        </cb>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="t:lb">
        <xsl:copy>
            <xsl:copy-of select="@facs"/>
            <xsl:attribute name="n" 
                select="format-number(xs:integer(substring-after(@n, 'N')), '###')"/>
            <xsl:if test="not(matches(preceding-sibling::text()[1], '[፡።፨፤]\s*$'))"><xsl:attribute name="break">no</xsl:attribute></xsl:if>
        </xsl:copy>
        
    </xsl:template>
    
    <xsl:template match="text()">
        <xsl:choose> 
         <xsl:when test="matches(., '[፡።፨፤]\s*$')">
            <xsl:value-of select="."/>
        </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="replace(., '\s+$', '')"></xsl:value-of>
        </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>