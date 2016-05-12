<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" 
    exclude-result-prefixes="xs" version="2.0">

    <xsl:template name="mss">
        <nav>
            <ul> Navigate section <li><a href="#general">General</a></li>
                <li><a href="#description">Description</a></li>
                <li><a href="#physical">Physical desc</a></li>
                <li><a href="#layout">Layout</a></li>
                <li><a href="#contents">Contents</a></li>
                <li><a href="#deco">Decoration</a></li>
                <li><a href="#footer">Authors</a></li>
            </ul>
            <ul> Navigate by id <xsl:for-each select="//*[not(self::t:TEI)][@xml:id]">
                    <xsl:sort select="position()"/>
                    <li><a href="#{@xml:id}">
                            <xsl:choose>
                                <xsl:when
                                    test="contains(@xml:id, 't') and matches(@xml:id, '\w\d+')"
                                    >Title <xsl:value-of select="substring-after(@xml:id, 't')"
                                    /></xsl:when>
                                <xsl:when
                                    test="contains(@xml:id, 'b') and matches(@xml:id, '\w\d+')"
                                    >Binding <xsl:value-of select="substring-after(@xml:id, 'b')"
                                    /></xsl:when>
                                <xsl:when
                                    test="contains(@xml:id, 'a') and matches(@xml:id, '\w\d+')"
                                    >Addition <xsl:value-of select="substring-after(@xml:id, 'a')"
                                    /></xsl:when>
                                <xsl:when
                                    test="contains(@xml:id, 'e') and matches(@xml:id, '\w\d+')"
                                    >Extra <xsl:value-of select="substring-after(@xml:id, 'e')"
                                    /></xsl:when>
                                <xsl:when
                                    test="contains(@xml:id, 'i') and matches(@xml:id, '_\w\d+')"
                                    >Content Item <xsl:value-of
                                        select="substring-after(@xml:id, 'i')"/></xsl:when>
                                <xsl:when
                                    test="contains(@xml:id, 'q') and matches(@xml:id, '\w\d+')"
                                    >Quire <xsl:value-of select="substring-after(@xml:id, 'q')"
                                    /></xsl:when>
                                <xsl:when test="contains(@xml:id, 'coloph')">Colophon <xsl:value-of
                                        select="substring-after(@xml:id, 'coloph')"/></xsl:when>
                                <xsl:when
                                    test="contains(@xml:id, 'h') and matches(@xml:id, '\w\d+')">Hand
                                        <xsl:value-of select="substring-after(@xml:id, 'h')"
                                    /></xsl:when>
                                <xsl:when test="contains(@xml:id, 'div')">Divider <xsl:value-of
                                        select="substring-after(@xml:id, 'div')"/></xsl:when>
                                <xsl:when
                                    test="contains(@xml:id, 'd') and matches(@xml:id, '\w\d+')"
                                    >Decoration <xsl:value-of select="substring-after(@xml:id, 'd')"
                                    /></xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="name()"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </a></li>
                </xsl:for-each></ul>
        </nav>
        <section id="general">

            <xsl:apply-templates select="//t:msIdentifier"/>

            <p>Edited by <xsl:apply-templates
                    select="//t:titleStmt/t:editor[not(@role = 'generalEditor')]/@key"/>
                <xsl:if test="//t:publicationStmt/t:date"><xsl:text> on </xsl:text><xsl:value-of
                        select="format-date(//t:publicationStmt/t:date, '[D].[M].[Y]')"
                /></xsl:if></p>
        </section>
        <section id="description">
            <xsl:if
                test="//t:date[@evidence = 'internal-date'] or //t:origDate[@evidence = 'internal-date']">
                <p align="right" style="font-size:xx-large;">Dated</p>
            </xsl:if>
            <h2>General description</h2>
            <xsl:if test="//t:history">
                <h3>origin</h3>
                <p>
                    <xsl:apply-templates select="//t:history"/>
                </p>
            </xsl:if>
            <xsl:if test="//t:listPerson/t:person">
                <h3>People</h3>
                <xsl:for-each select="//t:listPerson/t:person">
                    <p>
                        <xsl:apply-templates/>
                    </p>
                </xsl:for-each>
            </xsl:if>
            <h3>State of preservation</h3>
            <p>
                <b>
                    <xsl:value-of select="//t:condition/@key"/>
                </b>
            </p>

            <xsl:if test="//t:custEvent/@restorations">
                <p><xsl:value-of select="//t:custEvent/@restorations"/> restorations :<xsl:value-of
                        select="//t:custEvent/@subtype"/></p>
            </xsl:if>
            <xsl:if test="//t:condition">
                <h4>Condition</h4>

                <p>

                    <xsl:apply-templates select="//t:condition"/>
                </p>
            </xsl:if>
            <h3>Number of texts: <xsl:value-of select="count(//t:msItem[contains(@xml:id, 'i')])"
                /></h3>
            <h3>Number of units: <xsl:choose>
                    <xsl:when test="//t:msPart"><xsl:value-of select="count(//t:msPart)"/>
                    </xsl:when>
                    <xsl:otherwise>1</xsl:otherwise>
                </xsl:choose></h3>
        </section>

        <section id="physical">
            <h2>Physical description</h2>
            <p>
                <xsl:value-of select="//t:binding/t:decoNote[position() = 1]"/>
            </p>
           <xsl:if test="//t:dimensions[@type='outer']">
               <h3>Outer dimension</h3>

            <p>H: <xsl:value-of select="//t:extent/t:dimensions/t:height"/> x W: <xsl:value-of
                    select="//t:extent/t:dimensions/t:width"/><xsl:if
                    test="//t:extent/t:dimensions/t:depth"> x D <xsl:value-of
                        select="//t:extent/t:dimensions/t:depth"/>
                </xsl:if><xsl:text> </xsl:text><xsl:value-of select="//t:extent/t:dimensions/@unit"
                />. </p>
            <p>(proportion height/width: <xsl:value-of
                    select="format-number(number(//t:extent/t:dimensions/t:height div //t:extent/t:dimensions/t:width), '#0.0###')"
                /> ) </p></xsl:if>
            <xsl:if test="//t:extent/t:note">
                <p>
                    <xsl:apply-templates select="//t:extent/t:note"/>
                </p>
            </xsl:if>

            <h3>binding</h3>

            <xsl:if test="//t:bindingDesc//t:decoDesc[@type = 'Endbands']">
                <h4>endbands</h4>
                <p> Yes </p>

            </xsl:if>




            <xsl:if test="//t:bindingDesc//t:decoDesc[@type = 'Headbands']">
                <h4>headbands</h4>
                <p> Yes </p>
            </xsl:if>



            <xsl:if test="//t:bindingDesc//t:decoDesc[@type = 'Headbands']">
                <h4>tailbands</h4>
                <p> Yes </p>
            </xsl:if>



            <xsl:if test="//t:binding/t:decoNote[@type = 'Other']">
                <h4>binding decoration</h4>
                <p>
                    <xsl:value-of select="//t:binding/t:decoNote[@type = 'Other']"/>
                </p>
            </xsl:if>
            <h4> binding material</h4>
            <p>
                <xsl:value-of
                    select="//t:binding/t:decoNote[@type = 'bindingMaterial']/t:material/@key"/>
            </p>
            <h4>original binding</h4>
            <p>
                <xsl:value-of select="//t:binding/@contemporary"/>
            </p>
            <h3>writing material</h3>
            <p>
                <xsl:value-of select="//t:support/t:material/@key"/>
            </p>
            <h3>watermark</h3>
            <p>
                <xsl:choose>
                    <xsl:when test="//t:support//t:watermark">Yes</xsl:when>
                    <xsl:otherwise>No</xsl:otherwise>
                </xsl:choose>
            </p>
            <h3>ink</h3>
            <p>
                <xsl:for-each select="//t:handNote[t:seg[@type = 'ink']]">
                    <xsl:value-of select="concat(@xml:id, ': ', t:seg, ';')"/>
                </xsl:for-each>
            </p>
            <h4>extent</h4>
            <p>
                <xsl:apply-templates select="//t:extent/node()[not(self::t:dimensions)]"/>
            </p>
            <xsl:if test="//t:foliation">
                <h3>foliation</h3>
                <p>
                    <xsl:apply-templates select="//t:foliation"/>
                </p>
            </xsl:if>

           
            <xsl:if test="//t:collation[node()]"> <h3>collation</h3>
                
                    <xsl:if test="//t:signatures">
                        <p>
                        <xsl:apply-templates select="//t:signatures"/>  
                    </p>
                    </xsl:if>
              

                <div class="collation">

                    <table>
                        <tr style="background-color: lightgray;">
                            <td class="headcol">position</td>
                            <xsl:for-each select="//t:collation//t:item">
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
                            <xsl:for-each select="//t:collation//t:item">
                                <xsl:sort select="position()"/>
                                <td>
                                    <xsl:apply-templates select="@n"/>
                                </td>
                            </xsl:for-each>
                        </tr>
                        <tr style="background-color: lightgray;">
                            <td class="headcol">leafs</td>
                            <xsl:for-each select="//t:collation//t:item">
                                <xsl:sort select="position()"/>
                                <td>
                                    <xsl:apply-templates select="t:dim[@unit = 'leaf']"/>
                                </td>
                            </xsl:for-each>
                        </tr>
                        <tr>
                            <td class="headcol">quires</td>
                            <xsl:for-each select="//t:collation//t:item">
                                <xsl:sort select="position()"/>
                                <td>
                                    <xsl:apply-templates select="t:locus"/>
                                </td>
                            </xsl:for-each>
                        </tr>
                        <tr>
                            <td class="headcol">description</td>
                            <xsl:for-each select="//t:collation//t:item">
                                <xsl:sort select="position()"/>
                                <td>
                                    <xsl:value-of select="text()"/>
                                </td>
                            </xsl:for-each>
                        </tr>

                    </table>
                </div>
            </xsl:if>

        </section>


        <section id="layout">
            <h3>layout</h3>
            <xsl:for-each select="//t:layout[t:dimensions]">
                <xsl:sort select="position()"/>
                <h4>
                    <xsl:value-of select="position()"/>
                </h4>


                <p>Number of columns : <xsl:value-of select="@columns"/></p>

                <p>Number of lines : <xsl:value-of select="@writtenLines"/></p>

                <table>
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
                                select="t:dimensions[@type = 'margin']/t:dim[@type = 'bottom']"
                            /></td>
                    </tr>
                    <tr>
                        <td/>
                        <td>Right: <xsl:value-of
                                select="t:dimensions[@type = 'margin']/t:dim[@type = 'right']"
                            /></td>
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
                        if (//t:supportDesc/t:extent/t:dimensions[@type = 'outer']/t:height/text()) then
                            (//t:supportDesc/t:extent/t:dimensions[@type = 'outer']/t:height * 10)
                        else
                            ('0')"/>
                <xsl:variable name="totalwidth"
                    select="
                        if (//t:supportDesc/t:extent/t:dimensions[@type = 'outer']/t:width/text()) then
                            (//t:supportDesc/t:extent/t:dimensions[@type = 'outer']/t:width * 10)
                        else
                            ('0')"/>
                <xsl:variable name="computedheight"
                    select="number($heighText) + number($bottomargin) + number($topmargin)"/>
                <xsl:variable name="computedwidth"
                    select="number($textwidth) + number($rightmargin) + number($leftmargin)"/>
                <div class="report">
                    <p>- Ms <xsl:value-of select="t:TEI/@xml:id"/>, <xsl:value-of
                            select="//t:titleStmt/t:title"/><xsl:text>
            </xsl:text>
                        <xsl:choose>
                            <xsl:when test="number($computedheight) > number($totalHeight)"> * has a
                                sum of layout height of <xsl:value-of select="$computedheight"/>mm
                                which is greater than the object height of <xsl:value-of
                                    select="$totalHeight"/>mm </xsl:when>
                            <xsl:when test="number($computedwidth) > number($totalwidth)"> * has a
                                sum of layout width of <xsl:value-of select="$computedwidth"/>mm
                                which is greater than the object width of <xsl:value-of
                                    select="$totalwidth"/>mm </xsl:when>
                            <xsl:otherwise> looks ok for measures computed width is: <xsl:value-of
                                    select="$computedwidth"/>mm, object width is: <xsl:value-of
                                    select="$totalwidth"/>mm, computed height is: <xsl:value-of
                                    select="$computedheight"/>mm and object height is: <xsl:value-of
                                    select="$totalHeight"/>mm. but the following values are
                                recognized as empty: <xsl:if test="number($topmargin) = 0">top
                                    margin </xsl:if>
                                <xsl:if test="number($bottomargin) = 0">bottom margin </xsl:if>
                                <xsl:if test="number($rightmargin) = 0">right margin </xsl:if>
                                <xsl:if test="number($leftmargin) = 0">left margin </xsl:if>
                                <xsl:if test="number($totalHeight) = 0">object height </xsl:if>
                                <xsl:if test="number($totalwidth) = 0">object width </xsl:if>
                            </xsl:otherwise>
                        </xsl:choose></p>
                </div>
            </xsl:for-each>
            <xsl:if test="//t:ab[@type = 'ruling']">

                <h3>ruling</h3>
                <ul>
                    <xsl:for-each select="//t:ab[@type = 'ruling']">
                        <li>
                            <xsl:if test="@subtype">(Subtype: <xsl:value-of select="@subtype"
                                /><xsl:text>) </xsl:text></xsl:if>
                            <xsl:value-of select="."/>
                        </li>
                    </xsl:for-each>

                </ul>
            </xsl:if>
            <xsl:if test="//t:ab[@type = 'pricking']">
                <h3>pricking</h3>
                <ul>
                    <xsl:for-each select="//t:ab[@type = 'pricking']">
                        <li>
                            <xsl:if test="@subtype">(Subtype: <xsl:value-of select="@subtype"
                                /><xsl:text>) </xsl:text></xsl:if>
                            <xsl:value-of select="."/>
                        </li>
                    </xsl:for-each>
                </ul>
            </xsl:if>

            <xsl:if test="//t:ab[@type != 'pricking' or 'ruling']">
                <h3>Other</h3>
                <ul>
                    <xsl:for-each select="//t:ab[@type != 'pricking' or 'ruling']">
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

            <xsl:if test="//t:layout//t:ab[not(@type)]">
                <h3 style="color:red;">ab without type</h3>
                <ul>
                    <xsl:for-each select="//t:ab[not(@type)]">
                        <li>
                            <b style="color:red;">THIS ab element does not have a required type.</b>
                            <xsl:value-of select="."/>
                        </li>
                    </xsl:for-each>
                </ul>
            </xsl:if>
            <h3>Palaeography</h3>
            <xsl:for-each select="//t:handNote">
                <h4>
                    <xsl:attribute name="id">
                        <xsl:value-of select="@xml:id"/>
                    </xsl:attribute> Hand <xsl:value-of select="substring-after(@xml:id, 'h')"/>
                </h4>
                <p><xsl:value-of select="@script"/>: <xsl:value-of select="t:ab[@type = 'script']"
                    /></p>
                <p>Ink: <xsl:value-of select="t:seg[@type = 'ink']"/></p>
                <xsl:if test="t:list[@type = 'abbreviations']">
                    <h4> Abbreviations </h4>
                    <ul>
                        <xsl:for-each select="t:list[@type = 'abbreviations']/t:item">
                            <li>
                                <xsl:apply-templates select="."/>
                            </li>
                        </xsl:for-each>
                    </ul>
                </xsl:if>
                <xsl:if test="t:persName[@role = 'scribe']">
                    <b>Scribe</b>
                    <p>
                        <xsl:apply-templates select="t:persName[@role = 'scribe']"/>
                    </p>
                </xsl:if>
                <xsl:apply-templates
                    select="child::node() except (t:list | t:ab[@type = 'script'] | t:seg)"/>
            </xsl:for-each>
            <h4>Punctuation</h4>
            <p>Executed: <xsl:value-of select="//t:ab[@subtype = 'Executed']"/></p>
            <p>Usage: <xsl:value-of select="//t:ab[@subtype = 'Usage']"/></p>
            <ul>
                <xsl:for-each select="//t:ab[not(@subtype)][@type = 'punctuation']//t:item">
                    <li>
                        <xsl:attribute name="id">
                            <xsl:value-of select="@xml:id"/>
                        </xsl:attribute>
                        <xsl:value-of select="."/>
                    </li>
                </xsl:for-each>
            </ul>

            <xsl:if test="//t:layout//t:ab[@type = 'CruxAnsata']">
                <h4>crux</h4>
                <p>Yes <xsl:apply-templates select="//t:layout//t:ab[@type = 'CruxAnsata']"/></p>
            </xsl:if>

            <xsl:if test="//t:layout//t:ab[@type = 'coronis']">
                <h4>coronis</h4>
                <p>Yes <xsl:apply-templates select="//t:layout//t:ab[@type = 'coronis']"/></p>
            </xsl:if>


            <xsl:if test="//t:layout//t:ab[@type = 'ChiRho']">
                <h4>crux</h4>
                <p>Yes <xsl:apply-templates select="//t:layout//t:ab[@type = 'ChiRho']"/></p>
            </xsl:if>

        </section>


        <section id="contents">
            <h2>Description of content</h2>
            <xsl:apply-templates select="//t:msContents"/>
            <h2>Additiones</h2>
            <xsl:text>In this manuscript there are </xsl:text>
            <xsl:for-each
                select="//t:item/t:desc[generate-id() = generate-id(key('additiontype', @type)[1])]">
                <xsl:value-of
                    select="concat(' ', count(key('additiontype', ./@type)), ' ', ./@type)"/>
                <xsl:choose>
                    <xsl:when test="not(position() = last()) and not(position() + 1 = last())">
                        <xsl:text>,</xsl:text>
                    </xsl:when>
                    <xsl:when test="position() + 1 = last()">
                        <xsl:text> and</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>.</xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
            <xsl:if test="//t:additions/t:note">
                <p>
                    <xsl:apply-templates select="//t:additions/t:note"/>
                </p>
            </xsl:if>
            <ol>
                <xsl:for-each select="//t:item[contains(@xml:id, 'a')]">
                    <li>
                        <xsl:attribute name="id">
                            <xsl:value-of select="@xml:id"/>
                        </xsl:attribute>
                        <p>
                            <xsl:apply-templates select="t:locus"/>
                        </p>
                        <p>
                            <xsl:apply-templates select="t:desc"/>
                            <xsl:if test="t:desc/@type"> (Type: <xsl:value-of select="t:desc/@type"
                                />)</xsl:if>
                        </p>
                        <xsl:for-each select="t:q">
                            <p>
                                <xsl:value-of select="concat('(', @xml:lang, ') ')"/>
                                <xsl:apply-templates select="."/>
                            </p>
                        </xsl:for-each>
                        <p>
                            <xsl:value-of select="./text()"/>
                        </p>
                        <p>
                            <xsl:apply-templates select="t:note"/>
                        </p>
                    </li>
                </xsl:for-each>
            </ol>
            <h3>Extras</h3>
            <ol>
                <xsl:for-each select="//t:item[contains(@xml:id, 'e')]">
                    <li>
                        <xsl:apply-templates/>
                    </li>
                </xsl:for-each>
            </ol>
        </section>
        <section id="deco">
            <h2>Decoration</h2>
            <xsl:text>In this manuscript there are </xsl:text>
            <xsl:for-each
                select="//t:decoNote[not(ancestor::t:binding)][generate-id() = generate-id(key('decotype', @type)[1])]">
                <xsl:value-of select="concat(' ', count(key('decotype', ./@type)), ' notes about ', ./@type)"/>
                <xsl:choose>
                    <xsl:when test="not(position() = last()) and not(position() + 1 = last())">
                        <xsl:text>,</xsl:text>
                    </xsl:when>
                    <xsl:when test="position() + 1 = last()">
                        <xsl:text> and</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>.</xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
            <p><xsl:apply-templates select="//t:decoDesc/t:summary"/></p>
            
                <xsl:for-each select="//t:decoNote[not(ancestor::t:binding)][@type='frame']">
                    <h3>Frame notes</h3>
                    <ol>
                        <li>
                        <xsl:attribute name="id">
                            <xsl:value-of select="@xml:id"/>
                        </xsl:attribute>
                        <xsl:value-of select="concat(@type, ': ')"/>
                        <xsl:apply-templates/>
                    </li>
                    </ol>
                </xsl:for-each>
            
            <xsl:for-each select="//t:decoNote[not(ancestor::t:binding)][@type='miniature']">
                <h3>Miniature notes</h3>
                <ol>
                    <li>
                        <xsl:attribute name="id">
                            <xsl:value-of select="@xml:id"/>
                        </xsl:attribute>
                        <xsl:value-of select="concat(@type, ': ')"/>
                        <xsl:apply-templates/>
                    </li>
                </ol>
            </xsl:for-each>
            <xsl:for-each select="//t:decoNote[not(ancestor::t:binding)][@type != 'miniature' or 'frame']">
                <h3>Other decorations</h3>
                <ol>
                    <li>
                        <xsl:attribute name="id">
                            <xsl:value-of select="@xml:id"/>
                        </xsl:attribute>
                        <xsl:value-of select="concat(@type, ': ')"/>
                        <xsl:apply-templates/>
                    </li>
                </ol>
            </xsl:for-each>
            <h2>Catalogued in</h2>
            <xsl:apply-templates select="//t:additional//t:listBibl"/>
            <h2>Keywords</h2>
            <ul>
                <xsl:for-each select="//t:term">
                    <li>
                        <xsl:value-of select="@key"/>
                    </li>
                </xsl:for-each>
            </ul>
            <table>
                <caption>Relations of this Entity with other entities</caption>
                <thead>
                    <tr>
                        <th>Subject</th>
                        <th>Relation</th>
                        <th>Object</th>
                    </tr>
                </thead>
                <xsl:apply-templates mode="reltable" select="//t:listBibl[@type = 'relations']"/>
            </table>
            <xsl:apply-templates mode="graph" select="//t:listBibl[@type = 'relations']"/>
        </section>
        <footer id="footer">
            <h2>Authors</h2>
            <ul>
                <xsl:apply-templates select="//t:revisionDesc"/>
            </ul>
        </footer>
    </xsl:template>
</xsl:stylesheet>
