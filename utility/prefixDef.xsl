<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns:xi="http://www.w3.org/2001/XInclude"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs t"
    version="2.0">
    
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    
<!--    add xi:include namespace to TEI needs to be done by find and replace, as xslt does not let one add xmlns:xi
    although that is fine in TEI, is ok for eXist-db as well. -->
    
    
<!--    Add xml:base to t:source and t:text-->
    <xsl:template match="t:source | t:text">
        <xsl:copy>
            <xsl:attribute name="xml:base">https://betamasaheft.eu</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
<!--    add prefixDef and taxonomy to all files-->
    
    <xsl:template match="t:teiHeader">
       <xsl:choose>
           <xsl:when test="t:encodingDesc">
               <xsl:copy>
                   <xsl:apply-templates/>
               </xsl:copy>
           </xsl:when>
           <xsl:otherwise>
               <xsl:copy>
                   <xsl:apply-templates select="t:fileDesc"/>
                   <encodingDesc>
                       <projectDesc>
                           <p>All internal references are given without a prefix only with the ID and can be expanded by 
                               prepending the base URL https://betamasaheft.eu/.</p>
                       </projectDesc>
                       <xi:include href="https://raw.githubusercontent.com/BetaMasaheft/Documentation/master/prefixDef.xml">
                           <xi:fallback>
                               <p>Definitions of prefixes used.</p>
                           </xi:fallback>
                       </xi:include>
                       <xi:include href="https://raw.githubusercontent.com/BetaMasaheft/Authority-Files/master/taxonomy.xml">
                           <xi:fallback>
                               <p>Beta maṣāḥǝft taxonomy.</p>
                           </xi:fallback>
                       </xi:include>
                   </encodingDesc>
                   <xsl:apply-templates select="t:*[not(name()='fileDesc')]"/>
               </xsl:copy>
           </xsl:otherwise>
       </xsl:choose>
    </xsl:template>
    
    <xsl:template match="t:encodingDesc">
        <xsl:copy>
            <xsl:apply-templates/>
            <xi:include href="https://raw.githubusercontent.com/BetaMasaheft/Documentation/master/prefixDef.xml">
                <xi:fallback>
                    <p>Definitions of prefixes used.</p>
                </xi:fallback>
            </xi:include>
            <xi:include href="https://raw.githubusercontent.com/BetaMasaheft/Authority-Files/master/taxonomy.xml">
                <xi:fallback>
                    <p>Beta maṣāḥǝft taxonomy.</p>
                </xi:fallback>
            </xi:include>
        </xsl:copy>
    </xsl:template>
    
<!--    add statement to explain the solution of internal ids-->
    
    <xsl:template match="t:projectDesc">
        <xsl:copy>
            <xsl:apply-templates/>
        <p>All internal references are given without a prefix only with the ID and can be expanded by prepending the base URL https://betamasaheft.eu/.</p>
        </xsl:copy>
        </xsl:template>
</xsl:stylesheet>

