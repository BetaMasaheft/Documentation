<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:funct="my.funct"
    xmlns:t="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all" version="2.0"> 
    <xsl:template match="/">
<html version="XHTML+RDFa 1.1">
    <head>
        <title>PREVIEW of <xsl:value-of select="//t:title[parent::t:titleStmt][1]"/></title>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
        <link rel="stylesheet" href="https://raw.githubusercontent.com/BetaMasaheft/BetMas/master/BetMas/resources/css/w3local.css"/>
    </head>
    <body>
        <xsl:apply-templates/>
    </body>
    <script type="text/javascript" src="https://raw.githubusercontent.com/BetaMasaheft/BetMas/master/BetMas/resources/js/titles.js"></script>
    <script type="text/javascript" src="https://raw.githubusercontent.com/BetaMasaheft/BetMas/master/BetMas/resources/js/NewBiblio.js"></script>
    <script type="text/javascript" src="https://raw.githubusercontent.com/BetaMasaheft/BetMas/master/BetMas/resources/js/PointsHere.js"></script>
</html>
    </xsl:template>
    <xsl:include href="https://raw.githubusercontent.com/BetaMasaheft/BetMas/master/BetMas/xslt/mss.xsl"/>
</xsl:stylesheet>
