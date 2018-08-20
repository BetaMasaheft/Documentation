<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:t="http://www.tei-c.org/ns/1.0" xmlns:local="this.transformation"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:variable name="zotero" select="'https://www.zotero.org/pietroliuzzo/items/collectionKey/Z5MQAVPK/tag/'"/>
    <xsl:variable name="pleiades" select="'https://pleiades.stoa.org/places/'"/>
    <xsl:variable name="bm" select="'http://betamasaheft.eu/places/'"/>
<xsl:function name="local:respBibl">
    <xsl:param name="resp"/>
    <xsl:param name="tag"/>
    <a><xsl:attribute name="href"><xsl:value-of select="concat($zotero,$tag)"/></xsl:attribute>
        <xsl:value-of select="substring-after($resp, '#')"/>
    </a>
</xsl:function>
    <xsl:function name="local:IDlink">
        <xsl:param name="id"/>
        <xsl:variable name="link">
            <xsl:choose>
            <xsl:when test="starts-with($id, 'pleiades:')">
                <xsl:value-of select="concat($pleiades,substring-after($id,'pleiades:'))"/>
            </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat($bm,$id)"/></xsl:otherwise>
        </xsl:choose>
        </xsl:variable>
        <a><xsl:attribute name="href"><xsl:value-of select="$link"/></xsl:attribute>
            <xsl:value-of select="$id"/>
        </a>
    </xsl:function>
    <xsl:function name="local:encodedURI">
        <xsl:param name="id"></xsl:param>
        <xsl:choose>
            <xsl:when test="starts-with($id, 'pleiades')">
                <xsl:value-of select="encode-for-uri(concat($pleiades, substring-after($id, 'pleiades:')))"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="encode-for-uri(concat($bm, $id))"/></xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    <xsl:template match="/">
        <xsl:variable name="file" select="."/>
        <html><head><title>Identifications of places in RIE 277</title>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"></link>
             <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous"></link>
              <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        </head><body><table class="table table-responsive">
            <tr >
                <th>group</th>
                <th>attestation</th>
                <th>identification</th>
            </tr>
            <xsl:for-each select="//t:placeName[not(ancestor::t:app)]">
                <xsl:variable name="id" select="@xml:id"/>
                <xsl:variable name="mainencodedURL" select="local:encodedURI(@ref)"/>
            <tr>
                <td>
                    <xsl:for-each-group select="current()/following::t:seg[@type='interpretation']" group-by="@ana">
                        <p><xsl:copy-of select="local:respBibl(current-grouping-key(), $file//t:bibl[@xml:id= substring-after(current-grouping-key(),'#')]/t:ptr/@target)"/>
                        <xsl:text> </xsl:text>
                            <b><xsl:value-of select="current-group()[1]/@n"/></b></p>
                </xsl:for-each-group></td><!--group-->
                <td><xsl:value-of select="text()"/></td>
                <td>
                    <table  class="table table-striped">
                        <tr role="label">
                            <th>ID</th>
                            <th>desc</th>
                            <th>resp</th>
                            <th>related</th>
                        </tr>
                    <tr>
                        <td><xsl:copy-of select="local:IDlink(@ref)"/></td>
                        <td></td>
                        <td><xsl:copy-of select="if(@resp) then local:respBibl(@resp, $file//t:bibl[@xml:id= substring-after(@resp,'#')]/t:ptr/@target) else ancestor-or-self::t:TEI//t:editor/@key"/></td>
                        <td><xsl:if test="@ref"><a href="http://peripleo.pelagios.org/ui#selected={$mainencodedURL}">Peripleo</a></xsl:if></td>
                    </tr>
                        <xsl:if test="@xml:id"><xsl:for-each select="following::t:app[contains(@corresp,$id)]">
                            <tr>
                                <td><xsl:for-each select="descendant::t:placeName/@ref"><xsl:copy-of select="local:IDlink(.)"/></xsl:for-each></td>
                                <td><xsl:apply-templates select="t:note"/></td>
                                <td>scholion</td>
                                <td><xsl:for-each select="descendant::t:placeName/@ref"><a href="http://peripleo.pelagios.org/ui#selected={local:encodedURI(.)}">Peripleo</a></xsl:for-each></td>
                            </tr>
                        </xsl:for-each></xsl:if>
                    <xsl:for-each select="t:certainty">
                        <xsl:variable name="encodedURL" select="local:encodedURI(@assertedValue)"/>
                        <xsl:variable name="r" select="substring-after(@resp,'#')"></xsl:variable>
                        <tr>
                            <td><xsl:copy-of select="local:IDlink(@assertedValue)"/></td>
                            <td><xsl:apply-templates select="t:desc"/></td>
                            <td><xsl:copy-of select="local:respBibl(@resp, $file//t:bibl[@xml:id= $r]/t:ptr/@target)"/></td>
                            <td><xsl:if test="@assertedValue"><a href="http://peripleo.pelagios.org/ui#selected={$encodedURL}">Peripleo</a></xsl:if></td>
                        </tr>
                    </xsl:for-each>
                </table>
                </td>
            </tr>
        </xsl:for-each>
        </table>
    </body></html></xsl:template>
    <xsl:template match="t:quote">
        <xsl:text>“</xsl:text>
        <xsl:value-of select="."/>
        <xsl:text>”</xsl:text>
    </xsl:template>
    <xsl:template match="t:bibl">
        <a><xsl:attribute name="href"><xsl:value-of select="concat($zotero,t:ptr/@target)"/></xsl:attribute>
        <xsl:value-of select="t:ptr/@target"/>
        </a>
    </xsl:template>
    <xsl:template match="t:placeName">
        <xsl:value-of select="."/>
    </xsl:template>
    <xsl:template match="t:ref">
        <a><xsl:attribute name="href"><xsl:value-of select="@target"/></xsl:attribute>
        <xsl:value-of select="."/></a>
    </xsl:template>
</xsl:stylesheet>
