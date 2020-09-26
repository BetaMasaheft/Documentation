<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:t="http://www.tei-c.org/ns/1.0" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    exclude-result-prefixes="#all" version="2.0">
   
   <xsl:output indent="yes"/>
   <xsl:param name="total">
<!--       total number of foliated leaves-->
   </xsl:param>
    
    <xsl:param name="emptyimagesbeginning">
<!--        number of protective sheets to be left out of foliation count-->
    </xsl:param>
   
    
    <!--    opening or singleSide    -->
    <xsl:param name="imagetype">opening</xsl:param>
    
    <xsl:template match="@* | text()">
        <xsl:copy>
            <xsl:apply-templates select="@* | text()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="t:TEI">
        <transkribus2BM>
            <xsl:apply-templates/>
        </transkribus2BM>
    </xsl:template>
    <xsl:template match="t:teiHeader"/>
    
    <xsl:template match="t:facsimile| t:surface | t:graphic  | t:zone">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
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
                <xsl:variable name="imagenumber" select="."/>
<!--                <xsl:message><xsl:value-of select="$imagenumber"/></xsl:message>-->
                <xsl:variable name="folio" 
                    select="$imagenumber - $emptyimagesbeginning"/>
<!--                <xsl:message><xsl:value-of select="$folio"/></xsl:message>-->
                <xsl:variable name="rectoPB" 
                    select="if($imagetype = 'opening') 
                                    then $this//t:pb[@n=$imagenumber] 
                                    else $this//t:pb[@n=(($imagenumber*2) -1)]"/>
<!--                 <xsl:message><xsl:copy-of select="$rectoPB"/></xsl:message>-->
                <xsl:variable name="rectoPBnext" 
                  select="$rectoPB/following-sibling::t:pb[1]"/>
<!--                <xsl:message><xsl:copy-of select="$rectoPBnext"/></xsl:message>-->
                <xsl:variable name="colRectoPB" 
                    select="$rectoPB/following-sibling::t:p[. &lt;&lt; $rectoPBnext]"/>
<!--                <xsl:message><xsl:copy-of select="$colRectoPB"/></xsl:message>-->
                <xsl:variable name="countcolsR" select="count($colRectoPB)"/>
                <xsl:variable name="versoPB" 
                    select="if($imagetype = 'opening') 
                                    then $this//t:pb[@n=($imagenumber +1)] 
                                    else $this//t:pb[@n=($imagenumber*2)]"/>
<!--                <xsl:message><xsl:copy-of select="$versoPB"/></xsl:message>-->
                <xsl:variable name="versoPBnext" 
                    select="$versoPB/following-sibling::t:pb[1]"/>
                <xsl:message><xsl:copy-of select="$versoPBnext"/></xsl:message>
                <xsl:variable name="colVersoPB" 
                    select="$versoPB/following-sibling::t:p[. &lt;&lt; $versoPBnext]"/>
                <xsl:message><xsl:copy-of select="$colVersoPB"/></xsl:message>
                <xsl:variable name="countcolsV" select="count($colVersoPB)"/>
               <xsl:if test="$folio ge 1"> <div xmlns="http://www.tei-c.org/ns/1.0" type="textpart" subtype="folio" n="{$folio}">
                    <xsl:comment>image n.<xsl:value-of select="$imagenumber"/>  folio n.<xsl:value-of select="$folio"/> </xsl:comment>
                    <ab>
                        <xsl:apply-templates select="$rectoPB">
                            <!-- this selects pb-->
                            <xsl:with-param name="folio" select="$folio"/>
                            <xsl:with-param name="side">r</xsl:with-param>
                        </xsl:apply-templates>
                        <xsl:for-each select="$colRectoPB[position() = (
                                                            ((if($countcolsR gt 2) then xs:integer(ceiling($countcolsR div 2))
                                                            else 1) + (if($folio=1) then 0 else 1)) 
                                                            to $countcolsR)]">
                            <!--<xsl:message>
                                facs <xsl:value-of select="@facs"/> ; 
                                position <xsl:value-of select="position()"/> . 
                            </xsl:message>-->
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
<!--        <xsl:message>got to pb</xsl:message>-->
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
        <xsl:message><xsl:value-of select="$col"></xsl:value-of><xsl:copy-of select="."></xsl:copy-of></xsl:message>
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
        </xsl:copy>
        
    </xsl:template>
    
</xsl:stylesheet>