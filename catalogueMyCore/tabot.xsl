<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns:r="http://www.oxygenxml.com/ns/report" xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="t xs r" version="2.0">

    <xsl:output encoding="UTF-8" method="xml"/>
    <xsl:output indent="yes"/>

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="t:note">
        <xsl:variable name="tabot">
            <xsl:analyze-string select="t:ab[@type = 'history']"
                regex="(Tabot(s)?)(\s?\((\d+)\)\s?:?)(.+)(\.)">
                <xsl:matching-substring>

                    <measure quantity="{regex-group(4)}"/>
                    <xsl:value-of select="regex-group(1)"/>
                    <xsl:text> of</xsl:text>
                    <xsl:value-of select="regex-group(5)"/>
                    <xsl:value-of select="regex-group(6)"/>

                </xsl:matching-substring>
                <xsl:fallback>
                    <xsl:comment>I have not found a matching string to fill ab[@type='tabot']</xsl:comment>
                </xsl:fallback>
            </xsl:analyze-string>
        </xsl:variable>
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
            <ab type="tabot">
                <xsl:copy-of select="$tabot"/>
            </ab>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="t:ab[@type = 'history']">
        <xsl:copy>
            
            <xsl:apply-templates select="@*"/>
            <xsl:analyze-string select="." regex="(Tabot(s)?)(\s?\((\d+)\)\s?:?)(.+)(\.)">
                <xsl:matching-substring/>
                <xsl:non-matching-substring>
                    <xsl:value-of select="."/>
                </xsl:non-matching-substring>
            </xsl:analyze-string>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
