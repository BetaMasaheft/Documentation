<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml"  exclude-result-prefixes="xs" version="2.0">
    
    
    <xsl:template match="t:relation" mode="reltable">
        <tr>
            <th>
                <xsl:value-of select="@active"/>
            </th>
            <th>
                <xsl:value-of select="@name"/>
            </th>
            <th>
                <xsl:value-of select="@passive"/>
            </th>
<th>
<xsl:apply-templates/>
</th>
        </tr>
    </xsl:template>


    <xsl:template match="t:desc">
        <xsl:apply-templates select="."/>
    </xsl:template>
</xsl:stylesheet>
