<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="2.0">
    <xsl:template match="t:title">

        <xsl:choose>
           
            <xsl:when test="@ref"> 
                <xsl:variable name="filename">
                <xsl:choose>
                    <xsl:when test="contains(@ref, '#')">
                        <xsl:value-of select="substring-before(@ref, '#')"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="@ref"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
                <xsl:choose>
                    <xsl:when test="document(concat('../../Works/', $filename, '.xml'))//t:TEI">
                        <a href="../../Works/{@ref}">
                            <xsl:choose>
                                <xsl:when test="text()">
                                    <i>
                                        <xsl:value-of select="."/>
                                    </i>
                                </xsl:when>
                                <xsl:otherwise>

                                    <i>
                                        <xsl:value-of
                                            select="document(concat('../../Works/', $filename, '.xml'))//t:TEI//t:titleStmt//t:title[not(@type = 'alt')]"
                                        />
                                        <xsl:if test="contains(@ref, '#')">
                                            <xsl:value-of select="concat(', ',substring-after(@ref, '#'))"/>
                                        </xsl:if>
                                    </i>
                                </xsl:otherwise>
                            </xsl:choose>
                        </a>
                    </xsl:when>
                    <xsl:otherwise>
                        <b style="color:red;
                                text-align:center;"
                            >**No record for Work <xsl:value-of select="@ref"/>** = <xsl:value-of
                                select="."/> **</b>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <i>
                    <xsl:value-of select="."/>
                </i>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="@evidence"> (<xsl:value-of select="@evidence"/>)</xsl:if>
        <xsl:if test="@cert = 'low'">
            <xsl:text> ? </xsl:text>
        </xsl:if>
        <xsl:if test="@type">
            <xsl:text> [</xsl:text>
            <xsl:value-of select="@type"/>
            <xsl:text>] </xsl:text>
        </xsl:if>


    </xsl:template>
</xsl:stylesheet>
