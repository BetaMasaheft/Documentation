<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml"  exclude-result-prefixes="xs" version="2.0">

    <xsl:template name="placeInstit">
        <nav class="col-md-2">
            <ul class="nav nav-pills nav-stacked"  id="navig">Navigate section <li><a href="#general">General</a></li>
                <li><a href="#description">Description</a></li>
                <li><a href="#map">Map</a></li>
            </ul>
        </nav>
        <div  class="container-fluid col-md-10">
            <div class="row-fluid"   id="general">
            <p> </p>
            <p>Edited by <xsl:apply-templates
                    select="//t:titleStmt/t:editor[not(@role = 'generalEditor')]/@key"/>
                <xsl:if test="//t:publicationStmt/t:date">on <xsl:value-of
                        select="format-date(//t:publicationStmt/t:date, '[D].[M].[Y]')"
                /></xsl:if></p>
        </div>
            <div class="row-fluid"   id="description">
            <xsl:if test="//t:place[@subtype = 'institution']">
                <h1><span class="label label-success">Institution</span></h1>
            </xsl:if>

            <xsl:if test="//t:place/@type">
                <h2>Type</h2>
                <p>
                    <xsl:for-each select="//t:place/@type">
                        <xsl:value-of select="upper-case(replace(.,' ',', '))"/>
                    </xsl:for-each>
                </p>
            </xsl:if>

            <h2>Names</h2>
            <ul>
                <xsl:for-each select="//t:place/t:placeName">
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
                        <xsl:if test="@ref">
                            <sup>
                                <a href="{@ref}">
                                    <xsl:value-of select="@xml:lang"/>
                                    <xsl:text> tr.</xsl:text>
                                </a>
                            </sup>
                        </xsl:if>
                    </li>
                </xsl:for-each>
            </ul>
            <h2>Adminstrative position</h2>
            <p>
                <xsl:apply-templates select="//t:settlement"/>
            </p>
            <p>
                 <xsl:if test="//t:region">
                         <xsl:text>Regional State: </xsl:text><xsl:apply-templates select="//t:region"/>
                       
                    </xsl:if>
            </p>
            <p>
                <xsl:if test="//t:country">
                    <xsl:text>Country: </xsl:text><xsl:apply-templates select="//t:country"/>
                </xsl:if>
            </p>

           <xsl:if test="//t:ab[@type ='appellations']"> <h2>Appellations</h2>
            <p>
                <p>
                    <xsl:apply-templates select="//t:ab[@type = 'appellations']"/>
                </p>
            </p></xsl:if>

            <h2>History</h2>
            <h3>Foundation</h3>
            <p>
                <b>Date of foundation: </b>
                <xsl:value-of select="//t:date[@type = 'foundation']"/>
            </p>
            <p>
                <xsl:apply-templates select="//t:desc[@type = 'foundation']"/>
            </p>
            <h3>History</h3>
            <p>
                <xsl:apply-templates select="//t:ab[@type = 'history']"/>
            </p>
            <xsl:if test="//t:ab[@type = 'tabot']">
                <h3>Tabots</h3>
                <p>
                    <xsl:apply-templates select="//t:ab[@type = 'tabot']"/>
                </p>
            </xsl:if>
            <h2>Bibliography</h2>
            <xsl:apply-templates select="//t:listBibl"/>

            <h2>Other information</h2>
            <p>
                <xsl:apply-templates select="//t:ab[@type = 'description']"/>
            </p>
        </div>

            <div class="row-fluid"  id="map">
            <xsl:if test="matches(//t:geo/text(), '\d+')">
                <div id="map" style="width: 100%; height: 400px"/>
                <script type="text/javascript">
                    var mymap = L.map('map').setView([<xsl:value-of select="substring-before(//t:geo, ' ')"/>, <xsl:value-of select="substring-after(//t:geo, ' ')"/>], 10);
                        L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoicGlldHJvbGl1enpvIiwiYSI6ImNpbDB6MjE0bDAwOGl4MW0wa2JvMDd0cHMifQ.wuV3-VuvmCzY69kWRf6CHA', {
                        maxZoom: 18,
                        attribution: 'Map data <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, ' +
                        '<a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
                        'Imagery © <a href="http://mapbox.com">Mapbox</a>',
                        id: 'mapbox.streets'
                        }).addTo(mymap);
                        L.marker([<xsl:value-of select="substring-before(//t:geo, ' ')"/>, <xsl:value-of select="substring-after(//t:geo, ' ')"/>]).addTo(mymap).bindPopup("<xsl:value-of select="//t:placeName[not(@type)]"/>, altitude: <xsl:value-of select="//t:height"/>m").openPopup();
                    </script>
            </xsl:if>
        </div>
            <div class="row-fluid"  >
            <xsl:apply-templates select="//t:listRelation" mode="graph"/>
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
