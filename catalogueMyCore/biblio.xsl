<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:r="http://www.oxygenxml.com/ns/report"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:acl="xalan://org.mycore.access.MCRAccessManager"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
    xmlns:xlink="http://www.w3.org/1999/xlink"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="text"/>
    <xsl:variable name="mss">
        <xsl:for-each select="//r:incident/r:systemID/text()">
            
            <xsl:sequence select="document(concat('DomLib/',.))"/>
            <!--            in this step with keep in mind the path to each inscription file so that calling the variable the xslt is going to look at each of the files-->
        </xsl:for-each>
    </xsl:variable>
    
    <xsl:template match="/">
<xsl:result-document href="biblio.csv">
    <xsl:text>signature, title, work, edition/literature, record
    </xsl:text><xsl:for-each select="$mss//signature[1]/text()">
      <xsl:value-of select="."/><xsl:text>,</xsl:text>
        <xsl:for-each select="ancestor::mycoreobject//title">
            <xsl:sort/><xsl:value-of select="normalize-space(replace(., ',', ' '))"/><xsl:text>,,,
            </xsl:text><xsl:for-each select="ancestor::mycoreobject//desccontent">
                <xsl:sort/><xsl:text>,,</xsl:text><xsl:value-of select="normalize-space(replace(./text, ',', ' '))"/><xsl:text>,,
</xsl:text><xsl:for-each select="
                    tokenize(.//edition/text, '&#13;')">
                    <xsl:sort></xsl:sort>
    <xsl:text>,,,edition,</xsl:text><xsl:value-of select="normalize-space(replace(., ',', ' '))"/><xsl:text>
                    </xsl:text>
</xsl:for-each><xsl:for-each select="
    tokenize(.//literature/text, '&#13;')">
    <xsl:sort></xsl:sort>
    <xsl:text>,,,literature,</xsl:text><xsl:value-of select="normalize-space(replace(., ',', ' '))"/><xsl:text>
                    </xsl:text>
</xsl:for-each>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:for-each>
        
</xsl:result-document>
    </xsl:template>
    
</xsl:stylesheet>