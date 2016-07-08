<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml"  
    
    exclude-result-prefixes="#all"
    version="2.0">
    
    <xsl:template name="nar">
        <nav>
            <ul> Navigate section
                <li><a href="#general">General</a></li>
                <li><a href="#description">Description</a></li>
                <li><a href="#relations">Relations</a></li>
                
            </ul>
            
        </nav>
        <section id="general">
            <h1>
                <i> 
                    <xsl:apply-templates select="//t:titleStmt/t:title"/>
                </i>
            </h1>
            <p>Edited by <xsl:apply-templates
                select="//t:titleStmt/t:editor[not(@role = 'generalEditor')]/@key"/> <xsl:if test="//t:publicationStmt/t:date">on
                    <xsl:value-of
                        select="format-date(//t:publicationStmt/t:date, '[D].[M].[Y]')"
                    /></xsl:if></p></section>
        
        <section  id="description">
            <h2>General description</h2>
            <p><xsl:apply-templates select="//t:body/t:p"/></p>
            
          
            <h2>Bibliography</h2>
            <xsl:apply-templates select="//t:listBibl"/>
            
        </section>
        
        
        
        <xsl:if test="//t:relation">
            <section id="relations">
            
            
            <table>
                <caption>Relations of this Entity with other entities</caption>
                <thead>
                    <tr>
                        <th>Subject</th>
                        <th>Relation</th>
                        <th>Object</th>
                    </tr>
                </thead>
                <xsl:apply-templates mode="reltable" select="//t:listBibl[@type = 'relations']"
                />
            </table>
            <xsl:apply-templates select="//t:listBibl[@type = 'relations']" mode="graph"/>
        </section>
        </xsl:if>
        
        
        <footer id="footer">
            <h2>Authors</h2>
            <ul>
                <xsl:apply-templates select="//t:revisionDesc"/>
            </ul></footer>
    </xsl:template>
</xsl:stylesheet>