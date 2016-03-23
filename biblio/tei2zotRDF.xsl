<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:t="http://www.tei-c.org/ns/1.0"
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	xmlns:z="http://www.zotero.org/namespaces/export#" xmlns:dc="http://purl.org/dc/elements/1.1/"
	xmlns:foaf="http://xmlns.com/foaf/0.1/" xmlns:bib="http://purl.org/net/biblio#"
	xmlns:dcterms="http://purl.org/dc/terms/" xmlns:vcard="http://nwalsh.com/rdf/vCard#"
	xmlns:prism="http://prismstandard.org/namespaces/1.2/basic/" version="2.0">


	<xsl:output method="xml" indent="yes"/>

	<!--namespaces-->
	<xsl:template match="/">
		<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
			xmlns:z="http://www.zotero.org/namespaces/export#"
			xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:foaf="http://xmlns.com/foaf/0.1/"
			xmlns:bib="http://purl.org/net/biblio#"
			xmlns:prism="http://prismstandard.org/namespaces/1.2/basic/">
			<xsl:call-template name="teiHeader"/>
			<xsl:call-template name="item"/>
			<xsl:comment><xsl:text>File generated with tei2zotRDF, a xslt transformation which takes as input COMSt bespoke TEI P5 bibliography and returns Zotero RDF</xsl:text></xsl:comment>
		</rdf:RDF>
	</xsl:template>

	<!--header-->
	<xsl:template name="teiHeader">
		<xsl:comment>
			<xsl:value-of select="normalize-space(t:teiHeader)"/>
		</xsl:comment>
	</xsl:template>

	<!--bibliographic item-->
	<xsl:template name="item">
		<xsl:for-each select="//t:biblStruct">

			<!--item type selector-->
			<xsl:choose>
				
				<xsl:when test="@type = 'Book'">
					<xsl:call-template name="book"/>
				</xsl:when>

				<xsl:when test="@type = 'Book_chapter'">
					<xsl:call-template name="bookpart"/>
				</xsl:when>

				<xsl:when test="@type = 'PhD_tesis'">
					<xsl:call-template name="phdtesis"/>
				</xsl:when>
				<xsl:when test="@type = 'Journal_article'">
					<xsl:call-template name="article"/>
				</xsl:when>


				<xsl:when test="@type = 'Paper'">
					<!--is this different from Journal Article and conference paper in structure?-->
					<xsl:call-template name="paper"/>
				</xsl:when>

				<xsl:when test="@type = 'Encyclopaedia_entry'">
					<xsl:call-template name="encyclo"/>
				</xsl:when>

				<xsl:when test="@type = 'Conference_paper'">
					<xsl:call-template name="proc"/>
				</xsl:when>


				<xsl:when test="@type = 'Web_reference'">
					<xsl:call-template name="webref"/>
				</xsl:when>


				<xsl:when test="@type = 'Web_monogr'">
					<xsl:call-template name="webmono"/>
				</xsl:when>


				<xsl:when test="@type = 'Web_article'">
					<xsl:call-template name="webarticle"/>
				</xsl:when>


				<xsl:when test="@type = 'Web_paper'">
					<xsl:call-template name="webpaper"/>
				</xsl:when>

				<xsl:when test="@type = 'Review'">
					<xsl:call-template name="review"/>
				</xsl:when>


				<xsl:when test="@type = 'Manuscript_book'">
					<xsl:call-template name="ManuBook"/>
				</xsl:when>


				<xsl:when test="@type = 'Manuscript_article'">
					<xsl:call-template name="ManuArticle"/>
				</xsl:when>



				<xsl:when test="@type = 'Project'">
					<xsl:call-template name="project"/>
				</xsl:when>

				<xsl:otherwise>

					<xsl:call-template name="book"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>

	<!--types-->
	<xsl:include href="article.xsl"/>
	<xsl:include href="bookpart.xsl"/>
	<xsl:include href="proc.xsl"/>
	<xsl:include href="book.xsl"/>
	<xsl:include href="editedbook.xsl"/>

	<xsl:include href="review.xsl"/>
	<xsl:include href="project.xsl"/>
	<xsl:include href="ManuBook.xsl"/>
	<xsl:include href="ManuArticle.xsl"/>

	<xsl:include href="webref.xsl"/>
	<xsl:include href="webmono.xsl"/>
	<xsl:include href="webarticle.xsl"/>
	<xsl:include href="webpaper.xsl"/>

	<xsl:include href="encyclo.xsl"/>
	<xsl:include href="paper.xsl"/>
	<xsl:include href="phdthesis.xsl"/>

	<xsl:include href="manuscript.xsl"/>


	<!--parts-->
	<xsl:include href="author.xsl"/>

	<xsl:include href="id.xsl"/>

	<xsl:include href="titles.xsl"/>
	<xsl:include href="languages.xsl"/>

	<xsl:include href="tags.xsl"/>
	<xsl:include href="series.xsl"/>
	<xsl:include href="seriesproc.xsl"/>
	<xsl:include href="publisher.xsl"/>
	<xsl:include href="partOf.xsl"/>
	<xsl:include href="note.xsl"/>
	<xsl:include href="url.xsl"/>
</xsl:stylesheet>
