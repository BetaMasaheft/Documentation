<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" 
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="t:collation">
        <h3>Collation <xsl:if test="./ancestor::t:msPart"><xsl:variable
            name="currentMsPart">
            <a href="{./ancestor::t:msPart/@xml:id}"><xsl:value-of
                select="./ancestor::t:msPart/@xml:id"/></a></xsl:variable> of
            <xsl:value-of select="$currentMsPart"/></xsl:if></h3>
        
        <xsl:if test=".//t:signatures">
            <p>
                <xsl:apply-templates select=".//t:signatures"/>
            </p>
        </xsl:if>
        
        
        <div class="collation">
            
            <table>
                <tr style="background-color: lightgray;">
                    <td class="headcol">position</td>
                    <xsl:for-each select=".//t:item">
                        <xsl:sort select="position()"/>
                        <td>
                            <xsl:attribute name="id">
                                <xsl:value-of select="@xml:id"/>
                            </xsl:attribute>
                            <xsl:value-of select="position()"/>
                        </td>
                    </xsl:for-each>
                </tr>
                <tr>
                    <td class="headcol">number</td>
                    <xsl:for-each select=".//t:item">
                        <xsl:sort select="position()"/>
                        <td>
                            <xsl:apply-templates select="@n"/>
                        </td>
                    </xsl:for-each>
                </tr>
                <tr style="background-color: lightgray;">
                    <td class="headcol">leafs</td>
                    <xsl:for-each select=".//t:item">
                        <xsl:sort select="position()"/>
                        <td>
                            <xsl:apply-templates select="t:dim[@unit = 'leaf']"/>
                        </td>
                    </xsl:for-each>
                </tr>
                <tr>
                    <td class="headcol">quires</td>
                    <xsl:for-each select=".//t:item">
                        <xsl:sort select="position()"/>
                        <td>
                            <xsl:apply-templates select="t:locus"/>
                        </td>
                    </xsl:for-each>
                </tr>
                <tr>
                    <td class="headcol">description</td>
                    <xsl:for-each select=".//t:item">
                        <xsl:sort select="position()"/>
                        <td>
                            <xsl:value-of select="text()"/>
                        </td>
                    </xsl:for-each>
                </tr>
                
            </table>
        </div>
    </xsl:template>
</xsl:stylesheet>