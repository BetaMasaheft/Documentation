<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml"  
    exclude-result-prefixes="#all"
    version="2.0">
    <xsl:template match="t:collation">
        
        <xsl:variable
            name="mspartID">
            <xsl:if test="./ancestor::t:msPart"><xsl:value-of
                select="./ancestor::t:msPart/@xml:id"/></xsl:if></xsl:variable>
        
        <h3>Collation <xsl:if test="./ancestor::t:msPart"><xsl:variable
            name="currentMsPart">
            <a href="{./ancestor::t:msPart/@xml:id}"><xsl:value-of
                select="./ancestor::t:msPart/@xml:id"/></a></xsl:variable> of
            <xsl:value-of select="$currentMsPart"/></xsl:if></h3>
        
        <xsl:if test=".//t:signatures">
            <p>
                <xsl:apply-templates select=".//t:signatures"/>
            </p>
        </xsl:if>
        
        
     <div class="container allCollation">   
         <button type="button" class="btn btn-info" data-toggle="collapse"
             data-target="#collation{$mspartID}">Quires Table</button>
        <div class="collation collapse" id="collation{$mspartID}">
            
            <table>
                <tr style="background-color: lightgray;">
                    <td class="headcol">position</td>
                    <xsl:for-each select=".//t:item">
                        <xsl:sort select="position()"/>
                        <td>
                            <xsl:attribute name="id">
                                <xsl:value-of select="@xml:id"/>
                            </xsl:attribute>
                            <xsl:value-of select="position()"/>
                        </td>
                    </xsl:for-each>
                </tr>
                <tr>
                    <td class="headcol">number</td>
                    <xsl:for-each select=".//t:item">
                        <xsl:sort select="position()"/>
                        <td>
                            <xsl:apply-templates select="@n"/>
                        </td>
                    </xsl:for-each>
                </tr>
                <tr style="background-color: lightgray;">
                    <td class="headcol">leafs</td>
                    <xsl:for-each select=".//t:item">
                        <xsl:sort select="position()"/>
                        <td>
                            <xsl:apply-templates select="t:dim[@unit = 'leaf']"/>
                        </td>
                    </xsl:for-each>
                </tr>
                <tr>
                    <td class="headcol">quires</td>
                    <xsl:for-each select=".//t:item">
                        <xsl:sort select="position()"/>
                        <td>
                            <xsl:apply-templates select="t:locus"/>
                        </td>
                    </xsl:for-each>
                </tr>
                <tr>
                    <td class="headcol">description</td>
                    <xsl:for-each select=".//t:item">
                        <xsl:sort select="position()"/>
                        <td>
                            <xsl:value-of select="text()"/>
                        </td>
                    </xsl:for-each>
                </tr>
                
            </table>
        </div>
        
<!--        visualization  -->
      
        <xsl:variable name="dotporter">
            <xsl:call-template name="DotPorterIfy">
            <xsl:with-param name="porterified" tunnel="yes" select="."/>
        </xsl:call-template>
        </xsl:variable>
        
        
        <!--        formula-->
         
         <button type="button" class="btn btn-info" data-toggle="collapse"
             data-target="#collationFormula{$mspartID}">Collation Formula </button>
         <div id="collationFormula{$mspartID}" class="collapse">  <p>Formula: 
        <xsl:for-each select=".//t:item">
            <xsl:sort select="position()"/>
           <xsl:apply-templates select="t:locus"/> <xsl:value-of select="text()"/><xsl:text>; </xsl:text>
        </xsl:for-each>
        </p>
        <p>Formula 1: 
            <xsl:for-each select="$dotporter//t:quire">
                <!-- to be in the format 1(8, -4, +3) -->
                <xsl:variable name="quire-no" select="@n"/>
                <xsl:variable name="no-leaves" select="child::t:leaf[last()]/@n"/>
                <xsl:value-of select="$quire-no"/> (<xsl:value-of select="$no-leaves"
                /><xsl:for-each select="child::t:leaf[@mode='missing']">, -<xsl:value-of
                    select="@n"/></xsl:for-each><xsl:for-each select="child::t:leaf[@mode='added']">, +<xsl:value-of
                        select="@n"/></xsl:for-each><xsl:for-each select="child::t:leaf[@mode='replaced']">, leaf in position <xsl:value-of
                            select="@n"/> has been replaced</xsl:for-each>),<xsl:text> </xsl:text>
            </xsl:for-each>
        </p>
        <p>Formula 2: 
            <xsl:for-each select="$dotporter//t:quire">
                <!-- to be in the format 1(8, leaf missing between fol. X and fol. Y, leaf added after fol. X) -->
                <xsl:variable name="quire-no" select="@n"/>
                <xsl:variable name="no-leaves" select="child::t:leaf[last()]/@n"/>
                <xsl:value-of select="$quire-no"/> (<xsl:value-of select="$no-leaves"
                />
                <xsl:for-each select="child::t:leaf[@mode='missing']"><xsl:choose>
                    <xsl:when test="preceding-sibling::t:leaf">, leaf missing after fol. <xsl:value-of
                        select="preceding-sibling::t:leaf[1]/@folio_number"/></xsl:when><xsl:otherwise>, first leaf is missing</xsl:otherwise></xsl:choose>
                </xsl:for-each>
                <xsl:for-each select="child::t:leaf[@mode='added']"><xsl:choose>
                    <xsl:when test="preceding-sibling::t:leaf">, leaf added after fol. <xsl:value-of
                        select="preceding-sibling::t:leaf[1]/@folio_number"/></xsl:when><xsl:otherwise>, first leaf is added</xsl:otherwise></xsl:choose>
                </xsl:for-each>
                <xsl:for-each select="child::t:leaf[@mode='replaced']"><xsl:choose><xsl:when test="preceding-sibling::t:leaf">, leaf replaced after fol. <xsl:value-of
                    select="preceding-sibling::t:leaf[1]/@folio_number"/></xsl:when><xsl:otherwise>, first leaf is replaced</xsl:otherwise></xsl:choose>
                </xsl:for-each>),<xsl:text> </xsl:text>
            </xsl:for-each>
            
        </p></div>
        
        <xsl:variable name="step1">
            <xsl:for-each select="$dotporter">
                <xsl:call-template name="step1">
                <xsl:with-param name="step1ed"  tunnel="yes" select="."/>
            </xsl:call-template></xsl:for-each>
        </xsl:variable>
        
        <xsl:variable name="step2">
            <xsl:for-each select="$step1">
                <xsl:call-template name="step2">
                <xsl:with-param name="step2ed"  tunnel="yes" select="."/>
            </xsl:call-template></xsl:for-each>
        </xsl:variable>
        
        <xsl:variable name="step3">
            <xsl:for-each select="$step2">
                <xsl:call-template name="step3">
                    <xsl:with-param name="step3ed"  tunnel="yes" select="."/>
                </xsl:call-template></xsl:for-each>
        </xsl:variable>
        
        <xsl:for-each select="$step3">
            <xsl:call-template name="visColl">
                <xsl:with-param name="Finalvisualization" tunnel="yes" select="."/>
            </xsl:call-template>
        </xsl:for-each></div>
    </xsl:template>
    
    <xsl:include href="VisColl/collationPorterModel.xsl"/>
    <xsl:include href="VisColl/begin.xsl"/>
    <xsl:include href="VisColl/process5.xsl"/>
    <xsl:include href="VisColl/process6-tei_facs.xsl"/>
    <xsl:include href="VisColl/process7-diagrams.xsl"/>
</xsl:stylesheet>