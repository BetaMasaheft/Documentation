<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="2.0">

    <xsl:template match="t:msDesc">
        <xsl:if test="t:history">
            <div id="{@xml:id}history">

                <xsl:apply-templates select="t:history"/>
            </div>
        </xsl:if>

        <xsl:if test="t:physDesc//t:objectDesc/t:supportDesc">
            <div id="{@xml:id}dimensions">
                <xsl:apply-templates select="t:physDesc//t:objectDesc/t:supportDesc"/>
            </div>
        </xsl:if>

        <xsl:if test="t:physDesc//t:bindingDesc">
            <div id="{@xml:id}binding">
                <xsl:apply-templates select="t:physDesc//t:bindingDesc"/>
            </div>
        </xsl:if>

        <xsl:if test="t:physDesc//t:objectDesc/t:layoutDesc">
            <div id="{@xml:id}dimensions">
                <xsl:apply-templates select="t:physDesc//t:objectDesc/t:layoutDesc"/>
            </div>
        </xsl:if>

        <xsl:if test="t:physDesc/t:handNote">
            <div id="{@xml:id}hands">
                <xsl:apply-templates select="t:physDesc/t:handNote"/>
            </div>
        </xsl:if>

        <xsl:if test="t:msContents">
            <div id="{@xml:id}content">
                <xsl:apply-templates select="t:msContents"/>
            </div>
        </xsl:if>

        <xsl:if test="t:physDesc/t:additions">
            <div id="{@xml:id}additiones">
                <xsl:apply-templates select="t:physDesc/t:additions"/>
            </div>
        </xsl:if>

        <xsl:if test="t:physDesc//t:decoNote">
            <div id="{@xml:id}decoration">
                <xsl:apply-templates select="t:physDesc/t:decoNote"/>
            </div>
        </xsl:if>

        <xsl:if test="t:additional">
            <div id="{@xml:id}additionals">
                <xsl:apply-templates select="t:additional"/>
            </div>
        </xsl:if>

        <xsl:if test="t:msPart">
            <div id="{@xml:id}parts">
                <xsl:apply-templates select="t:msPart"/>
            </div>
        </xsl:if>

        <xsl:if test="t:msFrag">
            <div id="{@xml:id}fragments">
                <xsl:apply-templates select="t:msFrag"/>
            </div>
        </xsl:if>

    </xsl:template>

    <xsl:template match="t:dimensions[@type = 'outer']">


        <h2>Physical description<xsl:if test="./ancestor::t:msPart"><xsl:variable
                    name="currentMsPart">
                    <a href="{./ancestor::t:msPart/@xml:id}"><xsl:value-of
                            select="./ancestor::t:msPart/@xml:id"/></a></xsl:variable> of
                    <xsl:value-of select="$currentMsPart"/></xsl:if></h2>
        <p>
            <xsl:value-of select="//t:binding/t:decoNote[position() = 1]"/>
        </p>
        <h3>Outer dimension<xsl:if test="./ancestor::t:msPart"><xsl:variable
            name="currentMsPart">
            <a href="{./ancestor::t:msPart/@xml:id}"><xsl:value-of
                select="./ancestor::t:msPart/@xml:id"/></a></xsl:variable> of
            <xsl:value-of select="$currentMsPart"/></xsl:if></h3>

        <p>H: <xsl:value-of select="t:height"/> x W: <xsl:value-of select="t:width"/><xsl:if
                test="t:depth"> x D <xsl:value-of select="t:depth"/>
            </xsl:if><xsl:text> </xsl:text><xsl:value-of select="@unit"/>. </p>
        <p>(proportion height/width: <xsl:value-of
                select="format-number(number(t:height div t:width), '#0.0###')"/> ) </p>
        <xsl:if test="//t:extent/t:note">
            <p>
                <xsl:apply-templates select="//t:extent/t:note"/>
            </p>
        </xsl:if>
        <xsl:apply-templates/>


    </xsl:template>

    <xsl:template match="t:support">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="t:extent">
        <h4>Extent <xsl:if test="./ancestor::t:msPart"><xsl:variable
            name="currentMsPart">
            <a href="{./ancestor::t:msPart/@xml:id}"><xsl:value-of
                select="./ancestor::t:msPart/@xml:id"/></a></xsl:variable> of
            <xsl:value-of select="$currentMsPart"/></xsl:if></h4>
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="t:foliation">
        <h3>Foliation <xsl:if test="./ancestor::t:msPart"><xsl:variable
            name="currentMsPart">
            <a href="{./ancestor::t:msPart/@xml:id}"><xsl:value-of
                select="./ancestor::t:msPart/@xml:id"/></a></xsl:variable> of
            <xsl:value-of select="$currentMsPart"/></xsl:if></h3>
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="t:collation">
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


        <div class="collation">

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
    </xsl:template>

    <xsl:template match="t:material">
        <h3>Writing material <xsl:if test="./ancestor::t:msPart"><xsl:variable
            name="currentMsPart">
            <a href="{./ancestor::t:msPart/@xml:id}"><xsl:value-of
                select="./ancestor::t:msPart/@xml:id"/></a></xsl:variable> of
            <xsl:value-of select="$currentMsPart"/></xsl:if></h3>
        <p>
            <xsl:value-of select="@key"/>
        </p>
    </xsl:template>

    <xsl:template match="t:handDesc">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="t:handNote[t:seg[@type = 'ink']]">
        <h3>Ink <xsl:if test="./ancestor::t:msPart"><xsl:variable
            name="currentMsPart">
            <a href="{./ancestor::t:msPart/@xml:id}"><xsl:value-of
                select="./ancestor::t:msPart/@xml:id"/></a></xsl:variable> of
            <xsl:value-of select="$currentMsPart"/></xsl:if></h3>
        <p>
            <xsl:for-each select=".">
                <xsl:value-of select="concat(@xml:id, ': ', t:seg, ';')"/>
            </xsl:for-each>
        </p>
    </xsl:template>

    <xsl:template match="t:bindingDesc">
        <h3>Binding <xsl:if test="./ancestor::t:msPart"><xsl:variable
            name="currentMsPart">
            <a href="{./ancestor::t:msPart/@xml:id}"><xsl:value-of
                select="./ancestor::t:msPart/@xml:id"/></a></xsl:variable> of
            <xsl:value-of select="$currentMsPart"/></xsl:if></h3>

        <xsl:if test=".//t:decoDesc[@type = 'Endbands']">
            <h4>Endbands</h4>
            <p> Yes </p>

        </xsl:if>




        <xsl:if test=".//t:decoDesc[@type = 'Headbands']">
            <h4>Headbands</h4>
            <p> Yes </p>
        </xsl:if>



        <xsl:if test=".//t:decoDesc[@type = 'Headbands']">
            <h4>Tailbands</h4>
            <p> Yes </p>
        </xsl:if>



        <xsl:if test="t:binding/t:decoNote[@type = 'Other']">
            <h4>Binding decoration</h4>
            <p>
                <xsl:value-of select="t:binding/t:decoNote[@type = 'Other']"/>
            </p>
        </xsl:if>
        <h4>Binding material</h4>
        <p>
            <xsl:value-of select="t:binding/t:decoNote[@type = 'bindingMaterial']/t:material/@key"/>
        </p>
        <h4>Original binding</h4>
        <p>
            <xsl:value-of select="t:binding/@contemporary"/>
        </p>
    </xsl:template>


    <xsl:template match="t:msPart[parent::t:sourceDesc or parent::t:msDesc]">
        <div>
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <div id="{@xml:id}history">
                <xsl:apply-templates select="t:history"/>
            </div>

            <div id="{@xml:id}dimensions">
                <xsl:apply-templates select="t:physDesc//t:objectDesc/t:supportDesc"/>
            </div>

            <div id="{@xml:id}binding">
                <xsl:apply-templates select="t:physDesc//t:bindingDesc"/>
            </div>

            <div id="{@xml:id}dimensions">
                <xsl:apply-templates select="t:physDesc//t:objectDesc/t:layoutDesc"/>
            </div>

            <div id="{@xml:id}hands">
                <xsl:apply-templates select="t:physDesc/t:handNote"/>
            </div>

            <div id="{@xml:id}content">
                <xsl:apply-templates select="t:msContents"/>
            </div>

            <div id="{@xml:id}additiones">
                <xsl:apply-templates select="t:physDesc/t:additions"/>
            </div>

            <div id="{@xml:id}decoration">
                <xsl:apply-templates select="t:physDesc/t:decoNote"/>
            </div>

            <div id="{@xml:id}additionals">
                <xsl:apply-templates select="t:additional"/>
            </div>

            <div id="{@xml:id}parts">
                <xsl:apply-templates select="t:msPart"/>
            </div>

            <div id="{@xml:id}fragments">
                <xsl:apply-templates select="t:msFrag"/>
            </div>

        </div>
        <hr/>
    </xsl:template>

    <xsl:template match="t:msFrag[parent::t:sourceDesc or parent::t:msFrag]">
        <div>
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <div id="{@xml:id}history">
                <xsl:apply-templates select="t:history"/>
            </div>
            
            <div id="{@xml:id}dimensions">
                <xsl:apply-templates select="t:physDesc//t:objectDesc/t:supportDesc"/>
            </div>
            
            <div id="{@xml:id}binding">
                <xsl:apply-templates select="t:physDesc//t:bindingDesc"/>
            </div>
            
            <div id="{@xml:id}dimensions">
                <xsl:apply-templates select="t:physDesc//t:objectDesc/t:layoutDesc"/>
            </div>
            
            <div id="{@xml:id}hands">
                <xsl:apply-templates select="t:physDesc/t:handNote"/>
            </div>
            
            <div id="{@xml:id}content">
                <xsl:apply-templates select="t:msContents"/>
            </div>
            
            <div id="{@xml:id}additiones">
                <xsl:apply-templates select="t:physDesc/t:additions"/>
            </div>
            
            <div id="{@xml:id}decoration">
                <xsl:apply-templates select="t:physDesc/t:decoNote"/>
            </div>
            
            <div id="{@xml:id}additionals">
                <xsl:apply-templates select="t:additional"/>
            </div>
            
            <div id="{@xml:id}parts">
                <xsl:apply-templates select="t:msPart"/>
            </div>
            
            <div id="{@xml:id}fragments">
                <xsl:apply-templates select="t:msFrag"/>
            </div>
            
        </div>
        <hr/>
    </xsl:template>

    <xsl:template match="t:msPart[parent::t:msPart]">
        <div style="padding-left: 50px;">
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <hr style="border-top: dotted 1px;"/>

            <div id="{@xml:id}history">
                <xsl:apply-templates select="t:history"/>
            </div>

            <div id="{@xml:id}dimensions">
                <xsl:apply-templates select="t:physDesc//t:objectDesc/t:supportDesc"/>
            </div>

            <div id="{@xml:id}binding">
                <xsl:apply-templates select="t:physDesc//t:bindingDesc"/>
            </div>

            <div id="{@xml:id}dimensions">
                <xsl:apply-templates select="t:physDesc//t:objectDesc/t:layoutDesc"/>
            </div>

            <div id="{@xml:id}hands">
                <xsl:apply-templates select="t:physDesc/t:handNote"/>
            </div>

            <div id="{@xml:id}content">
                <xsl:apply-templates select="t:msContents"/>
            </div>

            <div id="{@xml:id}additiones">
                <xsl:apply-templates select="t:physDesc/t:additions"/>
            </div>

            <div id="{@xml:id}decoration">
                <xsl:apply-templates select="t:physDesc/t:decoNote"/>
            </div>

            <div id="{@xml:id}additionals">
                <xsl:apply-templates select="t:additional"/>
            </div>

            <div id="{@xml:id}parts">
                <xsl:apply-templates select="t:msPart"/>
            </div>

            <div id="{@xml:id}fragments">
                <xsl:apply-templates select="t:msFrag"/>
            </div>

        </div>
    </xsl:template>
    
    <xsl:template match="t:msFrag[parent::t:msFrag]">
        <div style="padding-left: 50px;">
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <hr style="border-top: dotted 1px;"/>
            
            <div id="{@xml:id}history">
                <xsl:apply-templates select="t:history"/>
            </div>
            
            <div id="{@xml:id}dimensions">
                <xsl:apply-templates select="t:physDesc//t:objectDesc/t:supportDesc"/>
            </div>
            
            <div id="{@xml:id}binding">
                <xsl:apply-templates select="t:physDesc//t:bindingDesc"/>
            </div>
            
            <div id="{@xml:id}dimensions">
                <xsl:apply-templates select="t:physDesc//t:objectDesc/t:layoutDesc"/>
            </div>
            
            <div id="{@xml:id}hands">
                <xsl:apply-templates select="t:physDesc/t:handNote"/>
            </div>
            
            <div id="{@xml:id}content">
                <xsl:apply-templates select="t:msContents"/>
            </div>
            
            <div id="{@xml:id}additiones">
                <xsl:apply-templates select="t:physDesc/t:additions"/>
            </div>
            
            <div id="{@xml:id}decoration">
                <xsl:apply-templates select="t:physDesc/t:decoNote"/>
            </div>
            
            <div id="{@xml:id}additionals">
                <xsl:apply-templates select="t:additional"/>
            </div>
            
            <div id="{@xml:id}parts">
                <xsl:apply-templates select="t:msPart"/>
            </div>
            
            <div id="{@xml:id}fragments">
                <xsl:apply-templates select="t:msFrag"/>
            </div>
            
        </div>
    </xsl:template>


    <xsl:template match="t:msContent">
        <div id="contents">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

<xsl:template match="t:summary">
    
    <h3>Summary</h3>
    
    <ul class="nav nav-tabs">
        <li class="active" ><a data-toggle="tab"  href="#extracted">Extracted summary of contents</a></li>
        <li><a  data-toggle="tab" href="#given">Given summary of contents</a></li>
    </ul>
    <div class="tab-content">
        <div id="given"  class="tab-pane fade">
        <xsl:value-of select="."/>
    </div>
        <div id="extracted"  class="tab-pane fade in active">
        <ol><xsl:for-each select="//t:msItem">
            <xsl:sort/>
            <ul><xsl:value-of select="@xml:id"/><xsl:text>, </xsl:text><xsl:apply-templates select=".//t:title"/></ul>
        </xsl:for-each></ol>
    </div>
    </div>
</xsl:template>
    
    <xsl:template match="t:msItem[parent::t:msContents]">
        <xsl:choose>
            <xsl:when test=".[contains(@xml:id, 'coloph')]">
                <xsl:call-template name="colophon"/>
            </xsl:when>
            <xsl:otherwise>
                <div class="container">
                    <xsl:attribute name="id">
                        <xsl:value-of select="@xml:id"/>
                    </xsl:attribute>
                    <button type="button" class="btn btn-info" data-toggle="collapse"
                        data-target="#item{@xml:id}">expand/collapse</button>
                    <h3>Item <xsl:value-of select="@xml:id"/></h3>

                    <div id="item{@xml:id}" class="collapse">
                        <xsl:apply-templates/>
                    </div>
                </div>
                <hr/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="t:msItem[parent::t:msItem]">
        <xsl:choose>
            <xsl:when test=".[contains(@xml:id, 'coloph')]">
                <xsl:call-template name="colophon"/>
            </xsl:when>
            <xsl:otherwise>
                <div style="padding-left: 50px;">
                    <xsl:attribute name="id">
                        <xsl:value-of select="@xml:id"/>
                    </xsl:attribute>
                    <hr style="border-top: dotted 1px;"/>


                    <h4>Item <xsl:value-of select="@xml:id"/></h4>

                    <div>
                        <xsl:apply-templates/>
                    </div>
                </div>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <xsl:template name="colophon">
        <hr style="border-top: dotted 2px;"/>
        <h3>Colophon</h3>
        <xsl:for-each select=".">
            <p>
                <xsl:apply-templates select="descendant::t:locus"/>
            </p>
            <p>
                <xsl:value-of select="t:colophon/text()"/>
            </p>

            <xsl:if test="t:colophon/t:foreign">
                <p>
                    <b>Translation <xsl:value-of select="t:colophon/t:foreign/@xml:lang"/>: </b>
                    <xsl:value-of select="t:colophon/t:foreign"/>
                </p>
            </xsl:if>
            <xsl:if test="descendant::t:note">
                <p>
                    <xsl:apply-templates select="descendant::t:note"/>
                </p>
            </xsl:if>
            <xsl:if test="descendant::t:listBibl">
                <xsl:apply-templates select="descendant::t:listBibl"/>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>


    <xsl:template match="t:incipit">
        <p>
            <b>Incipit: </b>
            <xsl:apply-templates/>
        </p>
    </xsl:template>


    <xsl:template match="t:explicit">
        <p>
            <b>Explicit: </b>
            <xsl:apply-templates/>
        </p>
    </xsl:template>


    <xsl:template match="t:rubric">
        <p>
            <b>Rubrication: </b>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="t:idno[parent::t:msIdentifier]" mode="title">
        <h1>
            <xsl:value-of select="."/>
        </h1>
    </xsl:template>

    <xsl:template match="t:collection" mode="title">
        <b>Collection: <xsl:value-of select="."/></b>
    </xsl:template>

    <xsl:template match="t:altIdentifier" mode="title">
        <p>Other identifiers: <xsl:for-each select="t:idno">
                <xsl:sort/>
                <xsl:value-of select="concat(., ' ')"/>
            </xsl:for-each></p>
    </xsl:template>

    <xsl:template match="t:history">
        <h2>Origin <xsl:if test="./ancestor::t:msPart"><xsl:variable name="currentMsPart">
                    <a href="{./ancestor::t:msPart/@xml:id}"><xsl:value-of
                            select="./ancestor::t:msPart/@xml:id"/></a></xsl:variable> of
                    <xsl:value-of select="$currentMsPart"/></xsl:if></h2>
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="t:watermark">
        <h3>watermark</h3>
        <p>
            <xsl:choose>
                <xsl:when test=". != ''">Yes</xsl:when>
                <xsl:otherwise>No</xsl:otherwise>
            </xsl:choose>
        </p>
    </xsl:template>

    <xsl:template match="t:condition">

        <h3>State of preservation <xsl:if test="./ancestor::t:msPart"><xsl:variable
            name="currentMsPart">
            <a href="{./ancestor::t:msPart/@xml:id}"><xsl:value-of
                select="./ancestor::t:msPart/@xml:id"/></a></xsl:variable> of
            <xsl:value-of select="$currentMsPart"/></xsl:if></h3>
        <p>
            <b>
                <xsl:value-of select="@key"/>
            </b>
        </p>

        <h4>Condition</h4>
        <p>

            <xsl:apply-templates/>
        </p>

    </xsl:template>

    <xsl:template match="t:custEvent/@restoration">
        <p><xsl:value-of select="//t:custEvent/@restorations"/> restorations :<xsl:value-of
                select="//t:custEvent/@subtype"/></p>
    </xsl:template>

    <xsl:template match="t:measure[. != '']">
        <xsl:value-of select="."/>
        <xsl:text> (</xsl:text>
        <xsl:value-of select="@unit"/>
        <xsl:if test="@type">
            <xsl:text>, </xsl:text>
            <xsl:value-of select="@type"/>
        </xsl:if>
        <xsl:text>) </xsl:text>
    </xsl:template>

    <xsl:template match="t:hi">
        <xsl:choose>
            <xsl:when test="@type = 'apices'">
                <sup>
                    <xsl:value-of select="."/>
                </sup>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="t:ab | t:desc[parent::t:handNote]">
        <p>
            <xsl:if test="@type">
                <b>
                    <xsl:value-of select="@type"/>
                </b>
                <xsl:text>: </xsl:text>
            </xsl:if>
            <xsl:apply-templates/>
        </p>

    </xsl:template>

    <xsl:template match="t:textLang">
        <xsl:variable name="curlang" select="@mainLang"/>
        <p>
            <b>Language of text: </b>
            <xsl:value-of select="//t:language[@ident = $curlang]"/>
        </p>

    </xsl:template>

    <xsl:template match="t:layoutDesc">
        <h3>Layout <xsl:if test="./ancestor::t:msPart"><xsl:variable
            name="currentMsPart">
            <a href="{./ancestor::t:msPart/@xml:id}"><xsl:value-of
                select="./ancestor::t:msPart/@xml:id"/></a></xsl:variable> of
            <xsl:value-of select="$currentMsPart"/></xsl:if></h3>
        <xsl:for-each select=".//t:layout[t:dimensions]">
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
            </div>
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

        <xsl:if test=".//t:ab[@type != 'pricking' or 'ruling']">
            <h3>Other <xsl:if test="./ancestor::t:msPart"><xsl:variable
                name="currentMsPart">
                <a href="{./ancestor::t:msPart/@xml:id}"><xsl:value-of
                    select="./ancestor::t:msPart/@xml:id"/></a></xsl:variable> of
                <xsl:value-of select="$currentMsPart"/></xsl:if></h3>
            <ul>
                <xsl:for-each select=".//t:ab[@type != 'pricking' or 'ruling']">
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
        <xsl:for-each select=".//t:handNote">
            <h4>
                <xsl:attribute name="id">
                    <xsl:value-of select="@xml:id"/>
                </xsl:attribute> Hand <xsl:value-of select="substring-after(@xml:id, 'h')"/>
            </h4>
            <p><xsl:value-of select="@script"/>: <xsl:value-of select="t:ab[@type = 'script']"/></p>
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

    <xsl:template match="t:additions">

        <div id="additiones">
            <h2>Additiones <xsl:if test="./ancestor::t:msPart"><xsl:variable
                name="currentMsPart">
                <a href="{./ancestor::t:msPart/@xml:id}"><xsl:value-of
                    select="./ancestor::t:msPart/@xml:id"/></a></xsl:variable> of
                <xsl:value-of select="$currentMsPart"/></xsl:if></h2>
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
            <xsl:if test="t:note">
                <p>
                    <xsl:apply-templates select="t:note"/>
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
                        <xsl:if test="t:listBibl">
                            <xsl:apply-templates select="t:listBibl"/>
                        </xsl:if>
                    </li>
                </xsl:for-each>
            </ol>
            <xsl:if test="//t:item[contains(@xml:id, 'e')]">
                <h3>Extras <xsl:if test="./ancestor::t:msPart"><xsl:variable
                    name="currentMsPart">
                    <a href="{./ancestor::t:msPart/@xml:id}"><xsl:value-of
                        select="./ancestor::t:msPart/@xml:id"/></a></xsl:variable> of
                    <xsl:value-of select="$currentMsPart"/></xsl:if></h3>
                <ol>
                    <xsl:for-each select="//t:item[contains(@xml:id, 'e')]">
                        <li>
                            <xsl:apply-templates/>
                        </li>
                    </xsl:for-each>
                </ol>
            </xsl:if>
        </div>

    </xsl:template>




    <xsl:template match="t:decoDesc">
        <div id="deco">
            <h2>Decoration <xsl:if test="./ancestor::t:msPart"><xsl:variable
                name="currentMsPart">
                <a href="{./ancestor::t:msPart/@xml:id}"><xsl:value-of
                    select="./ancestor::t:msPart/@xml:id"/></a></xsl:variable> of
                <xsl:value-of select="$currentMsPart"/></xsl:if></h2>
            <xsl:text>In this manuscript there are </xsl:text>
            <xsl:for-each
                select="//t:decoNote[not(ancestor::t:binding)][generate-id() = generate-id(key('decotype', @type)[1])]">
                <xsl:value-of
                    select="concat(' ', count(key('decotype', ./@type)), ' notes about ', ./@type)"/>
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
            <p>
                <xsl:apply-templates select="//t:decoDesc/t:summary"/>
            </p>

            <xsl:for-each select="//t:decoNote[not(ancestor::t:binding)][@type = 'frame']">
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

            <xsl:for-each select="//t:decoNote[not(ancestor::t:binding)][@type = 'miniature']">
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
            <xsl:for-each
                select="//t:decoNote[not(ancestor::t:binding)][@type != 'miniature'][@type != 'frame']">
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
            
        </div>
    </xsl:template>


</xsl:stylesheet>
