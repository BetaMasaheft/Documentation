<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" 
    
    version="2.0">
<!--    all works that have been linked to? with links to the mss / persons etc from where they are linked-->
    <xsl:variable name="collection" select="collection('../../Manuscripts')"/>
    <xsl:template match="/">
        <ul>
            <xsl:for-each select="$collection//t:title">
        <li><xsl:value-of select="@corresp"/></li>        
        
        </xsl:for-each>
        </ul>
    </xsl:template>
    
</xsl:stylesheet>