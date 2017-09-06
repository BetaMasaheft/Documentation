<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml" 
    exclude-result-prefixes="#all" version="2.0">
    
    <xsl:output method="html" indent="yes" />
    
    <xsl:key name="decotype" match="//t:decoNote" use="@type"/>
    <xsl:key name="additiontype" match="//t:item[contains(@xml:id, 'a')]/t:desc" use="@type"/>


    <xsl:template match="/">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>
                    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
                        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
                <title>
                    <xsl:value-of select="//t:titleStmt/t:title"/>
                </title>
                <xsl:if test="//t:TEI/@type = 'place' or 'ins'">
                    <script src="http://cdn.leafletjs.com/leaflet/v0.7.7/leaflet.js" type="text/javascript"></script>
                    <script src="https://api.mapbox.com/mapbox.js/v2.3.0/mapbox.js" type="text/javascript"></script>
                    <link href="https://api.mapbox.com/mapbox.js/v2.3.0/mapbox.css" rel="stylesheet"/>
                    <link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet/v0.7.7/leaflet.css"/>
                    <script src="https://api.mapbox.com/mapbox.js/plugins/leaflet-fullscreen/v1.0.1/Leaflet.fullscreen.min.js" type="text/javascript"></script>
                    <link href="https://api.mapbox.com/mapbox.js/plugins/leaflet-fullscreen/v1.0.1/leaflet.fullscreen.css" rel="stylesheet"/>
                </xsl:if>
                <xsl:if test="//t:relation">
                    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/vis/4.12.0/vis.min.js"></script>
                    <link href="https://cdnjs.cloudflare.com/ajax/libs/vis/4.12.0/vis.min.css" rel="stylesheet" type="text/css" />
                    
                    
                </xsl:if>
                <link href="preview.css" rel="stylesheet" type="text/css" />
                
                
            </head>
            <body>
                <div class="jumbotron text-center"><h1>
                        <xsl:value-of
                            select="//t:titleStmt/t:title[1]"/>
                    </h1></div>
                <div class="container-fluid" id="contents" data-spy="scroll" data-target="#myScrollspy" data-offset="20">
                <xsl:choose>
                    
                    <xsl:when test="//t:TEI/@type='mss'">
                        <xsl:call-template name="mss"/>
                    </xsl:when>
                    
                    <xsl:when test="//t:TEI/@type='place'">
                        <xsl:call-template name="placeInstit"/>
                    </xsl:when>
                    
                    <xsl:when test="//t:TEI/@type='ins'">
                        <xsl:call-template name="placeInstit"/>
                    </xsl:when>
                    
                    
                    <xsl:when test="//t:TEI/@type='pers'">
                        <xsl:call-template name="person"/>
                    </xsl:when>
                    
                    
                    <xsl:when test="//t:TEI/@type='work'">
                        <xsl:call-template name="Work"/>
                    </xsl:when>
                   
                    <xsl:when test="//t:TEI/@type='nar'">
                        <xsl:call-template name="nar"/>
                    </xsl:when>
                    
                    
                    <xsl:when test="//t:TEI/@type='auth'">
                        <xsl:call-template name="nar"/>
                    </xsl:when>
                    
                    <xsl:otherwise><p style="font-size: xx-large; color:red;
                        text-align:center;">THIS FILE HAS NO TYPE! <br/>Please VALIDATE agains <a href="https://raw.githubusercontent.com/SChAth/schema/master/tei-betamesaheft.rng">the schema</a> before attempting to Transform if you want to see something</p></xsl:otherwise>
                </xsl:choose></div>
            </body>
        </html>
    </xsl:template>







   


<!--named structure templates-->
    <xsl:include href="mss.xsl"/>
    <xsl:include href="placeInstit.xsl"/> <!--includes leaflet javascript-->
    <xsl:include href="Person.xsl"/>
    <xsl:include href="Work.xsl"/>
    <xsl:include href="nar.xsl"/>
    
    <!--
    <xsl:include href="certainty.xsl"/>
    <xsl:include href="locus.xsl"/>
    <xsl:include href="bibl.xsl"/>
    <xsl:include href="origin.xsl"/>
    <xsl:include href="date.xsl"/>
    <xsl:include href="msselements.xsl"/>
    <xsl:include href="dimensions.xsl"/>
    <xsl:include href="extent.xsl"/>
    <xsl:include href="foliation.xsl"/>
    <xsl:include href="material.xsl"/>
    <xsl:include href="handNote.xsl"/>
    <xsl:include href="bindingDesc.xsl"/>
    <xsl:include href="summary.xsl"/>
    <xsl:include href="msItem.xsl"/>
    <xsl:include href="colophon.xsl"/>
    <xsl:include href="condition.xsl"/>
    <xsl:include href="layoutDesc.xsl"/>
    <xsl:include href="additions.xsl"/>
    <xsl:include href="decoDesc.xsl"/>-->
    <xsl:include href="collation.xsl"/>
    <xsl:include href="collationstep1.xsl"/>
    <!--<xsl:include href="collationstep2.xsl"/>
    <xsl:include href="collationstep3.xsl"/>
    <xsl:include href="collationstep4.xsl"/>
    <xsl:include href="collationdiagrams.xsl"/>
    <xsl:include href="VARIAsmall.xsl"/>
    <xsl:include href="faith.xsl"/>
    <xsl:include href="provenance.xsl"/>
    <xsl:include href="handDesc.xsl"/>
    <xsl:include href="msContents.xsl"/>
    <xsl:include href="history.xsl"/>
    <xsl:include href="divEdition.xsl"/>-->
    
    <!--        elements with references-->
   <!-- <xsl:include href="ref.xsl"/>
    <xsl:include href="persName.xsl"/>
    <xsl:include href="placeName.xsl"/>
    <!-\- includes also region, country and settlement-\->
    <xsl:include href="title.xsl"/>
    <xsl:include href="repo.xsl"/>
-->







</xsl:stylesheet>
