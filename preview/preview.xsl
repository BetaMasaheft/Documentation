<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" 
    exclude-result-prefixes="xs" version="2.0">
    
    <xsl:output method="html" indent="yes"/>
    
    <xsl:key name="decotype" match="//t:decoDesc//t:decoNote" use="@type"/>
    <xsl:key name="additiontype" match="//t:item[contains(@xml:id, 'a')]/t:desc" use="@type"/>


    <xsl:template match="/">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html"/>
                <meta charset="utf-8"/>
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
                    
                    <style type="text/css">
                        #BetMesRelView {
                        width: 100%;
                        height: 1000px;
                        border: 1px solid lightgray;
                        }
                    </style>
                    
                </xsl:if>
                <style>
                    sup { 
                    vertical-align: super;
                    font-size: smaller;
                    }
                    header {
                    background-color:black;
                    color:white;
                    text-align:center;
                    padding:5px; 
                    }
                    nav {
                    line-height:20px;
                    background-color:#eeeeee;
                    width:20%;
                    height: 500px;
                    overflow : scroll;
                    float:left;
                    padding:5px; 
                    }
                    section {
                    width:75%;
                    padding:20px; 
                    float:right;
                    }
                    footer {
                    background-color:black;
                    color:white;
                    clear:both;
                    padding:5px; 
                    }
                    table{
                        border-collapse: separate;
                        border-top: 3px
                    }
                    td{
                        margin: 0;
                        border: 3px;
                        border-top-width: 0px;
                        white-space: nowrap;
                    }
                    div.report{
                        background-color: red;
                    }
                    div.collation{
                    overflow-x: scroll;
                        margin-left: 5em;
                        overflow-y: visible;
                        padding-bottom: 1px;
                        padding-left: 5px;
                    }
                    .headcol{
                        position: absolute;
                        padding-left: 10px;
                        width: 5em;
                        left: 0;
                        top: auto;
                        border-right: 0px none black;
                        border-top-width: 3px; /*only relevant for first row*/
                        margin-top: -3px; /*compensate for top border*/
                    }</style>

            </head>
            <body>
                <header><h1>
                        <xsl:value-of
                            select="//t:titleStmt/t:title[1]"/>
                    </h1></header>
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
                    
                    
                    <xsl:otherwise><p style="font-size: xx-large; color:red;
                        text-align:center;">THIS FILE HAS NO TYPE! <br/>Please VALIDATE agains <a href="https://raw.githubusercontent.com/SChAth/schema/master/tei-betamesaheft.rng">the schema</a> before attempting to Transform if you want to see something</p></xsl:otherwise>
                </xsl:choose>
            </body>
        </html>
    </xsl:template>







   


<!--named structure templates-->
    <xsl:include href="mss.xsl"/>
    <xsl:include href="placeInstit.xsl"/> <!--includes leaflet javascript-->
    <xsl:include href="Person.xsl"/>
    <xsl:include href="Work.xsl"/>
    
    
<!-- elements templates-->
    <xsl:include href="locus.xsl"/>
    <xsl:include href="bibl.xsl"/>
    <xsl:include href="origin.xsl"/>
    <xsl:include href="date.xsl"/>
    <xsl:include href="editorKey.xsl"/>
    <xsl:include href="change.xsl"/>
    <xsl:include href="msselements.xsl"/> <!--includes a series of small templates for elements in manuscript entities-->
    
<!--    elements with references-->
    <xsl:include href="ref.xsl"/>
    <xsl:include href="persName.xsl"/>
    <xsl:include href="placeName.xsl"/><!-- includes also region, country and settlement-->
    <xsl:include href="title.xsl"/>
    <xsl:include href="repo.xsl"/>
    <xsl:include href="relation.xsl"/> <!--produces also the javascript for graph-->
    









</xsl:stylesheet>
