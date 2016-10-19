<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:t="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:template match="t:text">
        <h2>Transcription</h2>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="t:body">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="t:div[parent::t:body][not(@type='apparatus')]">
        <div class="row-fluid" id="{@type}">
            <head>
                <xsl:if test="@corresp">
                    <a href="{@corresp}">
                        <xsl:value-of select="replace(substring-after(@corresp, '#'), '_', ' ')"/>
                        <xsl:if test="@subtype">
                            <xsl:text>, </xsl:text>
                            <xsl:value-of select="@subtype"/>
                            <xsl:if test="@n">
                                <xsl:text>: </xsl:text>
                                <xsl:value-of select="@n"/>
                            </xsl:if>
                        </xsl:if>
                    </a>
                </xsl:if>
            </head>
            <br/>
            <xsl:apply-templates/>
        </div>
        <br/>
    </xsl:template>
    <xsl:template match="t:div[@type='textpart']">
        <div class="{if(parent::t:div[@type='textpart']) then 'subtextpart' else ()}" id="{@xml:id}">
            <xsl:if test="@subtype">
                <a href="{if (@corresp) then @corresp else '#mscontent'}">
                    <xsl:value-of select="@subtype"/>
                    <xsl:if test="@n">
                        <xsl:text>: </xsl:text>
                        <xsl:value-of select="@n"/>
                    </xsl:if>
                </a>
            </xsl:if>
            <xsl:if test="@corresp">
                <xsl:choose>
                        <xsl:when test="starts-with(@corresp, '#')">
                            <xsl:text> </xsl:text><a href="{@corresp}"><xsl:value-of select="substring-after(@corresp, '#')"/></a>
                        </xsl:when>
                        <xsl:otherwise>
                            <span class="label label-default">
                    
                            <xsl:variable name="titles" select="doc(concat('../Works/',@corresp, '.xml'))//t:TEI//t:titleStmt//t:title[not(@type = 'alt')]"/>
                        <xsl:apply-templates select="if($titles/@corresp) then $titles[@corresp='#t1' and @type='normalized'] else if($titles/@xml:id) then $titles[@xml:id='t1'] else $titles[1]"/>
                </span>
                <a href="{@corresp}">
                    <xsl:text>  </xsl:text>
                    <span class="glyphicon glyphicon-share"/>
                </a>
                        </xsl:otherwise></xsl:choose>
            </xsl:if>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="t:label">
        <span class="label label-default">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="t:ab">
        <div class="container-fluid">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="t:l">
        <sup>
            <xsl:value-of select="@n"/>
        </sup>
        <xsl:value-of select="."/>
        <xsl:apply-templates/>
    </xsl:template>
    
    
    <!--lb-->
    <xsl:template match="t:lb[parent::t:ab]">
        <xsl:text> | </xsl:text>
    </xsl:template>
    <xsl:template match="t:lb[not(parent::t:ab)]">
        <xsl:variable name="line">
            <xsl:if test="@n">
                <xsl:value-of select="@n"/>
            </xsl:if>
        </xsl:variable>
        <br/> <!--hard coded carriage return would not be recognized-->
        <xsl:choose>
            <xsl:when test="number(@n) and @n mod number(5) = 0 and not(@n = 0)">
                <xsl:call-template name="margin-num"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="line-numbering-tab"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="margin-num">
        <xsl:value-of select="@n"/>
        <!-- template »line-numbering-tab« found in txt-tpl-linenumberingtab.xsl respectively odf-tpl-linenumberingtab.xsl -->
        <xsl:call-template name="line-numbering-tab"/>
    </xsl:template>
    
    <!-- $Id: txt-tpl-linenumberingtab.xsl 1543 2011-08-31 15:47:37Z ryanfb $ -->
    <xsl:template name="line-numbering-tab">
        <!--<xsl:text>		</xsl:text>-->
        <span style="padding-left: 5em;"/> <!--double tab would look much better but would not be recognized in browser-->
    </xsl:template>
    <xsl:template match="t:pb">
        <hr id="{@n}"/>
        <p>
            <xsl:value-of select="@n"/>
        </p>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="t:cb">
        <xsl:text>|</xsl:text>
        <sup id="{preceding-sibling::t:pb[1]/@n}{@n}">
            <xsl:value-of select="@n"/>
        </sup>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="t:handShift">
        <sub>
            <a href="{@new}">
                <xsl:value-of select="substring-after(@new, '#')"/>
            </a>
        </sub>
    </xsl:template>
    <xsl:template match="t:gap[@reason='illegible']">
        <xsl:variable name="quantity" select="@quantity"/>
        <xsl:for-each select="1 to $quantity">
            <xsl:text>+</xsl:text>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="t:subst">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="t:unclear">
        <xsl:value-of select="."/>
        <xsl:text>?</xsl:text>
    </xsl:template>
    <xsl:template match="t:orig">
        <span class="undeciphrable">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>
    <xsl:template match="t:add">
        <xsl:variable name="id" select="generate-id()"/>
        <xsl:choose>
            <!--            has hand and place-->
            <xsl:when test="@hand and @place">
                <a href="#{$id}" data-toggle="popover" title="Added Text Position" data-content="Note added {                     if(@hand)                      then concat('by ',substring-after(@hand, '#')) else ''}                      at {upper-case(@place)} according to TEI definitions">
                    <xsl:apply-templates/>
                </a>
            </xsl:when>
            <!--            has place overstrike-->
            <xsl:when test="@place='overstrike' and preceding-sibling::t:del">
                <xsl:text>{</xsl:text>
                <xsl:apply-templates/>
                <xsl:text>}</xsl:text>
            </xsl:when>
            
            <!--            has only hand-->
            <xsl:when test="@hand and not(@place)">
                <xsl:text>/</xsl:text>
                <a href="#{$id}" data-toggle="popover" title="Correction author" data-content="Note added { concat('by ',substring-after(@hand, '#')) }">
                    <xsl:apply-templates/>
                </a>
                <xsl:text>/</xsl:text>
            </xsl:when>
            
            <!-- it has only place-->
            <xsl:otherwise>
                <a href="#{$id}" data-toggle="popover" title="Added Text Position" data-content="Note added                      at {upper-case(@place)} according to TEI definitions">
                    <xsl:apply-templates/>
                </a>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="t:gap[@reason='omitted']">
        <xsl:variable name="author" select="doc(concat('../Persons/', @resp, '.xml'))//t:TEI//t:persName[1]"/>
        <a href="#" data-toggle="tooltip" title="Omission by {$author}">. . . . .</a>
    </xsl:template>
    <xsl:template match="t:choice[t:sic and t:corr]">
        <xsl:variable name="sic" select="t:sic"/>
        <xsl:variable name="resp">
            <xsl:choose>
                <xsl:when test="starts-with(t:corr/@resp,'PRS')">
                    <xsl:value-of select="doc(concat('../Persons/', @resp, '.xml'))//t:TEI//t:persName[1]"/>
                </xsl:when>
                <xsl:when test="t:corr/@resp = 'AB'">Prof. Alessandro Bausi</xsl:when>
                <xsl:when test="t:corr/@resp = 'ES'">Eugenia Sokolinski</xsl:when>
                <xsl:when test="t:corr/@resp = 'DN'">Dr. Denis Nosnitsin</xsl:when>
                <xsl:when test="t:corr/@resp = 'MV'">Massimo Villa</xsl:when>
                <xsl:when test="t:corr/@resp = 'DR'">Dorothea Reule</xsl:when>
                <xsl:when test="t:corr/@resp = 'SG'">Solomon Gebreyes</xsl:when>
                <xsl:when test="t:corr/@resp = 'PL'">Dr. Pietro Maria Liuzzo</xsl:when>
                <xsl:when test="t:corr/@resp = 'SA'">Dr Stéphane Ancel</xsl:when>
                <xsl:when test="t:corr/@resp = 'SD'">Sophia Dege</xsl:when>
                <xsl:when test="t:corr/@resp = 'VP'">Dr Vitagrazia Pisani</xsl:when>
                <xsl:when test="t:corr/@resp = 'IF'">Iosif Fridman</xsl:when>
                <xsl:when test="t:corr/@resp = 'SH'">Susanne Hummel</xsl:when>
                <xsl:when test="t:corr/@resp = 'FP'">Francesca Panini</xsl:when>
            </xsl:choose>
        </xsl:variable>
        <a href="#" data-toggle="tooltip" title="Corrected {if ($resp) then concat('by ', $resp) else ()} from {$sic}">
            <xsl:value-of select="t:corr"/>
        </a>
    </xsl:template>
    <xsl:template match="t:sic">
        <xsl:variable name="resp">
            <xsl:choose>
                <xsl:when test="starts-with(@resp,'PRS')">
                    <xsl:value-of select="document(concat('../Persons/', @resp, '.xml'))//t:TEI//t:persName[1]"/>
                </xsl:when>
                <xsl:when test="@resp = 'AB'">Prof. Alessandro Bausi</xsl:when>
                <xsl:when test="@resp = 'ES'">Eugenia Sokolinski</xsl:when>
                <xsl:when test="@resp = 'DN'">Dr. Denis Nosnitsin</xsl:when>
                <xsl:when test="@resp = 'MV'">Massimo Villa</xsl:when>
                <xsl:when test="@resp = 'DR'">Dorothea Reule</xsl:when>
                <xsl:when test="@resp = 'SG'">Solomon Gebreyes</xsl:when>
                <xsl:when test="@resp = 'PL'">Dr. Pietro Maria Liuzzo</xsl:when>
                <xsl:when test="@resp = 'SA'">Dr Stéphane Ancel</xsl:when>
                <xsl:when test="@resp = 'SD'">Sophia Dege</xsl:when>
                <xsl:when test="@resp = 'VP'">Dr Vitagrazia Pisani</xsl:when>
                <xsl:when test="@resp = 'IF'">Iosif Fridman</xsl:when>
                <xsl:when test="@resp = 'SH'">Susanne Hummel</xsl:when>
                <xsl:when test="@resp = 'FP'">Francesca Panini</xsl:when>
            </xsl:choose>
        </xsl:variable>
        <a href="#" data-toggle="tooltip" title="Marked as incorrect {if ($resp) then concat('by ', $resp) else ()}">
            <xsl:value-of select="."/>
            <xsl:text> (sic)</xsl:text>
        </a>
    </xsl:template>
    <xsl:template match="t:supplied">
        <xsl:choose>
            <xsl:when test="@reason = 'lost'">
                <xsl:text>[</xsl:text>
                <xsl:apply-templates/>
                <xsl:text>]</xsl:text>
            </xsl:when>
            <xsl:when test="@reason = 'omitted'">
                <xsl:text>&lt;</xsl:text>
                <xsl:apply-templates/>
                <xsl:text>&gt;</xsl:text>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="t:div[@type='apparatus']">
       <div class="row-fluid" id="apparatus"> 
           <hr/>
           
        <xsl:for-each select="t:app">
            <xsl:sort select="position()"/>
            <a href="{@from}"><xsl:value-of select="concat(substring-after(@from, '#'), ', ', @loc, ' ')"/></a>
            <xsl:apply-templates/><xsl:if test="not(position() = last())"><xsl:text> | </xsl:text></xsl:if>
        </xsl:for-each></div>
    </xsl:template>
    
    <xsl:template match="t:lem">
        <xsl:variable name="resp">
            <xsl:choose>
                <xsl:when test="starts-with(@resp,'PRS')">
                    <xsl:value-of select="doc(concat('../Persons/', @resp, '.xml'))//t:TEI//t:persName[1]"/>
                </xsl:when>
                <xsl:when test="t:corr/@resp = 'AB'">Prof. Alessandro Bausi</xsl:when>
                <xsl:when test="t:corr/@resp = 'ES'">Eugenia Sokolinski</xsl:when>
                <xsl:when test="t:corr/@resp = 'DN'">Dr. Denis Nosnitsin</xsl:when>
                <xsl:when test="t:corr/@resp = 'MV'">Massimo Villa</xsl:when>
                <xsl:when test="t:corr/@resp = 'DR'">Dorothea Reule</xsl:when>
                <xsl:when test="t:corr/@resp = 'SG'">Solomon Gebreyes</xsl:when>
                <xsl:when test="t:corr/@resp = 'PL'">Dr. Pietro Maria Liuzzo</xsl:when>
                <xsl:when test="t:corr/@resp = 'SA'">Dr Stéphane Ancel</xsl:when>
                <xsl:when test="t:corr/@resp = 'SD'">Sophia Dege</xsl:when>
                <xsl:when test="t:corr/@resp = 'VP'">Dr Vitagrazia Pisani</xsl:when>
                <xsl:when test="t:corr/@resp = 'IF'">Iosif Fridman</xsl:when>
                <xsl:when test="t:corr/@resp = 'SH'">Susanne Hummel</xsl:when>
                <xsl:when test="t:corr/@resp = 'FP'">Francesca Panini</xsl:when>
            </xsl:choose>
        </xsl:variable>
        <a href="#" data-toggle="tooltip" title="Reading of {@wit} by {$resp}">
        <xsl:apply-templates/>
        </a><xsl:text>: </xsl:text>
    </xsl:template>
    <xsl:template match="t:rdg">
        <xsl:variable name="resp">
            <xsl:choose>
                <xsl:when test="starts-with(@resp,'PRS')">
                    <xsl:value-of select="doc(concat('../Persons/', @resp, '.xml'))//t:TEI//t:persName[1]"/>
                </xsl:when>
                <xsl:when test="t:corr/@resp = 'AB'">Prof. Alessandro Bausi</xsl:when>
                <xsl:when test="t:corr/@resp = 'ES'">Eugenia Sokolinski</xsl:when>
                <xsl:when test="t:corr/@resp = 'DN'">Dr. Denis Nosnitsin</xsl:when>
                <xsl:when test="t:corr/@resp = 'MV'">Massimo Villa</xsl:when>
                <xsl:when test="t:corr/@resp = 'DR'">Dorothea Reule</xsl:when>
                <xsl:when test="t:corr/@resp = 'SG'">Solomon Gebreyes</xsl:when>
                <xsl:when test="t:corr/@resp = 'PL'">Dr. Pietro Maria Liuzzo</xsl:when>
                <xsl:when test="t:corr/@resp = 'SA'">Dr Stéphane Ancel</xsl:when>
                <xsl:when test="t:corr/@resp = 'SD'">Sophia Dege</xsl:when>
                <xsl:when test="t:corr/@resp = 'VP'">Dr Vitagrazia Pisani</xsl:when>
                <xsl:when test="t:corr/@resp = 'IF'">Iosif Fridman</xsl:when>
                <xsl:when test="t:corr/@resp = 'SH'">Susanne Hummel</xsl:when>
                <xsl:when test="t:corr/@resp = 'FP'">Francesca Panini</xsl:when>
            </xsl:choose>
        </xsl:variable>
        <b><xsl:choose><xsl:when test="@wit"><a href="{@wit}" data-toggle="tooltip" title="Reading by {$resp}"><xsl:value-of select="@wit"/></a></xsl:when></xsl:choose></b><xsl:if test="@xml:lang"><xsl:text> Cfr. </xsl:text><xsl:value-of select="@xml:lang"/></xsl:if><xsl:text>, </xsl:text><xsl:text> </xsl:text><xsl:apply-templates/>
    </xsl:template>
    
</xsl:stylesheet>