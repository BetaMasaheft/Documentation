<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:t="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:template match="t:msContents">
        <div id="contents">
            <xsl:apply-templates select="node() except t:summary"/>
        </div>
    </xsl:template>
</xsl:stylesheet>