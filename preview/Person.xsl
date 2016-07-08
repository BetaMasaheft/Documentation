<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml"  exclude-result-prefixes="xs" version="2.0">

    <xsl:template name="person">
        <nav class="col-md-2">
            <ul class="nav nav-pills nav-stacked"  id="navig"> Navigate section <li><a href="#general">general</a></li>
                <li><a href="#description">Description</a></li>
                <li><a href="#history">History</a></li>
                <li><a href="#relations">Relations</a></li>
                <li><a href="#bibliography">Bibliography</a></li>
            </ul>

        </nav><div  class="container-fluid col-md-10">
            
            <div class="row-fluid"   id="general">
            <p>
                <xsl:if test="//t:msIdentifier/t:altIdentifier">
                    <xsl:for-each select="//t:msIdentifier/t:altIdentifier">
                        <xsl:sort/>
                        <xsl:value-of select="concat(., ' ')"/>
                    </xsl:for-each>
                </xsl:if>
            </p>
            <p>Edited by <xsl:apply-templates
                    select="//t:titleStmt/t:editor[not(@role = 'generalEditor')]/@key"/><xsl:if
                    test="//t:publicationStmt/t:date">on <xsl:value-of
                        select="format-date(//t:publicationStmt/t:date, '[D].[M].[Y]')"
                /></xsl:if></p>
        </div>


            <div class="row-fluid"   id="description">
            <h2>Names</h2>
            <xsl:choose><xsl:when test="//t:personGrp">
                <h1><span class="label label-secondary">Group</span></h1>
                <xsl:for-each select="//t:personGrp/t:persName">
                    <xsl:sort/>
                    <li>
                        <xsl:if test="@xml:id">
                            <xsl:attribute name="id">
                                <xsl:value-of select="@xml:id"/>
                            </xsl:attribute>
                        </xsl:if>
                        <xsl:choose>
                            <xsl:when test="@ref">
                                <a href="{@ref}" target="_blank">
                                    <xsl:value-of select="."/> <xsl:if test="@xml:lang"> (<xsl:value-of select="@xml:lang"/>)</xsl:if>
                                </a>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="."/> <xsl:if test="@xml:lang"> (<xsl:value-of select="@xml:lang"/>)</xsl:if>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:if test="@type"> (<xsl:value-of select="@type"/>)</xsl:if>
                        <xsl:if test="@corresp">
                            <sup>
                                <a href="{@corresp}">
                                    <xsl:value-of select="@xml:lang"/>
                                    <xsl:text> tr.</xsl:text>
                                </a>
                            </sup>
                        </xsl:if>
                    </li>
                </xsl:for-each>
            </xsl:when>
            
            <xsl:otherwise><xsl:for-each select="//t:person/t:persName">
                <xsl:sort/>
                <li>
                    <xsl:if test="@xml:id">
                        <xsl:attribute name="id">
                            <xsl:value-of select="@xml:id"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:choose>
                        <xsl:when test="@ref">
                            <a href="{@ref}" target="_blank">
                                <xsl:value-of select="."/> <xsl:if test="@xml:lang"> (<xsl:value-of select="@xml:lang"/>)</xsl:if>
                            </a>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="."/> <xsl:if test="@xml:lang"> (<xsl:value-of select="@xml:lang"/>)</xsl:if>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:if test="@type"> (<xsl:value-of select="@type"/>)</xsl:if>
                    <xsl:if test="@corresp">
                        <sup>
                            <a href="{@corresp}">
                                <xsl:value-of select="@xml:lang"/> 
                                <xsl:text> tr.</xsl:text>
                            </a>
                        </sup>
                    </xsl:if>
                </li>
            </xsl:for-each></xsl:otherwise></xsl:choose>
            <xsl:if test="//t:person/@sex"> <h2>Sex: <xsl:choose><xsl:when test="//t:person/@sex = 1"
                >Male</xsl:when><xsl:when test="//t:person/@sex = 2"
                    >Female</xsl:when></xsl:choose></h2></xsl:if>
            
            <xsl:if test="//t:occupation">
                <h2>Occupation: </h2>
                <xsl:for-each select="//t:occupation"><xsl:apply-templates select="."/><xsl:text> (</xsl:text><xsl:value-of select="@type"/><xsl:text>)
                </xsl:text></xsl:for-each>
            </xsl:if>
            <xsl:if test="//t:residence">
                <h2>Residence: </h2>
                <xsl:apply-templates select="//t:residence"/>
            </xsl:if>
            <xsl:if test="//t:faith">
                <h2>Faith: </h2>
                <xsl:apply-templates select="//t:faith"/>
            </xsl:if>
        </div>

            <div class="row-fluid"   id="history"> 
        
            <xsl:if test="//t:birth[node()]">
                <h2>Birth: 
                </h2>
                <xsl:apply-templates select="//t:birth"/>
               
            </xsl:if>
            <xsl:if test="//t:death[node()]">
                <h2>Death: 
                    
                </h2>
                <xsl:apply-templates select="//t:death"/>
                
            </xsl:if>
            <xsl:if test="//t:floruit[node()]">
                <h2>Floruit: 
                    </h2>
                <xsl:apply-templates select="//t:floruit"/>
                
            </xsl:if>
        </div>

        <xsl:if test="//t:listRelation">
            <div class="row-fluid"   id="relations">
                <xsl:apply-templates mode="graph" select="//t:listRelation"/>
            </div>
        </xsl:if>


            <div class="row-fluid"   id="bibliography">
            <xsl:apply-templates select="//t:listBibl"/>
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
