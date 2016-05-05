<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="2.0">

    <xsl:template name="placeInstit">
        <nav>
            <ul> Navigate section <li><a href="#general">General</a></li>
                <li><a href="#description">Description</a></li>
                <li><a href="#map">Map</a></li>
            </ul>
        </nav>
        <section id="general">
            <p> </p>
            <p>Edited by <xsl:value-of
                    select="//t:titleStmt/t:editor[not(@role = 'generalEditor')]/@key"/> on
                    <xsl:value-of
                    select="format-dateTime(//t:publicationStmt/t:date, '[D].[M].[Y]')"/></p>
        </section>
        <section id="description">
            <xsl:if test="//t:place[@subtype='institution']"><p align="right" style="font-size:xx-large;">Institution</p></xsl:if>
            
            <xsl:if test="//t:place/@type"><h2>Type</h2>
            <p>    <xsl:for-each select="//t:place/@type">
                    <xsl:value-of select="."/>
                </xsl:for-each>
            </p></xsl:if>
            
            <h2>Names</h2>
            <ul>
                <xsl:for-each select="//t:placeName">
                    <xsl:sort></xsl:sort>
                   <li> <xsl:value-of select="."/>
                    <xsl:if test="@type"> (<xsl:value-of select="@type"/>)</xsl:if></li>
                </xsl:for-each>
            </ul>
            <h2>Adminstrative position</h2>
            <p><xsl:value-of select="//t:settlement"/> <xsl:if test="//t:country"><xsl:text> is part of </xsl:text><xsl:if test="//t:region/text()"><xsl:value-of select="//t:region"/><xsl:text>, in </xsl:text></xsl:if><xsl:value-of select="//t:country"/></xsl:if>
            </p>
            
            <h2>Appellations</h2>
            <p><p><xsl:apply-templates select="//t:ab[@type='appellations']"/></p></p>
            
            <h2>History</h2>
            <h3>Foundation</h3>
            <p><b>Date of foundation: </b><xsl:value-of select="//t:date[@type='foundation']"/></p>
            <p><xsl:apply-templates select="//t:desc[@type='foundation']"/></p>
            <h3>History</h3>
            <p>
                <xsl:apply-templates select="//t:ab[@type='history']"/>
            </p>
            
            <h2>Bibliography</h2>
            <xsl:apply-templates select="//t:listBibl"/>
            
            <h2>Other information</h2>
            <p>
                <xsl:apply-templates select="//t:ab[@type='description']"/>
            </p> 
        </section>

        <section id="map">
            <xsl:if test="matches(//t:geo/text(), '\d+')">
                <div id="map" style="width: 100%; height: 400px"/>
                <script type="text/javascript">
                        var mymap = L.map('map').setView([9.189, 40.496], 13);
                        L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoicGlldHJvbGl1enpvIiwiYSI6ImNpbDB6MjE0bDAwOGl4MW0wa2JvMDd0cHMifQ.wuV3-VuvmCzY69kWRf6CHA', {
                        maxZoom: 18,
                        attribution: 'Map data <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, ' +
                        '<a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
                        'Imagery © <a href="http://mapbox.com">Mapbox</a>',
                        id: 'mapbox.streets'
                        }).addTo(mymap);
                        L.marker([<xsl:value-of select="substring-before(//t:geo, ' ')"/>, <xsl:value-of select="substring-after(//t:geo, ' ')"/>]).addTo(mymap).bindPopup("<xsl:value-of select="//t:placeName[not(@type)]"/>").openPopup();
                    </script>
            </xsl:if>
        </section>
        <footer id="footer">
            <h2>Authors</h2>
            <ul>
                <xsl:for-each select="//t:change">
                    <xsl:sort select="count(distinct-values(@who))"/>
                    <li>
                        <xsl:value-of select="@who"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="."/>
                        <xsl:text> </xsl:text>
                        <xsl:variable name="date">
                            <xsl:choose>
                                <xsl:when test="contains(@when, 'T')">
                                    <xsl:value-of select="substring-before(@when, 'T')"/>
                                </xsl:when>
                                <xsl:when test="contains(@when, '+')">
                                    <xsl:value-of select="substring-before(@when, '+')"/>
                                </xsl:when>
                                
                                <xsl:otherwise><xsl:value-of select="@when"/></xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <xsl:value-of select="format-date($date, '[D].[M].[Y]')"/>
                    </li>
                </xsl:for-each>
            </ul>
        </footer>
    </xsl:template>
</xsl:stylesheet>
