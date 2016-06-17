<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="#all"
    version="2.0">
    
    <xsl:output encoding="UTF-8" method="xml"/>
    <xsl:output indent="yes"/>
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
   
    <xsl:template match="t:physDesc">
        <xsl:copy>
            
            <xsl:choose>
                <!--if there is content in rubric-->
                <xsl:when test="//t:rubric/text()">
                    <xsl:choose>
<!--                        if a decoNote already exists-->
                <xsl:when test="./t:decoDesc">
<!--                    call template which copies all and add a deconote with the content of rubric-->
                    <xsl:apply-templates/>
                </xsl:when>
                <xsl:otherwise> 
<!--                    if a decoNote does not exist, create one and copy in it rubric-->
                    <xsl:apply-templates/>
                    <decoDesc>
                        <decoNote type="rubrication" xml:id="d0"><xsl:value-of select="//t:rubric"/></decoNote>
                       
                    </decoDesc>
                </xsl:otherwise>
            </xsl:choose>
            </xsl:when>
<!--                if none of the above, copy all-->
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
            </xsl:choose>
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template match="t:decoDesc">
        <xsl:copy>
    <decoNote type="rubrication" xml:id="d0"><xsl:value-of select="//t:rubric"/></decoNote>
    <xsl:apply-templates/>
        </xsl:copy>
        
    </xsl:template>

    <xsl:template match="t:rubric"/>
    
</xsl:stylesheet>