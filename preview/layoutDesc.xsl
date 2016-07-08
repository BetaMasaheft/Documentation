<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml"  
    exclude-result-prefixes="#all"
    version="2.0">
    <xsl:template match="t:layoutDesc">
        <h3>Layout <xsl:if test="./ancestor::t:msPart"><xsl:variable
            name="currentMsPart">
            <a href="{./ancestor::t:msPart/@xml:id}"><xsl:value-of
                select="./ancestor::t:msPart/@xml:id"/></a></xsl:variable> of
            <xsl:value-of select="$currentMsPart"/></xsl:if></h3>
        <xsl:for-each select=".//t:layout">
            <xsl:sort select="position()"/>
            <h4>
                <xsl:value-of select="position()"/>
            </h4>
            
            <xsl:apply-templates select="t:locus"/>
            <p>Number of columns : <xsl:value-of select="@columns"/></p>
            
            <p>Number of lines : <xsl:value-of select="@writtenLines"/></p>
            
            <xsl:if test="t:dimensions"><table>
                <tr>
                    <td>H</td>
                    <td>
                        <xsl:value-of select="t:dimensions/t:height"/>
                    </td>
                </tr>
                <tr>
                    <td>W</td>
                    <td>
                        <xsl:value-of select="t:dimensions/t:width"/>
                    </td>
                </tr>
                <tr>
                    <td>Intercolumn</td>
                    <td>
                        <xsl:value-of
                            select="t:dimensions[not(@type = 'margin')]/t:dim[@type = 'intercolumn']"
                        />
                    </td>
                </tr>
                <tr>
                    <td>Margins</td>
                    <td>Top: <xsl:value-of
                        select="t:dimensions[@type = 'margin']/t:dim[@type = 'top']"/></td>
                </tr>
                <tr>
                    <td/>
                    <td>Bottom: <xsl:value-of
                        select="t:dimensions[@type = 'margin']/t:dim[@type = 'bottom']"/></td>
                </tr>
                <tr>
                    <td/>
                    <td>Right: <xsl:value-of
                        select="t:dimensions[@type = 'margin']/t:dim[@type = 'right']"/></td>
                </tr>
                <tr>
                    <td/>
                    <td>Left: <xsl:value-of
                        select="t:dimensions[@type = 'margin']/t:dim[@type = 'left']"/></td>
                </tr>
            </table>
            <xsl:if test="t:note">
                <p>
                    <xsl:apply-templates select="t:note"/>
                </p>
            </xsl:if>
            <xsl:variable name="topmargin"
                select="
                if (t:dimensions[@type = 'margin'][1]/t:dim[@type = 'top'][1]/text()) then
                (t:dimensions[@type = 'margin'][1]/t:dim[@type = 'top'][1])
                else
                ('0')"/>
            <xsl:variable name="bottomargin"
                select="
                if (t:dimensions[@type = 'margin'][1]/t:dim[@type = 'bottom'][1]/text()) then
                (t:dimensions[@type = 'margin'][1]/t:dim[@type = 'bottom'][1])
                else
                ('0')"/>
            <xsl:variable name="rightmargin"
                select="
                if (t:dimensions[@type = 'margin'][1]/t:dim[@type = 'rigth'][1]/text()) then
                (t:dimensions[@type = 'margin'][1]/t:dim[@type = 'rigth'][1])
                else
                ('0')"/>
            <xsl:variable name="leftmargin"
                select="
                if (t:dimensions[@type = 'margin'][1]/t:dim[@type = 'left'][1]/text()) then
                (t:dimensions[@type = 'margin'][1]/t:dim[@type = 'left'][1])
                else
                ('0')"/>
            <xsl:variable name="textwidth" select="t:dimensions[not(@type)][1]/t:width[1]"/>
            <xsl:variable name="heighText" select="t:dimensions[not(@type)][1]/t:height[1]"/>
            <xsl:variable name="totalHeight"
                select="
                if (ancestor::t:objectDesc/t:supportDesc/t:extent/t:dimensions[@type = 'outer']/t:height/text()) then
                (ancestor::t:objectDesc/t:supportDesc/t:extent/t:dimensions[@type = 'outer']/t:height * 10)
                else
                ('0')"/>
            <xsl:variable name="totalwidth"
                select="
                if (ancestor::t:objectDesc/t:supportDesc/t:extent/t:dimensions[@type = 'outer']/t:width/text()) then
                (ancestor::t:objectDesc/t:supportDesc/t:extent/t:dimensions[@type = 'outer']/t:width * 10)
                else
                ('0')"/>
            <xsl:variable name="computedheight"
                select="number($heighText) + number($bottomargin) + number($topmargin)"/>
            <xsl:variable name="computedwidth"
                select="number($textwidth) + number($rightmargin) + number($leftmargin)"/>
            <div class="report">
                <p>- Ms <xsl:value-of select="t:TEI/@xml:id"/>, <xsl:value-of
                    select=".//t:titleStmt/t:title"/><xsl:text>
            </xsl:text>
                    <xsl:choose>
                        <xsl:when test="number($computedheight) > number($totalHeight)"> * has a sum
                            of layout height of <xsl:value-of select="$computedheight"/>mm which is
                            greater than the object height of <xsl:value-of select="$totalHeight"
                            />mm </xsl:when>
                        <xsl:when test="number($computedwidth) > number($totalwidth)"> * has a sum
                            of layout width of <xsl:value-of select="$computedwidth"/>mm which is
                            greater than the object width of <xsl:value-of select="$totalwidth"/>mm </xsl:when>
                        <xsl:otherwise> looks ok for measures computed width is: <xsl:value-of
                            select="$computedwidth"/>mm, object width is: <xsl:value-of
                                select="$totalwidth"/>mm, computed height is: <xsl:value-of
                                    select="$computedheight"/>mm and object height is: <xsl:value-of
                                        select="$totalHeight"/>mm. but the following values are recognized
                            as empty: <xsl:if test="number($topmargin) = 0">top margin </xsl:if>
                            <xsl:if test="number($bottomargin) = 0">bottom margin </xsl:if>
                            <xsl:if test="number($rightmargin) = 0">right margin </xsl:if>
                            <xsl:if test="number($leftmargin) = 0">left margin </xsl:if>
                            <xsl:if test="number($totalHeight) = 0">object height </xsl:if>
                            <xsl:if test="number($totalwidth) = 0">object width </xsl:if>
                        </xsl:otherwise>
                    </xsl:choose></p>
            </div></xsl:if>
        </xsl:for-each>
        <xsl:if test=".//t:ab[@type = 'ruling']">
            
            <h3>Ruling <xsl:if test="./ancestor::t:msPart"><xsl:variable
                name="currentMsPart">
                <a href="{./ancestor::t:msPart/@xml:id}"><xsl:value-of
                    select="./ancestor::t:msPart/@xml:id"/></a></xsl:variable> of
                <xsl:value-of select="$currentMsPart"/></xsl:if></h3>
            <ul>
                <xsl:for-each select=".//t:ab[@type = 'ruling']">
                    <li>
                        <xsl:if test="@subtype">(Subtype: <xsl:value-of select="@subtype"
                        /><xsl:text>) </xsl:text></xsl:if>
                        <xsl:value-of select="."/>
                    </li>
                </xsl:for-each>
                
            </ul>
        </xsl:if>
        <xsl:if test=".//t:ab[@type = 'pricking']">
            <h3>Pricking <xsl:if test="./ancestor::t:msPart"><xsl:variable
                name="currentMsPart">
                <a href="{./ancestor::t:msPart/@xml:id}"><xsl:value-of
                    select="./ancestor::t:msPart/@xml:id"/></a></xsl:variable> of
                <xsl:value-of select="$currentMsPart"/></xsl:if></h3>
            <ul>
                <xsl:for-each select=".//t:ab[@type = 'pricking']">
                    <li>
                        <xsl:if test="@subtype">(Subtype: <xsl:value-of select="@subtype"
                        /><xsl:text>) </xsl:text></xsl:if>
                        <xsl:value-of select="."/>
                    </li>
                </xsl:for-each>
            </ul>
        </xsl:if>
        <xsl:if test=".//t:ab[@type = 'punctuation']">
            <h3>Punctuation <xsl:if test="./ancestor::t:msPart"><xsl:variable
                name="currentMsPart">
                <a href="{./ancestor::t:msPart/@xml:id}"><xsl:value-of
                    select="./ancestor::t:msPart/@xml:id"/></a></xsl:variable> of
                <xsl:value-of select="$currentMsPart"/></xsl:if></h3>
            <ul>
                <xsl:for-each select=".//t:ab[@type = 'punctuation']">
                    <li>
                        <xsl:if test="@subtype">(Subtype: <xsl:value-of select="@subtype"
                        /><xsl:text>) </xsl:text></xsl:if>
                        <xsl:value-of select="."/>
                    </li>
                </xsl:for-each>
            </ul>
        </xsl:if>
        <xsl:if test=".//t:ab[@type != 'pricking'][@type !=   'ruling'][@type !=  'punctuation']">
            <h3>Other <xsl:if test="./ancestor::t:msPart"><xsl:variable
                name="currentMsPart">
                <a href="{./ancestor::t:msPart/@xml:id}"><xsl:value-of
                    select="./ancestor::t:msPart/@xml:id"/></a></xsl:variable> of
                <xsl:value-of select="$currentMsPart"/></xsl:if></h3>
            <ul>
                <xsl:for-each select=".//t:ab[@type != 'pricking'][@type !=   'ruling'][@type !=  'punctuation']">
                    <li>
                        <xsl:value-of select="@type"/>
                        <xsl:text> </xsl:text>
                        <xsl:if test="@subtype">(Subtype: <xsl:value-of select="@subtype"
                        /><xsl:text>) </xsl:text></xsl:if>
                        <xsl:text>: </xsl:text>
                        <xsl:value-of select="."/>
                    </li>
                </xsl:for-each>
            </ul>
        </xsl:if>
        
        <xsl:if test=".//t:layout//t:ab[not(@type)]">
            <h3 style="color:red;">Ab without type <xsl:if test="./ancestor::t:msPart"><xsl:variable
                name="currentMsPart">
                <a href="{./ancestor::t:msPart/@xml:id}"><xsl:value-of
                    select="./ancestor::t:msPart/@xml:id"/></a></xsl:variable> of
                <xsl:value-of select="$currentMsPart"/></xsl:if></h3>
            <ul>
                <xsl:for-each select=".//t:ab[not(@type)]">
                    <li>
                        <b style="color:red;">THIS ab element does not have a required type.</b>
                        <xsl:value-of select="."/>
                    </li>
                </xsl:for-each>
            </ul>
        </xsl:if>
        
        
        <h3>Palaeography <xsl:if test="./ancestor::t:msPart"><xsl:variable
            name="currentMsPart">
            <a href="{./ancestor::t:msPart/@xml:id}"><xsl:value-of
                select="./ancestor::t:msPart/@xml:id"/></a></xsl:variable> of
            <xsl:value-of select="$currentMsPart"/></xsl:if></h3>
        <xsl:apply-templates select="t:handDesc"/>
            
        
        <h4>Punctuation</h4>
        <p>Executed: <xsl:value-of select="//t:ab[@subtype = 'Executed']"/></p>
        <p>Usage: <xsl:value-of select="//t:ab[@subtype = 'Usage']"/></p>
        <ul>
            <xsl:for-each select=".//t:ab[not(@subtype)][@type = 'punctuation']//t:item">
                <li>
                    <xsl:attribute name="id">
                        <xsl:value-of select="@xml:id"/>
                    </xsl:attribute>
                    <xsl:value-of select="."/>
                </li>
            </xsl:for-each>
        </ul>
        
        <xsl:if test=".//t:layout//t:ab[@type = 'CruxAnsata']">
            <h4>crux</h4>
            <p>Yes <xsl:apply-templates select="//t:layout//t:ab[@type = 'CruxAnsata']"/></p>
        </xsl:if>
        
        <xsl:if test=".//t:layout//t:ab[@type = 'coronis']">
            <h4>coronis</h4>
            <p>Yes <xsl:apply-templates select="//t:layout//t:ab[@type = 'coronis']"/></p>
        </xsl:if>
        
        
        <xsl:if test=".//t:layout//t:ab[@type = 'ChiRho']">
            <h4>crux</h4>
            <p>Yes <xsl:apply-templates select="//t:layout//t:ab[@type = 'ChiRho']"/></p>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>