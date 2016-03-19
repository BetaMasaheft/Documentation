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
    
    <xsl:template name="series">
        <dcterms:isPartOf>
            <bib:Series>
                <dc:title>
                    <xsl:value-of select=".//t:series/t:title[@level = 's']"/>
                </dc:title>
                <dc:identifier>
                    <xsl:value-of select=".//t:series/t:biblScope[@unit = 'issue']"/>
                </dc:identifier>
            </bib:Series>
        </dcterms:isPartOf>
        
    </xsl:template>
    
</xsl:stylesheet>