<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml" exclude-result-prefixes="#all" version="2.0">

    <xsl:template name="mss">

        <nav class="col-md-2">
            <ul class="nav nav-pills nav-stacked" id="navig">
                <li class="active">
                    <h3>Navigate section</h3>
                    <ul class="nav nav-pills nav-stacked" id="myScrollspy">
                        <li class="active">
                            <a href="#general">General</a>
                        </li>
                        <li>
                            <a href="#description">Description</a>
                        </li>
                        <li>
                            <a href="#generalphysical">Physical desc of ms</a>
                        </li>
                        <xsl:if test="//t:msPart">
                            <ul>
                                <xsl:for-each select="//t:msPart">
                                    <li>
                                        <a href="#{@xml:id}">Part <xsl:value-of select="@xml:id"
                                            /></a>
                                    </li>
                                </xsl:for-each>
                            </ul>
                        </xsl:if>
                        <xsl:if test="//t:additional//t:listBibl">
                            <li>
                                <a href="#catalogue">Catalogue</a>
                            </li>
                        </xsl:if>
                        <xsl:if test="//t:term">
                            <li>
                                <a href="#keywords">Keywords</a>
                            </li>
                        </xsl:if>
                        <xsl:if test="//t:body[t:div]">
                            <li>
                                <a href="#transcription">Transcription </a>
                            </li>
                        </xsl:if>
                        <xsl:if test="//t:listBibl[@type = 'relations']">
                            <li>
                                <a href="#relations">Relations</a>
                            </li>
                        </xsl:if>
                        <li>
                            <a href="#footer">Authors</a>
                        </li>
                    </ul>
                </li>



                <li>
                    <h3>Navigate by id</h3>
                    <ul class="nav nav-pills nav-stacked">
                        <xsl:for-each select="//*[not(self::t:TEI)][@xml:id]">
                            <xsl:sort select="position()"/>
                            <li>
                                <a href="#{@xml:id}">
                                    <xsl:choose>
                                        <xsl:when
                                            test="contains(@xml:id, 't') and matches(@xml:id, '\w\d+')"
                                            >Title <xsl:value-of
                                                select="substring-after(@xml:id, 't')"/><xsl:if
                                                test="./ancestor::t:msPart"><xsl:variable
                                                  name="currentMsPart"><xsl:value-of
                                                  select="./ancestor::t:msPart/@xml:id"
                                                  /></xsl:variable> of <xsl:value-of
                                                  select="$currentMsPart"/></xsl:if></xsl:when>
                                        <xsl:when
                                            test="contains(@xml:id, 'b') and matches(@xml:id, '\w\d+')"
                                            >Binding <xsl:value-of
                                                select="substring-after(@xml:id, 'b')"/><xsl:if
                                                test="./ancestor::t:msPart"><xsl:variable
                                                  name="currentMsPart"><xsl:value-of
                                                  select="./ancestor::t:msPart/@xml:id"
                                                  /></xsl:variable> of <xsl:value-of
                                                  select="$currentMsPart"/></xsl:if></xsl:when>
                                        <xsl:when
                                            test="contains(@xml:id, 'a') and matches(@xml:id, '\w\d+')"
                                            >Addition <xsl:value-of
                                                select="substring-after(@xml:id, 'a')"/><xsl:if
                                                test="./ancestor::t:msPart"><xsl:variable
                                                  name="currentMsPart"><xsl:value-of
                                                  select="./ancestor::t:msPart/@xml:id"
                                                  /></xsl:variable> of <xsl:value-of
                                                  select="$currentMsPart"/></xsl:if></xsl:when>
                                        <xsl:when
                                            test="contains(@xml:id, 'e') and matches(@xml:id, '\w\d+')"
                                            >Extra <xsl:value-of
                                                select="substring-after(@xml:id, 'e')"/><xsl:if
                                                test="./ancestor::t:msPart"><xsl:variable
                                                  name="currentMsPart"><xsl:value-of
                                                  select="./ancestor::t:msPart/@xml:id"
                                                  /></xsl:variable> of <xsl:value-of
                                                  select="$currentMsPart"/></xsl:if></xsl:when>
                                        <xsl:when
                                            test="contains(@xml:id, 'i') and matches(@xml:id, '_\w\d+')"
                                            >Content Item <xsl:value-of
                                                select="substring-after(@xml:id, 'i')"/><xsl:if
                                                test="./ancestor::t:msPart"><xsl:variable
                                                  name="currentMsPart"><xsl:value-of
                                                  select="./ancestor::t:msPart/@xml:id"
                                                  /></xsl:variable> of <xsl:value-of
                                                  select="$currentMsPart"/></xsl:if></xsl:when>
                                        <xsl:when
                                            test="contains(@xml:id, 'q') and matches(@xml:id, '\w\d+')"
                                            >Quire <xsl:value-of
                                                select="substring-after(@xml:id, 'q')"/><xsl:if
                                                test="./ancestor::t:msPart"><xsl:variable
                                                  name="currentMsPart"><xsl:value-of
                                                  select="./ancestor::t:msPart/@xml:id"
                                                  /></xsl:variable> of <xsl:value-of
                                                  select="$currentMsPart"/></xsl:if></xsl:when>
                                        <xsl:when test="contains(@xml:id, 'coloph')">Colophon
                                                <xsl:value-of
                                                select="substring-after(@xml:id, 'coloph')"/><xsl:if
                                                test="./ancestor::t:msPart"><xsl:variable
                                                  name="currentMsPart"><xsl:value-of
                                                  select="./ancestor::t:msPart/@xml:id"
                                                  /></xsl:variable> of <xsl:value-of
                                                  select="$currentMsPart"/></xsl:if></xsl:when>
                                        <xsl:when
                                            test="contains(@xml:id, 'h') and matches(@xml:id, '\w\d+')"
                                            >Hand <xsl:value-of
                                                select="substring-after(@xml:id, 'h')"/><xsl:if
                                                test="./ancestor::t:msPart"><xsl:variable
                                                  name="currentMsPart"><xsl:value-of
                                                  select="./ancestor::t:msPart/@xml:id"
                                                  /></xsl:variable> of <xsl:value-of
                                                  select="$currentMsPart"/></xsl:if></xsl:when>
                                        <xsl:when test="contains(@xml:id, 'div')">Divider
                                                <xsl:value-of
                                                select="substring-after(@xml:id, 'div')"/><xsl:if
                                                test="./ancestor::t:msPart"><xsl:variable
                                                  name="currentMsPart"><xsl:value-of
                                                  select="./ancestor::t:msPart/@xml:id"
                                                  /></xsl:variable> of <xsl:value-of
                                                  select="$currentMsPart"/></xsl:if></xsl:when>
                                        <xsl:when
                                            test="contains(@xml:id, 'd') and matches(@xml:id, '\w\d+')"
                                            >Decoration <xsl:value-of
                                                select="substring-after(@xml:id, 'd')"/><xsl:if
                                                test="./ancestor::t:msPart"><xsl:variable
                                                  name="currentMsPart"><xsl:value-of
                                                  select="./ancestor::t:msPart/@xml:id"
                                                  /></xsl:variable> of <xsl:value-of
                                                  select="$currentMsPart"/></xsl:if></xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="name()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </a>
                            </li>
                        </xsl:for-each>
                    </ul>
                </li>
            </ul>
        </nav>
        <div class="container-fluid col-md-10">
            <div class="row-fluid" id="general">

                <xsl:apply-templates select="//t:msIdentifier" mode="title"/>

                <p>Edited by <xsl:apply-templates
                        select="//t:titleStmt/t:editor[not(@role = 'generalEditor')]/@key"/>
                    <xsl:if test="//t:publicationStmt/t:date"><xsl:text> on </xsl:text><xsl:value-of
                            select="format-dateTime(//t:publicationStmt/t:date, '[D].[M].[Y]')"
                        /></xsl:if></p>
            </div>
            <div class="row-fluid" id="description">
                <xsl:if
                    test="//t:date[@evidence = 'internal-date'] or //t:origDate[@evidence = 'internal-date']">
                    <h1>
                        <span class="label label-primary">Dated</span>
                    </h1>
                </xsl:if>
                <h2>General description</h2>


                <xsl:if test="//t:listPerson/t:person">
                    <h3>People</h3>
                    <xsl:for-each select="//t:listPerson/t:person">
                        <p>
                            <xsl:apply-templates/>
                        </p>
                    </xsl:for-each>
                </xsl:if>


                <h3>Number of Text units: <xsl:value-of
                        select="count(//t:msItem[contains(@xml:id, 'i')])"/></h3>
                <h3>Number of Codicological units: <xsl:choose>
                        <xsl:when test="//t:msPart"><xsl:value-of select="count(//t:msPart)"/>
                        </xsl:when>
                        <xsl:otherwise>1</xsl:otherwise>
                    </xsl:choose></h3>
            </div>


            <div class="row-fluid" id="generalphysical">
                <xsl:apply-templates select="//t:msDesc"/>

            </div>



            <xsl:if test="//t:additional//t:listBibl">
                <div class="row-fluid" id="catalogue">
                    <xsl:for-each select="//t:additional//t:listBibl">
                        <xsl:if test="./ancestor::t:msPart">
                            <h2>
                                <xsl:variable name="currentMsPart">
                                    <xsl:value-of select="./ancestor::t:msPart/@xml:id"/>
                                </xsl:variable>
                                <xsl:value-of select="$currentMsPart"/>
                            </h2>
                        </xsl:if>
                        <xsl:apply-templates select="."/>
                    </xsl:for-each>
                </div>
            </xsl:if>

            <xsl:if test="//t:body[t:div]">
                <div class="row-fluid well" id="transcription">
                    <xsl:apply-templates select="//t:text"/>
                </div>
            </xsl:if>

            <xsl:if test="//t:term">
                <div class="row-fluid" id="keywords">
                    <h2>Keywords</h2>
                    <ul>
                        <xsl:for-each select="//t:term">
                            <li>
                                <xsl:value-of select="@key"/>
                            </li>
                        </xsl:for-each>
                    </ul>
                </div>
            </xsl:if>


            <xsl:if test="//t:listBibl[@type = 'relations']">
                <div class="row-fluid" id="relations">
                    <table>
                        <caption>Relations of this Entity with other entities</caption>
                        <thead>
                            <tr>
                                <th>Subject</th>
                                <th>Relation</th>
                                <th>Object</th>
                            </tr>
                        </thead>
                        <xsl:apply-templates mode="reltable"
                            select="//t:listBibl[@type = 'relations']"/>
                    </table>
                    <xsl:apply-templates mode="graph" select="//t:listBibl[@type = 'relations']"/>
                </div>
            </xsl:if>
        </div>
        <script>
            $(document).ready(function(){
            $('[data-toggle="popover"]').popover();
            });
            $(document).ready(function(){
            $('[data-toggle="tooltip"]').tooltip(); 
            });
        </script>
        <footer id="footer" class="col-md-12">
            <h2>Authors</h2>
            <ul>
                <xsl:apply-templates select="//t:revisionDesc"/>
            </ul>
        </footer>
    </xsl:template>
</xsl:stylesheet>
