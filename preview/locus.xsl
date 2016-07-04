<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" 
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="t:locus">
        <xsl:if test="parent::t:ab"><xsl:text>(Excerpt from </xsl:text></xsl:if>
        <xsl:choose>
            <xsl:when test="not(text())"><xsl:choose>
            <xsl:when test="@target">
                <xsl:choose>
                    <xsl:when test="contains(@target,' ')">
                    <xsl:choose><xsl:when test="//t:extent/t:measure[@unit='page']">pp.</xsl:when><xsl:otherwise><xsl:text>ff. </xsl:text></xsl:otherwise></xsl:choose>
                        <xsl:for-each select="tokenize(@target,' ')">
                        <a href="{.}">
                            <xsl:value-of select="concat(substring-after(.,'#'), ' ')"/>
                        </a>   
                    </xsl:for-each>
                </xsl:when><xsl:otherwise><a href="{@target}">
                    <xsl:choose><xsl:when test="//t:extent/t:measure[@unit='page']">p.</xsl:when><xsl:otherwise><xsl:text>f. </xsl:text></xsl:otherwise></xsl:choose>
                    <xsl:value-of select="substring-after(@target,'#')"/>
                </a></xsl:otherwise></xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose><xsl:when test="//t:extent/t:measure[@unit='page']">pp.</xsl:when><xsl:otherwise><xsl:text>ff. </xsl:text></xsl:otherwise></xsl:choose>
                <a href="{@from}">
                    <xsl:value-of select="@from"/>
                </a>
                <xsl:text>-</xsl:text>
                <a href="{@to}">
                    <xsl:value-of select="@to"/>
                </a>
            </xsl:otherwise>
        </xsl:choose>
            <xsl:if test="@n">
                <xsl:text>, l.</xsl:text>
                <xsl:value-of select="@n"/>
            </xsl:if></xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="@target">
                        <a href="{@target}">
                            <xsl:value-of select="."/>
                        </a>
                    </xsl:when>
                    <xsl:otherwise>
                        <a href="{@from}">
                            <xsl:value-of select="."/>
                        </a>
                    </xsl:otherwise>
                </xsl:choose>
                
                
            </xsl:otherwise></xsl:choose>
        <xsl:text> </xsl:text>
        <xsl:if test="parent::t:ab"><xsl:text>)</xsl:text> <br/></xsl:if>
    </xsl:template>
</xsl:stylesheet>