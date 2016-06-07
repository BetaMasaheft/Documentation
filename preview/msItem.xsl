<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" 
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="t:msItem[parent::t:msContents]">
                <div class="container">
                    <xsl:attribute name="id">
                        <xsl:value-of select="@xml:id"/>
                    </xsl:attribute>
                    <button type="button" class="btn btn-info" data-toggle="collapse"
                        data-target="#item{@xml:id}">expand/collapse</button>
                    <h3>Item <xsl:value-of select="@xml:id"/></h3>
                    
                    <div id="item{@xml:id}" class="collapse">
                        <xsl:apply-templates/>
                        
                    </div>
                </div>
                <hr/>
    </xsl:template>
    
    <xsl:template match="t:msItem[parent::t:msItem]">
            <div style="padding-left: 50px;">
                    <xsl:attribute name="id">
                        <xsl:value-of select="@xml:id"/>
                    </xsl:attribute>
                    <hr style="border-top: dotted 1px;"/>
                    
                    
                    <h4>Item <xsl:value-of select="@xml:id"/></h4>
                    
                    <div>
                        <xsl:apply-templates/>
                        
                    </div>
                </div>
    </xsl:template>
    
</xsl:stylesheet>