<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:t="http://www.tei-c.org/ns/1.0" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	xmlns:z="http://www.zotero.org/namespaces/export#" xmlns:dc="http://purl.org/dc/elements/1.1/"
	xmlns:foaf="http://xmlns.com/foaf/0.1/" xmlns:bib="http://purl.org/net/biblio#"
	xmlns:dcterms="http://purl.org/dc/terms/" xmlns:vcard="http://nwalsh.com/rdf/vCard#"
	xmlns:prism="http://prismstandard.org/namespaces/1.2/basic/" version="2.0">
	<xsl:template name="ManuBook">
		<bib:Manuscript>
			
			<xsl:call-template name="id"/>
			
			<z:itemType>
				<xsl:text>manuscript</xsl:text>
			</z:itemType>
			<dc:title>
				
				<xsl:call-template name="monotitle"/>
			</dc:title>
			<xsl:if test=".//t:imprint"><xsl:call-template name="publisher"/></xsl:if>
			<bib:authors>
				<rdf:Seq>
						<!--authors-->
					<xsl:for-each select=".//t:author[not(@role='submitted_by_team')]">
							
							<xsl:call-template name="author"/>
						</xsl:for-each>
					
				</rdf:Seq>
			</bib:authors>
			
			<!--url-->
			
			<xsl:call-template name="url"/>
			<!--date-->
			<xsl:for-each select=".//t:imprint/t:date">
				<dc:date>
					<xsl:value-of select="normalize-space(.)"/>
				</dc:date>
			</xsl:for-each>
			<!--pages-->
			<bib:pages>
				<xsl:value-of select=".//t:imprint/t:biblScope[@unit = 'page']"/>
			</bib:pages>
			<!--language-->
			<xsl:if test=".//t:textLang">
				<xsl:call-template name="languages"/>
				
				
			</xsl:if>
			<!--tags-->
			
			<xsl:call-template name="tags"/>
			
			<!--notes-->
			<xsl:call-template name="note"/>
		</bib:Manuscript>
	</xsl:template>
</xsl:stylesheet>