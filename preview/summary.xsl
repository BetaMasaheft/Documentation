<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml"  
    exclude-result-prefixes="#all"
    version="2.0">
    <xsl:template match="t:summary">
        
        <h3>Summary<xsl:if test="./ancestor::t:msPart"><xsl:variable
            name="currentMsPart">
            <a href="{./ancestor::t:msPart/@xml:id}"><xsl:value-of
                select="./ancestor::t:msPart/@xml:id"/></a></xsl:variable> of
            <xsl:value-of select="$currentMsPart"/></xsl:if></h3>
        
        <ul class="nav nav-tabs">
            <li class="active" ><a data-toggle="tab"  href="#extracted">Extracted summary of contents</a></li>
            <li><a  data-toggle="tab" href="#given">Given summary of contents</a></li>
        </ul>
        <div class="tab-content">
            <div id="given"  class="tab-pane fade">
                <xsl:value-of select="."/>
            </div>
            <div id="extracted"  class="tab-pane fade in active">
                <ol><xsl:for-each select="//t:msItem">
                    <xsl:sort select="position()"/>
                    <ul><xsl:value-of select="@xml:id"/><xsl:text>, </xsl:text><xsl:apply-templates select="./t:title"/></ul>
                </xsl:for-each></ol>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>