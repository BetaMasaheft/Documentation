<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="2.0">
    <xsl:template match="t:ref">
        <xsl:choose>
            
            
            <!--            considers if ref is empty or not. start from cases in which is not-->
            <xsl:when test="text()">
                <!--                ref can take type and corresp or target-->
                <xsl:choose>
                    <xsl:when test="@target">
                        <xsl:choose>
                            <!--                            multiple entries-->
                            <xsl:when test="contains(@target, ' ')">
                                <xsl:text>nos. </xsl:text>
                                <xsl:for-each select="tokenize(@target, ' ')">
                                    <a href="{.}">
                                        <xsl:value-of select="."/>
                                    </a>
                                </xsl:for-each>
                            </xsl:when>
                            <xsl:otherwise>
                                <a href="{@target}">n. <xsl:value-of select="."/></a>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>

                        <!--assumes corresp and type-->
                        <xsl:choose>
                            <xsl:when test="contains(@corresp, ' ')">

                                <xsl:for-each select="tokenize(@corresp, ' ')">
                                    <!--                                    person-->
                                    <xsl:choose>
                                        <xsl:when test="starts-with(., 'PRS')">
                                            <xsl:choose>
                                                <xsl:when
                                                  test="document(concat('../../Persons/', ., '.xml'))//t:TEI">
                                                  <a href="../../Persons/{.}">
                                                  <xsl:value-of select="."/>
                                                  </a>

                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <b
                                                  style="color:red;
                                            text-align:center;"
                                                  >**No record for Person <xsl:value-of select="."
                                                  />** = <xsl:value-of select="."/> **</b>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:when>
                                        <xsl:when test="starts-with(., 'LOC')">
                                            <xsl:choose>
                                                <xsl:when
                                                  test="document(concat('../../Places/', ., '.xml'))//t:TEI">
                                                  <a href="../../Places/{.}">
                                                  <xsl:value-of select="."/>
                                                  </a>

                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <b
                                                  style="color:red;
                                                text-align:center;"
                                                  >**No record for Place <xsl:value-of select="."
                                                  />** = <xsl:value-of select="."/> **</b>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:when>
                                        <xsl:when test="starts-with(., 'INS')">
                                            <xsl:choose>
                                                <xsl:when
                                                    test="document(concat('../../Institutions/', ., '.xml'))//t:TEI">
                                                    <a href="../../Institutions/{.}">
                                                        <xsl:value-of select="."/>
                                                    </a>
                                                    
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <b
                                                        style="color:red;
                                                        text-align:center;"
                                                        >**No record for Institution <xsl:value-of select="."
                                                        />** = <xsl:value-of select="."/> **</b>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:when>
                                        <xsl:when test="starts-with(., 'LIT')">
                                            <xsl:choose>
                                                <xsl:when
                                                    test="document(concat('../../Works/', ., '.xml'))//t:TEI">
                                                    <a href="../../Works/{.}">
                                                        <xsl:value-of select="."/>
                                                    </a>
                                                    
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <b
                                                        style="color:red;
                                                        text-align:center;"
                                                        >**No record for Work <xsl:value-of select="."
                                                        />** = <xsl:value-of select="."/> **</b>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:when>
                                        <xsl:when test="starts-with(., 'NAR')">
                                            <xsl:choose>
                                                <xsl:when
                                                    test="document(concat('../../Narratives/', ., '.xml'))//t:TEI">
                                                    <a href="../../Narratives/{.}">
                                                        <xsl:value-of select="."/>
                                                    </a>
                                                    
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <b
                                                        style="color:red;
                                                        text-align:center;"
                                                        >**No record for Narrative Unit <xsl:value-of select="."
                                                        />** = <xsl:value-of select="."/> **</b>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            
<!--                                            assumes that if none of the above, the id must be of a manuscript-->
                                            <xsl:choose>
                                                <xsl:when
                                                    test="document(concat('../../Manuscripts/', ., '.xml'))//t:TEI">
                                                    <a href="../../Manuscripts/{.}">
                                                        <xsl:value-of select="."/>
                                                    </a>
                                                    
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <b
                                                        style="color:red;
                                                        text-align:center;"
                                                        >**No record for <xsl:value-of select="."
                                                        />** = <xsl:value-of select="."/> **</b>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:for-each>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:choose>
                                    <xsl:when test="starts-with(@corresp, 'PRS')">
                                        <xsl:choose>
                                            <xsl:when
                                                test="document(concat('../../Persons/', @corresp, '.xml'))//t:TEI">
                                                <a href="../../Persons/{@corresp}">
                                                    <xsl:value-of select="."/>
                                                </a>
                                                
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <b
                                                    style="color:red;
                                                    text-align:center;"
                                                    >**No record for Person <xsl:value-of select="@corresp"
                                                    />** = <xsl:value-of select="."/> **</b>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:when test="starts-with(@corresp, 'LOC')">
                                        <xsl:choose>
                                            <xsl:when
                                                test="document(concat('../../Places/', @corresp, '.xml'))//t:TEI">
                                                <a href="../../Places/{@corresp}">
                                                    <xsl:value-of select="."/>
                                                </a>
                                                
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <b
                                                    style="color:red;
                                                    text-align:center;"
                                                    >**No record for Place <xsl:value-of select="@corresp"
                                                    />** = <xsl:value-of select="."/> **</b>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:when test="starts-with(@corresp, 'INS')">
                                        <xsl:choose>
                                            <xsl:when
                                                test="document(concat('../../Institutions/', @corresp, '.xml'))//t:TEI">
                                                <a href="../../Institutions/{@corresp}">
                                                    <xsl:value-of select="."/>
                                                </a>
                                                
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <b
                                                    style="color:red;
                                                    text-align:center;"
                                                    >**No record for Institution <xsl:value-of select="@corresp"
                                                    />** = <xsl:value-of select="."/> **</b>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:when test="starts-with(@corresp, 'LIT')">
                                        <xsl:choose>
                                            <xsl:when
                                                test="document(concat('../../Works/', @corresp, '.xml'))//t:TEI">
                                                <a href="../../Works/{@corresp}">
                                                    <xsl:value-of select="."/>
                                                </a>
                                                
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <b
                                                    style="color:red;
                                                    text-align:center;"
                                                    >**No record for Work <xsl:value-of select="@corresp"
                                                    />** = <xsl:value-of select="."/> **</b>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:when test="starts-with(@corresp, 'NAR')">
                                        <xsl:choose>
                                            <xsl:when
                                                test="document(concat('../../Narratives/', @corresp, '.xml'))//t:TEI">
                                                <a href="../../Narratives/{@corresp}">
                                                    <xsl:value-of select="."/>
                                                </a>
                                                
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <b
                                                    style="color:red;
                                                    text-align:center;"
                                                    >**No record for Narrative Unit <xsl:value-of select="@corresp"
                                                    />** = <xsl:value-of select="."/> **</b>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        
                                        <!--                                            assumes that if none of the above, the id must be of a manuscript-->
                                        <xsl:choose>
                                            <xsl:when
                                                test="document(concat('../../Manuscripts/', @corresp, '.xml'))//t:TEI">
                                                <a href="../../Manuscripts/{@corresp}">
                                                    <xsl:value-of select="."/>
                                                </a>
                                                
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <b
                                                    style="color:red;
                                                    text-align:center;"
                                                    >**No record for <xsl:value-of select="@corresp"
                                                    />** = <xsl:value-of select="."/> **</b>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:otherwise>
                                </xsl:choose>
                                
                            </xsl:otherwise>
                        </xsl:choose>

                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>

            <!--            ref used empty-->
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="@target">
                        <xsl:choose>
                            <!--                            multiple entries-->
                            <xsl:when test="contains(@target, ' ')">
                                <xsl:text>nos. </xsl:text>
                                <xsl:for-each select="tokenize(@target, ' ')">
                                    <a href="{.}">
                                        <xsl:value-of select="."/>
                                    </a>
                                </xsl:for-each>
                            </xsl:when>
                            <xsl:otherwise>
                                <a href="{@target}">n. <xsl:value-of select="."/></a>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        
                        <!--assumes corresp and type-->
                        <xsl:choose>
                            <xsl:when test="contains(@corresp, ' ')">
                                
                                <xsl:for-each select="tokenize(@corresp, ' ')">
                                    <!--                                    person-->
                                    <xsl:choose>
                                        <xsl:when test="starts-with(., 'PRS')">
                                            <xsl:choose>
                                                <xsl:when
                                                    test="document(concat('../../Persons/', ., '.xml'))//t:TEI">
                                                    <a href="../../Persons/{.}">
                                                        <xsl:value-of select="."/>
                                                    </a>
                                                    
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <b
                                                        style="color:red;
                                                        text-align:center;"
                                                        >**No record for Person <xsl:value-of select="."
                                                        />** = <xsl:value-of select="."/> **</b>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:when>
                                        <xsl:when test="starts-with(., 'LOC')">
                                            <xsl:choose>
                                                <xsl:when
                                                    test="document(concat('../../Places/', ., '.xml'))//t:TEI">
                                                    <a href="../../Places/{.}">
                                                        <xsl:value-of select="."/>
                                                    </a>
                                                    
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <b
                                                        style="color:red;
                                                        text-align:center;"
                                                        >**No record for Place <xsl:value-of select="."
                                                        />** = <xsl:value-of select="."/> **</b>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:when>
                                        <xsl:when test="starts-with(., 'INS')">
                                            <xsl:choose>
                                                <xsl:when
                                                    test="document(concat('../../Institutions/', ., '.xml'))//t:TEI">
                                                    <a href="../../Institutions/{.}">
                                                        <xsl:value-of select="."/>
                                                    </a>
                                                    
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <b
                                                        style="color:red;
                                                        text-align:center;"
                                                        >**No record for Institution <xsl:value-of select="."
                                                        />** = <xsl:value-of select="."/> **</b>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:when>
                                        <xsl:when test="starts-with(., 'LIT')">
                                            <xsl:choose>
                                                <xsl:when
                                                    test="document(concat('../../Works/', ., '.xml'))//t:TEI">
                                                    <a href="../../Works/{.}">
                                                        <xsl:value-of select="."/>
                                                    </a>
                                                    
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <b
                                                        style="color:red;
                                                        text-align:center;"
                                                        >**No record for Work <xsl:value-of select="."
                                                        />** = <xsl:value-of select="."/> **</b>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:when>
                                        <xsl:when test="starts-with(., 'NAR')">
                                            <xsl:choose>
                                                <xsl:when
                                                    test="document(concat('../../Narratives/', ., '.xml'))//t:TEI">
                                                    <a href="../../Narratives/{.}">
                                                        <xsl:value-of select="."/>
                                                    </a>
                                                    
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <b
                                                        style="color:red;
                                                        text-align:center;"
                                                        >**No record for Narrative Unit <xsl:value-of select="."
                                                        />** = <xsl:value-of select="."/> **</b>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            
                                            <!--                                            assumes that if none of the above, the id must be of a manuscript-->
                                            <xsl:choose>
                                                <xsl:when
                                                    test="document(concat('../../Manuscripts/', ., '.xml'))//t:TEI">
                                                    <a href="../../Manuscripts/{.}">
                                                        <xsl:value-of select="."/>
                                                    </a>
                                                    
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <b
                                                        style="color:red;
                                                        text-align:center;"
                                                        >**No record found for <xsl:value-of select="."
                                                        />** = <xsl:value-of select="."/> **</b>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:for-each>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:choose>
                                    <xsl:when test="starts-with(., 'PRS')">
                                        <xsl:choose>
                                            <xsl:when
                                                test="document(concat('../../Persons/', ., '.xml'))//t:TEI">
                                                <a href="../../Persons/{.}">
                                                    <xsl:value-of select="."/>
                                                </a>
                                                
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <b
                                                    style="color:red;
                                                    text-align:center;"
                                                    >**No record for Person <xsl:value-of select="."
                                                    />** = <xsl:value-of select="."/> **</b>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:when test="starts-with(., 'LOC')">
                                        <xsl:choose>
                                            <xsl:when
                                                test="document(concat('../../Places/', ., '.xml'))//t:TEI">
                                                <a href="../../Places/{.}">
                                                    <xsl:value-of select="."/>
                                                </a>
                                                
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <b
                                                    style="color:red;
                                                    text-align:center;"
                                                    >**No record for Place <xsl:value-of select="."
                                                    />** = <xsl:value-of select="."/> **</b>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:when test="starts-with(., 'INS')">
                                        <xsl:choose>
                                            <xsl:when
                                                test="document(concat('../../Institutions/', ., '.xml'))//t:TEI">
                                                <a href="../../Institutions/{.}">
                                                    <xsl:value-of select="."/>
                                                </a>
                                                
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <b
                                                    style="color:red;
                                                    text-align:center;"
                                                    >**No record for Institution <xsl:value-of select="."
                                                    />** = <xsl:value-of select="."/> **</b>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:when test="starts-with(., 'LIT')">
                                        <xsl:choose>
                                            <xsl:when
                                                test="document(concat('../../Works/', ., '.xml'))//t:TEI">
                                                <a href="../../Works/{.}">
                                                    <xsl:value-of select="."/>
                                                </a>
                                                
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <b
                                                    style="color:red;
                                                    text-align:center;"
                                                    >**No record for Work <xsl:value-of select="."
                                                    />** = <xsl:value-of select="."/> **</b>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:when test="starts-with(., 'NAR')">
                                        <xsl:choose>
                                            <xsl:when
                                                test="document(concat('../../Narratives/', ., '.xml'))//t:TEI">
                                                <a href="../../Narratives/{.}">
                                                    <xsl:value-of select="."/>
                                                </a>
                                                
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <b
                                                    style="color:red;
                                                    text-align:center;"
                                                    >**No record for Narrative Unit <xsl:value-of select="."
                                                    />** = <xsl:value-of select="."/> **</b>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        
                                        <!--                                            assumes that if none of the above, the id must be of a manuscript-->
                                        <xsl:choose>
                                            <xsl:when
                                                test="document(concat('../../Manuscripts/', ., '.xml'))//t:TEI">
                                                <a href="../../Manuscripts/{.}">
                                                    <xsl:value-of select="."/>
                                                </a>
                                                
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <b
                                                    style="color:red;
                                                    text-align:center;"
                                                    >**No record for Manuscript <xsl:value-of select="."
                                                    />** = <xsl:value-of select="."/> **</b>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:otherwise>
                                </xsl:choose>
                                
                            </xsl:otherwise>
                        </xsl:choose>
                        
                    </xsl:otherwise>
                </xsl:choose>
                
                <xsl:choose>
                    <xsl:when test="contains(@target, ' ')">
                        <xsl:text>nos. </xsl:text>
                        <xsl:for-each select="tokenize(@target, ' ')">
                            <a href="{.}">
                                <xsl:value-of select="concat(substring-after(., '#'), ' ')"/>
                            </a>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                        <a href="{@target}">n. <xsl:value-of select="substring-after(@target, '#')"
                            /></a>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
