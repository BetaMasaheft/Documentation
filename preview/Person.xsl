<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" 
    
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template name="person">
<nav>
                    <ul> Navigate section
                        <li><a href="#general">general</a></li>
                        <li><a href="#description">Description</a></li>
                        <li><a href="#history">History</a></li>
                        <li><a href="#relations">Relations</a></li>
                        <li><a href="#bibliography">Bibliography</a></li>
                    </ul>
                   
                </nav>
                <section id="general"><p>
                        <xsl:if test="//t:msIdentifier/t:altIdentifier">
                            <xsl:for-each select="//t:msIdentifier/t:altIdentifier">
                                <xsl:sort/>
                                <xsl:value-of select="concat(., ' ')"/>
                            </xsl:for-each>
                        </xsl:if>
                    </p>
                    <p>Edited by <xsl:apply-templates
                        select="//t:titleStmt/t:editor[not(@role = 'generalEditor')]/@key"/><xsl:if test="//t:publicationStmt/t:date">on
                            <xsl:value-of
                                select="format-date(//t:publicationStmt/t:date, '[D].[M].[Y]')"
                            /></xsl:if></p></section>
        
        
                <section  id="description">
                  <h2>Names</h2>
                    <xsl:for-each select="//t:person/t:persName">
                        
                        <xsl:sort></xsl:sort>
                        <li><xsl:if test="@xml:id"><xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute></xsl:if> <xsl:value-of select="."/>
                            <xsl:if test="@type"> (<xsl:value-of select="@type"/>)</xsl:if><xsl:if test="@corresp"><sup><a href="{@corresp}"><xsl:value-of select="@xml:lang"/><xsl:text> tr.</xsl:text></a></sup></xsl:if></li>
                    </xsl:for-each>
                    <h2>Sex: <xsl:choose><xsl:when test="//t:person/@sex = 1">Male</xsl:when><xsl:otherwise>Female</xsl:otherwise></xsl:choose></h2>
                    <xsl:if test="//t:birth"><h2>Birth: </h2>
                        <xsl:apply-templates select="//t:birth"/><xsl:if test="//t:birth/@evidence"> (<xsl:value-of select="//t:birth/@evidence"/>)</xsl:if></xsl:if>
                    <xsl:if test="//t:death"><h2>Death: </h2>
                        <xsl:apply-templates select="//t:death"/><xsl:if test="//t:death/@evidence"> (<xsl:value-of select="//t:death/@evidence"/>)</xsl:if></xsl:if>
                    <xsl:if test="//t:floruit"><h2>Floruit: </h2>
                        <xsl:apply-templates select="//t:floruit"/><xsl:if test="//t:floruit/@evidence"> (<xsl:value-of select="//t:floruit/@evidence"/>)</xsl:if></xsl:if>
                    <xsl:if test="//t:occupation"><h2>Occupation: </h2>
                        <xsl:apply-templates select="//t:occupation"/></xsl:if>
                    <xsl:if test="//t:residence"><h2>Residence: </h2>
                        <xsl:apply-templates select="//t:residence"/></xsl:if>
                    <xsl:if test="//t:faith"><h2>Faith: </h2>
                        <xsl:apply-templates select="//t:faith"/></xsl:if>
                </section>
                
        <section id="history">
            
        </section>     
        
        <xsl:if test="//t:listRelation">
        <section id="relations">
            <xsl:apply-templates mode="graph" select="//t:listRelation"/>
        </section>   </xsl:if>  
        
        
        <section id="bibliography">
            <xsl:apply-templates select="//t:listBibl"/>
        </section>     
        
          
        
        <footer id="footer">
                <h2>Authors</h2>
                <ul>
                    <xsl:apply-templates select="//t:revisionDesc"/>
                </ul></footer>
    </xsl:template>
</xsl:stylesheet>