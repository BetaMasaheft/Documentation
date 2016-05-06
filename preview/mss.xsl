<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="2.0">

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
            <p>
                <xsl:if test="//t:msIdentifier/t:altIdentifier">
                    <xsl:for-each select="//t:msIdentifier/t:altIdentifier">
                        <xsl:sort/>
                        <xsl:value-of select="concat(., ' ')"/>
                    </xsl:for-each>
                </xsl:if>
            </p>
            <p>Edited by <xsl:apply-templates
                select="//t:titleStmt/t:editor[not(@role = 'generalEditor')]/@key"/> <xsl:if test="//t:publicationStmt/t:date">on
                    <xsl:value-of
                        select="format-date(//t:publicationStmt/t:date, '[D].[M].[Y]')"
                    /></xsl:if></p>
        </section>
        <section id="description">
            <h2>General description</h2>
            <h3>origin</h3>
            <p>
                <xsl:apply-templates select="//t:history"/>
            </p>
            <h3>People</h3>
            <p>
                <xsl:apply-templates select="//t:listPerson/t:person"/>
            </p>
            <h3>State of preservation</h3>
            <p><xsl:value-of select="//t:custEvent/@restorations"/> restorations :<xsl:value-of
                    select="//t:custEvent/@subtype"/></p>
            <h4>Condition</h4>
            <p>
                <xsl:value-of select="//t:condition"/>
            </p>
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
            <h3>outer dimension</h3>

            <p>H: <xsl:value-of select="//t:extent/t:dimensions/t:height"/> x W: <xsl:value-of
                    select="//t:extent/t:dimensions/t:width"/> x D <xsl:value-of
                    select="//t:extent/t:dimensions/t:depth"/> cm. </p>

            <h3>binding</h3>
            <h4>endbands</h4>
            <p>
                <xsl:choose>
                    <xsl:when test="//t:bindingDesc//t:decoDesc[@type = 'Endbands']">Yes</xsl:when>
                    <xsl:otherwise>No</xsl:otherwise>
                </xsl:choose>
            </p>
            <h4>headbands</h4>
            <p>
                <xsl:choose>
                    <xsl:when test="//t:bindingDesc//t:decoDesc[@type = 'Headbands']">Yes</xsl:when>
                    <xsl:otherwise>No</xsl:otherwise>
                </xsl:choose>
            </p>
            <h4>tailbands</h4>
            <p>
                <xsl:choose>
                    <xsl:when test="//t:bindingDesc//t:decoDesc[@type = 'Headbands']">Yes</xsl:when>
                    <xsl:otherwise>No</xsl:otherwise>
                </xsl:choose>
            </p>
            <h3>decoration</h3>
            <p>
                <xsl:value-of select="//t:binding/t:decoNote[@type = 'Other']"/>
            </p>
            <h3>material</h3>
            <p>
                <xsl:value-of
                    select="//t:binding/t:decoNote[@type = 'bindingMaterial']/t:material/@key"/>
            </p>
            <h3>original binding</h3>
            <p>
                <xsl:value-of select="//t:binding/@contemporary"/>
            </p>
            <h3>writing material</h3>
            <p>
                <xsl:value-of select="//t:support/t:material/@key"/>
            </p>
            <h4>watermark</h4>
            <p>
                <xsl:choose>
                    <xsl:when test="//t:support//t:watermark">Yes</xsl:when>
                    <xsl:otherwise>No</xsl:otherwise>
                </xsl:choose>
            </p>
            <h4>ink</h4>
            <p>
                <xsl:for-each select="//t:handNote[t:seg[@type = 'ink']]">
                    <xsl:value-of select="concat(@xml:id, ': ', t:seg, ';')"/>
                </xsl:for-each>
            </p>
            <h4>extent</h4>
            <p>
                <xsl:value-of select="//t:extent/node()[not(self::t:dimensions)]"/>
            </p>
            <h3>foliation</h3>
            <p>
                <xsl:apply-templates select="//t:foliation"/>
            </p>

            <h3>collation</h3>
            <xsl:if test="//t:collation">
                <div class="collation">
                    <table>
                        <tr>
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
            <table>
                <tr>
                    <td>H</td>
                    <td>
                        <xsl:value-of select="//t:layout/t:dimensions/t:height"/>
                    </td>
                </tr>
                <tr>
                    <td>W</td>
                    <td>
                        <xsl:value-of select="//t:layout/t:dimensions/t:width"/>
                    </td>
                </tr>
                <tr>
                    <td>Intercolumn</td>
                    <td>
                        <xsl:value-of
                            select="//t:layout/t:dimensions[not(@type = 'margin')]/t:dim[@type = 'intercolumn']"
                        />
                    </td>
                </tr>
                <tr>
                    <td>Margins</td>
                    <td>Top: <xsl:value-of
                            select="//t:layout/t:dimensions[@type = 'margin']/t:dim[@type = 'top']"
                        /></td>
                </tr>
                <tr>
                    <td/>
                    <td>Bottom: <xsl:value-of
                            select="//t:layout/t:dimensions[@type = 'margin']/t:dim[@type = 'bottom']"
                        /></td>
                </tr>
                <tr>
                    <td/>
                    <td>Right: <xsl:value-of
                            select="//t:layout/t:dimensions[@type = 'margin']/t:dim[@type = 'right']"
                        /></td>
                </tr>
                <tr>
                    <td/>
                    <td>Left: <xsl:value-of
                            select="//t:layout/t:dimensions[@type = 'margin']/t:dim[@type = 'left']"
                        /></td>
                </tr>
            </table>
            <xsl:variable name="topmargin"
                select="
                    if (//t:layoutDesc/t:layout/t:dimensions[@type = 'margin'][1]/t:dim[@type = 'top'][1]/text()) then
                        (//t:layoutDesc/t:layout/t:dimensions[@type = 'margin'][1]/t:dim[@type = 'top'][1])
                    else
                        ('0')"/>
            <xsl:variable name="bottomargin"
                select="
                    if (//t:layoutDesc/t:layout/t:dimensions[@type = 'margin'][1]/t:dim[@type = 'bottom'][1]/text()) then
                        (//t:layoutDesc/t:layout/t:dimensions[@type = 'margin'][1]/t:dim[@type = 'bottom'][1])
                    else
                        ('0')"/>
            <xsl:variable name="rightmargin"
                select="
                    if (//t:layoutDesc/t:layout/t:dimensions[@type = 'margin'][1]/t:dim[@type = 'rigth'][1]/text()) then
                        (//t:layoutDesc/t:layout/t:dimensions[@type = 'margin'][1]/t:dim[@type = 'rigth'][1])
                    else
                        ('0')"/>
            <xsl:variable name="leftmargin"
                select="
                    if (//t:layoutDesc/t:layout/t:dimensions[@type = 'margin'][1]/t:dim[@type = 'left'][1]/text()) then
                        (//t:layoutDesc/t:layout/t:dimensions[@type = 'margin'][1]/t:dim[@type = 'left'][1])
                    else
                        ('0')"/>
            <xsl:variable name="textwidth"
                select="//t:layoutDesc/t:layout/t:dimensions[not(@type)][1]/t:width[1]"/>
            <xsl:variable name="heighText"
                select="//t:layoutDesc/t:layout/t:dimensions[not(@type)][1]/t:height[1]"/>
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
            </div>
            <h3>ruling</h3>
            <ul>
                <xsl:for-each select="//t:ab[@type = 'ruling']">
                    <li>
                        <xsl:value-of select="."/>
                    </li>
                </xsl:for-each>
            </ul>
            <h3>pricking</h3>
            <ul>
                <xsl:for-each select="//t:ab[@type = 'pricking']">
                    <li>
                        <xsl:value-of select="."/>
                    </li>
                </xsl:for-each>
            </ul>
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
                <ul>
                    <xsl:for-each select="t:list[@type='abbreviations']/t:item"><li><xsl:value-of select="."/></li></xsl:for-each>
                </ul>
                <b>Scribe</b>
                <xsl:apply-templates select="child::node() except (t:list|t:ab|t:seg)"/>
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
            <h4>crux</h4>
            <p>
                <xsl:choose>
                    <xsl:when test="//t:layout//t:ab[@type = 'CruxAnsata']">Yes <xsl:apply-templates
                            select="//t:layout//t:ab[@type = 'CruxAnsata']"/></xsl:when>
                    <xsl:otherwise>No</xsl:otherwise>
                </xsl:choose>
            </p>
            <h4>coronis</h4>
            <p>
                <xsl:choose>
                    <xsl:when test="//t:layout//t:ab[@type = 'coronis']">Yes <xsl:apply-templates
                            select="//t:layout//t:ab[@type = 'coronis']"/></xsl:when>
                    <xsl:otherwise>No</xsl:otherwise>
                </xsl:choose>
            </p>
            <h4>chirho</h4>
            <p>
                <xsl:choose>
                    <xsl:when test="//t:layout//t:ab[@type = 'ChiRho']">Yes <xsl:apply-templates
                            select="//t:layout//t:ab[@type = 'ChiRho']"/></xsl:when>
                    <xsl:otherwise>No</xsl:otherwise>
                </xsl:choose>
            </p>
        </section>


        <section id="contents">
            <h2>Description of content</h2>
            <xsl:apply-templates select="//t:msIdentifier"/>
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
                        <p><xsl:value-of select="./text()"/></p>
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
                select="//t:decoDesc/t:decoNote[generate-id() = generate-id(key('decotype', @type)[1])]">
                <xsl:value-of select="concat(' ', count(key('decotype', ./@type)), ' ', ./@type)"/>
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
            <ol>
                <xsl:for-each select="//t:decoDesc/t:decoNote">
                    <li>
                        <xsl:attribute name="id">
                            <xsl:value-of select="@xml:id"/>
                        </xsl:attribute>
                        <xsl:value-of select="concat(@type, ': ')"/>
                        <xsl:apply-templates/>
                    </li>
                </xsl:for-each>
            </ol>
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