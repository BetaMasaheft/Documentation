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
    <xsl:template name="tags">
        <!--<dc:subject>
            <xsl:choose>
                <xsl:when test="./t:analytic/t:author">
                    <xsl:value-of
                        select="concat(./t:analytic/t:author[1]/t:name[1]/t:surname[1], .//t:date[1])"
                    />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:choose>
                        <xsl:when test="./t:monogr/t:author">
                            <xsl:value-of
                                select="concat(./t:monogr/t:author/t:name[1]/t:surname[1], .//t:date[1])"
                            />
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="concat(./t:monogr/t:author, .//t:date[1])"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>
        </dc:subject>-->
        
        <!--<xsl:if test="./t:ref[@type = 'quoted_in']">
            <xsl:choose>
                <xsl:when test="contains(./t:ref[@type = 'quoted_in'], ';')">
                    <xsl:for-each select="tokenize(./t:ref[@type = 'quoted_in'], ';')"><dc:subject>
                        <xsl:value-of select="concat('quotedIn:', normalize-space(.))"/>
                    </dc:subject></xsl:for-each>
                </xsl:when>
                <xsl:when test="contains(./t:ref[@type = 'quoted_in'], ',')">
                    <xsl:for-each select="tokenize(./t:ref[@type = 'quoted_in'], ',')"><dc:subject>
                        <xsl:value-of select="concat('quotedIn:', normalize-space(.))"/>
                    </dc:subject></xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                    <dc:subject>
                        <xsl:value-of select="concat('quotedIn:', ./t:ref[@type = 'quoted_in'])"/>
                    </dc:subject>	
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>-->
        
        <xsl:if test=".//t:textLang/t:lang[@style = 'tradition']">
            <xsl:choose>
                <xsl:when test="contains(.//t:textLang/t:lang[@style = 'tradition'], ';')">
                    <xsl:for-each select="tokenize(.//t:textLang/t:lang[@style = 'tradition'], ';')"><dc:subject>
                        <xsl:value-of select="normalize-space(.)"/>
                    </dc:subject></xsl:for-each>
                </xsl:when>
                <xsl:when test="contains(.//t:textLang/t:lang[@style = 'tradition'], '.')">
                    <xsl:for-each select="tokenize(.//t:textLang/t:lang[@style = 'tradition'], '.')"><dc:subject>
                        <xsl:value-of select="normalize-space(.)"/>
                    </dc:subject></xsl:for-each>
                </xsl:when>
                <xsl:when test="contains(.//t:textLang/t:lang[@style = 'tradition'], ':')">
                    <xsl:for-each select="tokenize(.//t:textLang/t:lang[@style = 'tradition'], ':')"><dc:subject>
                        <xsl:value-of select="normalize-space(.)"/>
                    </dc:subject></xsl:for-each>
                </xsl:when>
                <xsl:when test="contains(.//t:textLang/t:lang[@style = 'tradition'], ',')">
                    <xsl:for-each select="tokenize(.//t:textLang/t:lang[@style = 'tradition'], ',')"><dc:subject>
                        <xsl:value-of select="normalize-space(.)"/>
                    </dc:subject></xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                    <dc:subject>
                        <xsl:value-of select=".//t:textLang/t:lang[@style = 'tradition']"/>
                    </dc:subject>	
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
        
        <xsl:if test=".//t:textLang/t:catchwords">
            <xsl:choose>
                <xsl:when test="contains(.//t:textLang/t:catchwords, ':')">
                    <xsl:for-each select="tokenize(.//t:textLang/t:catchwords, ':')">
                        <dc:subject>
                            <xsl:value-of select="normalize-space(.)"/>
                            
                        </dc:subject>
                    </xsl:for-each>
                </xsl:when>
                <xsl:when test="contains(.//t:textLang/t:catchwords, '.')">
                    <xsl:for-each select="tokenize(.//t:textLang/t:catchwords, '.')">
                        <dc:subject>
                            <xsl:value-of select="normalize-space(.)"/>
                            
                        </dc:subject>
                    </xsl:for-each>
                </xsl:when>
                <xsl:when test="contains(.//t:textLang/t:catchwords, ';')">
                    <xsl:for-each select="tokenize(.//t:textLang/t:catchwords, ';')">
                        <dc:subject>
                            <xsl:value-of select="normalize-space(.)"/>
                            
                        </dc:subject>
                    </xsl:for-each>
                </xsl:when>
                <xsl:when test="contains(.//t:textLang/t:catchwords, ',')">
                    <xsl:for-each select="tokenize(.//t:textLang/t:catchwords, ',')">
                        <dc:subject>
                            <xsl:value-of select="normalize-space(.)"/>
                        </dc:subject>
                    </xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                    <dc:subject>
                        <xsl:value-of select=".//t:textLang/t:catchwords"/>
                    </dc:subject>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>