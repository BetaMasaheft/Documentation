<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml"  
    exclude-result-prefixes="#all"
    version="2.0">
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
    
</xsl:stylesheet>