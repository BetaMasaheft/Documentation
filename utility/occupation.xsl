<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:t="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs t" version="2.0">

    <xsl:output encoding="UTF-8" method="xml" indent="yes" name="xml"/>


    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>


    <xsl:template match="item">
        
   
        
            <xsl:message><xsl:copy><xsl:value-of select="."/></xsl:copy></xsl:message>
        <xsl:variable name="numeric" select="if(matches(., '\d{5}')) then substring(.,4,5) else substring(.,4,4) "/>
        <xsl:message><xsl:value-of select="$numeric"/></xsl:message>
            <xsl:variable name="folder" select="if(number($numeric) gt 12000) then 'PRS12001-13000' else
                if(number($numeric) gt 11000) then 'PRS11001-12000' else 
                if(number($numeric) gt 10000) then 'PRS10001-11000' else 
                if(number($numeric) gt 9000) then 'PRS9001-10000' else
                if(number($numeric) gt 8000) then 'PRS8001-9000' else 
                if(number($numeric) gt 7000) then 'PRS7001-8000' else 
                if(number($numeric) gt 6000) then 'PRS6001-7000' else
                if(number($numeric) gt 5000) then 'PRS5001-6000' else
                if(number($numeric) gt 4000) then 'PRS4001-5000' else
                if(number($numeric) gt 3000) then 'PRS3001-4000' else 
                if(number($numeric) gt 2000) then 'PRS2001-3000' else
                if(number($numeric) gt 1000) then 'PRS1001-2000' else()"/>
            <xsl:message><xsl:value-of select="."/></xsl:message>
            
            <xsl:variable name="loc" select="concat('../../Persons/',$folder,'/', ., '.xml')"/>
            <xsl:message><xsl:value-of select="$loc"/></xsl:message>
            <xsl:variable name="docu" select="doc($loc)"/>
            
            
            <xsl:result-document href="/users/pietro/Desktop/occupationResults1/{.}.xml" format="xml">
                <xsl:apply-templates select="$docu"/>
            </xsl:result-document>
            
        
    </xsl:template>

    <xsl:template
        match="t:occupation[not(t:roleName)][contains(., 'st') or contains(., 'saint') or contains(., 'bibl') or contains(., 'prophet')]">
        <xsl:choose>
            <xsl:when test="contains(., 'st') or contains(., 'saint')"><xsl:comment><xsl:copy-of select="."></xsl:copy-of></xsl:comment></xsl:when>
            <xsl:when test="contains(., 'bibl') or contains(., 'biblical')"><xsl:comment><xsl:copy-of select="."></xsl:copy-of></xsl:comment></xsl:when>
            <xsl:when test="contains(., 'prophet')"><xsl:comment><xsl:copy-of select="."></xsl:copy-of></xsl:comment></xsl:when>
        </xsl:choose>
    </xsl:template>

<xsl:template match="t:revisionDesc">
    <xsl:copy>
    <xsl:apply-templates/>
        <change  xmlns="http://www.tei-c.org/ns/1.0" who="PL" when="2019-03-27">removed occupation containing St, Saint, bibl, biblical or prophet, added keyword. See https://github.com/BetaMasaheft/Documentation/issues/1104</change>
</xsl:copy>
</xsl:template>
    
    <xsl:template match="t:profileDesc">
        <xsl:variable name="occ" select="ancestor::t:TEI//t:occupation"/>
        <xsl:copy>
            <xsl:apply-templates select="t:*[not(name() = 'textClass')]"/>
            <xsl:choose>
                <xsl:when test="t:textClass">
                    <textClass xmlns="http://www.tei-c.org/ns/1.0">
                        <keywords>
                            <xsl:for-each select="$occ">
                            <xsl:copy-of select="t:term"></xsl:copy-of>
                                <xsl:if test="contains(., 'st') or contains(., 'saint')">
                                    <term key="saint"/>
                                </xsl:if>
                                <xsl:if test="contains(., 'bibl') or contains(., 'biblical')">
                                    <term key="biblical"/>
                                </xsl:if>
                                <xsl:if test="contains(., 'prophet')">
                                    <term key="prophet"/>
                                </xsl:if>
                            </xsl:for-each>
                        </keywords>
                    </textClass>
                </xsl:when>
                <xsl:otherwise>
                    <textClass xmlns="http://www.tei-c.org/ns/1.0">
                        <keywords>
                                <xsl:for-each select="$occ">
                                    <xsl:if test="contains(., 'st') or contains(., 'saint')">
                                    <term key="saint"/>
                                </xsl:if>
                                <xsl:if test="contains(., 'bibl') or contains(., 'biblical')">
                                    <term key="biblical"/>
                                </xsl:if>
                                <xsl:if test="contains(., 'prophet')">
                                    <term key="prophet"/>
                                </xsl:if></xsl:for-each>
                            
                        </keywords>
                    </textClass>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:copy>
    </xsl:template>

    <!--    keyword "saint" etc.
I found it encoded currently as:

<occupation type="ecclesiastic">Saint</occupation
<occupation type="ecclesiastic">saint</occupation>
<occupation>saint</occupation>
<occupation type="other">saint</occupation>
<occupation type="other">Saint</occupation>
<occupation type="ecclesiastic"> Sts </occupation>
 <occupation>St</occupation>
 <occupation>St.</occupation>
 <occupation> prophet </occupation>
<occupation> bibl. </occupation>
<occupation type="other">biblical</occupation>
with, of course, occasional spaces before or after the word or other information 
included in the same element, e.g. "saint king" (in these cases, it would probably 
best to leave the occupation as it is and just add the keyword as well).
Can this be done with a script or so, or should I go through them manually?
    
    -->
</xsl:stylesheet>
