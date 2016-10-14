<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml"  
    exclude-result-prefixes="xs" version="2.0">

    <xsl:template name="Work">
        <nav class="col-md-2">
            <ul class="nav nav-pills nav-stacked"  id="navig">
               Navigate section <li><a href="#general">General</a></li>
                <li><a href="#description">Description</a></li>
                <xsl:if test="//t:body[t:div]">
                    <li><a href="#transcription">Transcription
                    </a></li>
                </xsl:if>
                <li><a href="#bibliography">Bibliography</a></li>
                <li><a href="#relations">Relations</a></li>
            </ul>

        </nav>
        <div  class="container-fluid col-md-10">
            <div id="description">
            <xsl:if test="count(//t:titleStmt/t:title) gt 1">
                <h2>Titles</h2>
                <ul>
                    <xsl:for-each select="//t:titleStmt/t:title[@xml:id]">
                        <xsl:sort select="if (@xml:id) then @xml:id else text()"/>
                        <xsl:variable name="id" select="@xml:id"/>
                        <li>
                            <xsl:if test="@xml:id">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="@xml:id"/>
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:if test="@type">
                                <xsl:value-of select="concat(@type, ': ')"/>
                            </xsl:if>
                            <xsl:choose>
                                <xsl:when test="@ref">
                                    <a href="{@ref}" target="_blank">
                                        <xsl:value-of select="."/>
                                    </a>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:apply-templates/>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:if test="@xml:lang">
                                <sup>
                                    <xsl:value-of select="@xml:lang"/>
                                </sup>
                            </xsl:if>
                            <xsl:if test="//t:titleStmt/t:title[@corresp]">
                                <xsl:text> (</xsl:text>
                                <xsl:for-each select="//t:titleStmt/t:title[substring-after(@corresp, '#') = $id]">
                                    <xsl:sort/>
                                    <xsl:value-of select="."/>
                                    <xsl:if test="@xml:lang">
                                        <sup>
                                            <xsl:value-of select="@xml:lang"/>
                                        </sup>
                                    </xsl:if>
                                    <xsl:if test="position() != last()">
                                        <xsl:text>, </xsl:text>
                                    </xsl:if>
                                </xsl:for-each>
                                <xsl:text>)</xsl:text>
                            </xsl:if>
                        </li>
                    </xsl:for-each>
                    <xsl:if test="//t:titleStmt/t:title[not(@xml:id or @corresp)]">
                        <xsl:for-each select="//t:titleStmt/t:title[not(@xml:id or @corresp)]">
                            <xsl:sort/>
                            <li>
                                <xsl:if test="@type">
                                    <xsl:value-of select="concat(@type, ': ')"/>
                                </xsl:if>
                                <xsl:choose>
                                    <xsl:when test="@ref">
                                        <a href="{@ref}" target="_blank">
                                            <xsl:value-of select="."/>
                                        </a>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:apply-templates/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:if test="@xml:lang">
                                    <sup>
                                        <xsl:value-of select="@xml:lang"/>
                                    </sup>
                                </xsl:if>
                            </li>
                        </xsl:for-each>
                    </xsl:if>
                </ul>
            </xsl:if>
            <xsl:if test="//t:author">
                <h2>Author</h2>
                <ul>
                    <xsl:for-each select="//t:author">
                        <li>
                            <xsl:apply-templates/>
                        </li>
                    </xsl:for-each>
                </ul>
            </xsl:if>
            <xsl:if test="//t:abstract">
                <h2>General description</h2>
                <p>
                    <xsl:apply-templates select="//t:abstract"/>
                </p>
            </xsl:if>
            <xsl:if test="//t:creation">
                <h2>Date</h2>
                <p>
                    <xsl:apply-templates select="//t:creation"/>
                    <xsl:if test="//t:creation/@evidence">(<xsl:value-of select="//t:creation/@evidence"/>)</xsl:if>
                </p>
            </xsl:if>
            <xsl:if test="//t:listWit">
                <h2>Witnesses</h2>
                <p>This edition is based on the following manuscripts</p>
                <ul>
                    <xsl:for-each select="//t:witness">
                        <li>
                            <xsl:apply-templates select="."/>
                        </li>
                    </xsl:for-each>
                </ul>
            </xsl:if>
            <xsl:if test="//t:listBibl[not(@type='relations')]">
                <div id="bibliography">
                    <xsl:apply-templates select="//t:listBibl[not(@type='relations')]"/>
                </div>
            </xsl:if>
            <xsl:if test="//t:body[t:div[@type='edition'][t:ab or t:div[@type='textpart']]]">
                <div class="row-fluid well" id="transcription">
                    <xsl:apply-templates select="//t:text/t:body/t:div[@type='edition']"/>
                </div>
            </xsl:if>
        </div>
        </div>

        <footer id="footer">
            <h2>Authors</h2>
            <ul>
                <xsl:apply-templates select="//t:revisionDesc"/>
            </ul>
        </footer>
    </xsl:template>


</xsl:stylesheet>
