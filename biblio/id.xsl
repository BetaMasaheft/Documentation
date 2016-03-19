<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:z="http://www.zotero.org/namespaces/export#" xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:foaf="http://xmlns.com/foaf/0.1/" xmlns:bib="http://purl.org/net/biblio#"
    xmlns:dcterms="http://purl.org/dc/terms/" xmlns:vcard="http://nwalsh.com/rdf/vCard#"
    xmlns:prism="http://prismstandard.org/namespaces/1.2/basic/" 
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template name="id">
        <xsl:variable name="authorEditor">
            <xsl:choose>
                <xsl:when test="./t:analytic/t:author[1]/t:name[1]/t:surname[1]"><xsl:value-of select="./t:analytic/t:author[1]/t:name[1]/t:surname[1]"/></xsl:when>
                <xsl:otherwise>
                    <xsl:choose>
                        <xsl:when test="./t:analytic/t:editor[1]/t:name[1]/t:surname[1]">
                            <xsl:value-of select="./t:analytic/t:editor[1]/t:name[1]/t:surname[1]"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:choose>
                                <xsl:when test="./t:monogr/t:author[1]/t:name[1]/t:surname[1]"><xsl:value-of select="./t:monogr/t:author[1]/t:name[1]/t:surname[1]"/></xsl:when>
                                <xsl:otherwise>
                                    <xsl:choose><xsl:when test="./t:monogr/t:editor[1]/t:name[1]/t:surname[1]"><xsl:value-of select="./t:monogr/t:editor[1]/t:name[1]/t:surname[1]"/></xsl:when>
                                        <xsl:otherwise><xsl:value-of select="substring-before(.//title[1],' ')"/></xsl:otherwise></xsl:choose>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="date">
            <xsl:choose>			
                <xsl:when test="contains(.//t:date,',')">
                    <xsl:value-of select="substring-before(.//t:date, ',')"/>
                </xsl:when>
                <xsl:otherwise><xsl:value-of select=".//t:date"/></xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="id"
            select="concat($authorEditor, $date, '-', generate-id())"/>
        <xsl:attribute name="rdf:about">
            <xsl:value-of select="$id"/>
        </xsl:attribute>
        
    </xsl:template>
</xsl:stylesheet>