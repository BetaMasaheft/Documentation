<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="2.0">
    <xsl:template match="t:ref">
        <xsl:choose>

<!--this code is uneconomical, but does what it should with a series of nested choices.-->
            <!--            considers if ref is empty or not. start from cases in which is not-->
            <xsl:when test="text()">
                <!--                ref can take type and corresp or target-->
                <xsl:choose>
                    <xsl:when test="@target">
                        <xsl:choose>
                            <!--                            multiple entries-->
                            <xsl:when test="contains(@target, ' ')">
                                <xsl:for-each select="tokenize(@target, ' ')">
                                    <a href="{.}">
                                        <xsl:value-of select="."/>
                                    </a>
                                </xsl:for-each>
                            </xsl:when>
                            <!-- one entry-->
                            <xsl:otherwise>
                                <a href="{@target}"><xsl:value-of select="."/> (<xsl:value-of select="substring-after(@target,'#')"/>)</a>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>

                        <!--assumes corresp and type-->
                        <xsl:choose>

                            <!--                            multiple entries, assumes there is no text inside ref any way.-->
                            <xsl:when test="contains(@corresp, ' ')">

                                <xsl:for-each select="tokenize(@corresp, ' ')">
                                    <xsl:variable name="filename">
                                        <xsl:choose>
                                            <xsl:when test="contains(., '#')">
                                                <xsl:value-of select="substring-before(., '#')"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="."/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:variable>
                                    <!--                                    person-->
                                    <xsl:choose>
                                        <xsl:when test="starts-with($filename, 'PRS')">
                                            <xsl:choose>
                                                <xsl:when
                                                  test="document(concat('../../Persons/', $filename, '.xml'))//t:TEI">
                                                  <a href="../../Persons/{.}">
<!--                                                      this option is in case the person is actually a group   -->
                                                  <xsl:choose>
                                                  <xsl:when
                                                  test="document(concat('../../Persons/', $filename, '.xml'))//t:personGrp">
                                                      <xsl:value-of
                                                          select="document(concat('../../Persons/', $filename, '.xml'))//t:TEI//t:personGrp/t:persName[1]"
                                                      />   
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:value-of
                                                  select="document(concat('../../Persons/', $filename, '.xml'))//t:TEI//t:person/t:persName[1]"
                                                  />
                                                  </xsl:otherwise>
                                                  </xsl:choose>
                                                  </a>

                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <b
                                                  style="color:red;
                                            text-align:center;"
                                                  >**No record for Person <xsl:value-of
                                                  select="$filename"/>** = <xsl:value-of select="."
                                                  /> **</b>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:when>
                                        <xsl:when test="starts-with($filename, 'LOC')">
                                            <xsl:choose>
                                                <xsl:when
                                                  test="document(concat('../../Places/', $filename, '.xml'))//t:TEI">
                                                  <a href="../../Places/{.}">
                                                  <xsl:value-of
                                                  select="document(concat('../../Places/', $filename, '.xml'))//t:TEI//t:place/t:placeName[1]"
                                                  />
                                                  </a>

                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <b
                                                  style="color:red;
                                                text-align:center;"
                                                  >**No record for Place <xsl:value-of
                                                  select="$filename"/>** = <xsl:value-of select="."
                                                  /> **</b>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:when>
                                        <xsl:when test="starts-with($filename, 'INS')">
                                            <xsl:choose>
                                                <xsl:when
                                                  test="document(concat('../../Institutions/', $filename, '.xml'))//t:TEI">
                                                  <a href="../../Institutions/{.}">
                                                  <xsl:value-of
                                                  select="document(concat('../../Institutions/', $filename, '.xml'))//t:TEI//t:place/t:placeName[1]"
                                                  />
                                                  </a>

                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <b
                                                  style="color:red;
                                                        text-align:center;"
                                                  >**No record for Institution <xsl:value-of
                                                  select="$filename"/>** = <xsl:value-of select="."
                                                  /> **</b>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:when>
                                        <xsl:when test="starts-with($filename, 'LIT')">
                                            <xsl:choose>
                                                <xsl:when
                                                  test="document(concat('../../Works/', $filename, '.xml'))//t:TEI">
                                                  <a href="../../Works/{.}">
                                                  <xsl:value-of
                                                  select="document(concat('../../Works/', $filename, '.xml'))//t:TEI//t:titleStmt/t:title[1]"
                                                  />
                                                  </a>

                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <b
                                                  style="color:red;
                                                        text-align:center;"
                                                  >**No record for Work <xsl:value-of
                                                  select="$filename"/>** = <xsl:value-of select="."
                                                  /> **</b>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:when>
                                        <xsl:when test="starts-with($filename, 'NAR')">
                                            <xsl:choose>
                                                <xsl:when
                                                  test="document(concat('../../Narratives/', $filename, '.xml'))//t:TEI">
                                                  <a href="../../Narratives/{.}">
                                                  <xsl:value-of
                                                  select="document(concat('../../Narratives/', $filename, '.xml'))//t:TEI//t:titleStmt/t:title[1]"
                                                  />
                                                  </a>

                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <b
                                                  style="color:red;
                                                        text-align:center;"
                                                  >**No record for Narrative Unit <xsl:value-of
                                                  select="$filename"/>** = <xsl:value-of select="."
                                                  /> **</b>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:when>
                                        <xsl:otherwise>

                                            <!--                                            assumes that if none of the above, the id must be of a manuscript-->
                                            <xsl:choose>
                                                <xsl:when
                                                  test="document(concat('../../Manuscripts/', $filename, '.xml'))//t:TEI">
                                                  <a href="../../Manuscripts/{.}">
                                                  <xsl:value-of
                                                  select="document(concat('../../Manuscripts/', $filename, '.xml'))//t:TEI//t:titleStmt/t:title[1]"
                                                  />
                                                  </a>

                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <b
                                                  style="color:red;
                                                        text-align:center;"
                                                  >**No record for <xsl:value-of select="$filename"
                                                  />** = <xsl:value-of select="."/> **</b>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:for-each>
                            </xsl:when>
                            <!--one entry, it does not loop, thus the attribute node containing the reference is named every time in the functions
                            the text of the reference is the one contained in the source file-->
                            <xsl:otherwise>
                                <xsl:variable name="filename">
                                    <xsl:choose>
                                        <xsl:when test="contains(@corresp, '#')">
                                            <xsl:value-of select="substring-before(@corresp, '#')"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="@corresp"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:choose>
                                    <xsl:when test="starts-with($filename, 'PRS')">
                                        <xsl:choose>
                                            <xsl:when
                                                test="document(concat('../../Persons/', $filename, '.xml'))//t:TEI">
                                                <a href="../../Persons/{@corresp}">
                                                  <xsl:value-of select="."/>
                                                </a>

                                            </xsl:when>
                                            <xsl:otherwise>
                                                <b
                                                  style="color:red;
                                                    text-align:center;"
                                                  >**No record for Person <xsl:value-of
                                                  select="@corresp"/>** = <xsl:value-of select="."/>
                                                  **</b>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:when test="starts-with($filename, 'LOC')">
                                        <xsl:choose>
                                            <xsl:when
                                                test="document(concat('../../Places/', $filename, '.xml'))//t:TEI">
                                                <a href="../../Places/{@corresp}">
                                                  <xsl:value-of select="."/>
                                                </a>

                                            </xsl:when>
                                            <xsl:otherwise>
                                                <b
                                                  style="color:red;
                                                    text-align:center;"
                                                  >**No record for Place <xsl:value-of
                                                  select="@corresp"/>** = <xsl:value-of select="."/>
                                                  **</b>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:when test="starts-with($filename, 'INS')">
                                        <xsl:choose>
                                            <xsl:when
                                                test="document(concat('../../Institutions/', $filename, '.xml'))//t:TEI">
                                                <a href="../../Institutions/{@corresp}">
                                                  <xsl:value-of select="."/>
                                                </a>

                                            </xsl:when>
                                            <xsl:otherwise>
                                                <b
                                                  style="color:red;
                                                    text-align:center;"
                                                  >**No record for Institution <xsl:value-of
                                                  select="@corresp"/>** = <xsl:value-of select="."/>
                                                  **</b>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:when test="starts-with($filename, 'LIT')">
                                        <xsl:choose>
                                            <xsl:when
                                                test="document(concat('../../Works/', $filename, '.xml'))//t:TEI">
                                                <a href="../../Works/{@corresp}">
                                                  <xsl:value-of select="."/>
                                                </a>

                                            </xsl:when>
                                            <xsl:otherwise>
                                                <b
                                                  style="color:red;
                                                    text-align:center;"
                                                  >**No record for Work <xsl:value-of
                                                  select="@corresp"/>** = <xsl:value-of select="."/>
                                                  **</b>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:when test="starts-with($filename, 'NAR')">
                                        <xsl:choose>
                                            <xsl:when
                                                test="document(concat('../../Narratives/', $filename, '.xml'))//t:TEI">
                                                <a href="../../Narratives/{@corresp}">
                                                  <xsl:value-of select="."/>
                                                </a>

                                            </xsl:when>
                                            <xsl:otherwise>
                                                <b
                                                  style="color:red;
                                                    text-align:center;"
                                                  >**No record for Narrative Unit <xsl:value-of
                                                  select="@corresp"/>** = <xsl:value-of select="."/>
                                                  **</b>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:otherwise>

                                        <!--                                            assumes that if none of the above, the id must be of a manuscript-->
                                        <xsl:choose>
                                            <xsl:when
                                                test="document(concat('../../Manuscripts/', $filename, '.xml'))//t:TEI">
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
                                        <xsl:value-of select="concat(substring-after(., '#'), ' ')"
                                        />
                                    </a>
                                </xsl:for-each>
                            </xsl:when>
                            <!-- one entry-->
                            <xsl:otherwise>
                                <a href="{@target}">n. <xsl:value-of
                                        select="substring-after(@target, '#')"/></a>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>



                        <!--assumes corresp and type-->
                        <xsl:choose>
                            <xsl:when test="contains(@corresp, ' ')">

                                <xsl:for-each select="tokenize(@corresp, ' ')">
                                    <xsl:variable name="filename">
                                        <xsl:choose>
                                            <xsl:when test="contains(., '#')">
                                                <xsl:value-of select="substring-before(., '#')"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="."/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:variable>
                                    <!--                                    person-->
                                    <xsl:choose>
                                        <xsl:when test="starts-with($filename, 'PRS')">
                                            <xsl:choose>
                                                <xsl:when
                                                  test="document(concat('../../Persons/', $filename, '.xml'))//t:TEI">
                                                  <a href="../../Persons/{.}">
                                                      <xsl:choose>
                                                          <xsl:when
                                                              test="document(concat('../../Persons/', $filename, '.xml'))//t:personGrp">
                                                              <xsl:value-of
                                                                  select="document(concat('../../Persons/', $filename, '.xml'))//t:TEI//t:personGrp/t:persName[1]"
                                                              />   
                                                          </xsl:when>
                                                          <xsl:otherwise>
                                                  <xsl:value-of
                                                  select="document(concat('../../Persons/', $filename, '.xml'))//t:TEI//t:person/t:persName[1]"
                                                  />
                                                          </xsl:otherwise>
                                                      </xsl:choose>
                                                  </a>

                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <b
                                                  style="color:red;
                                                        text-align:center;"
                                                  >**No record for Person <xsl:value-of
                                                  select="$filename"/>** = <xsl:value-of select="."
                                                  /> **</b>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:when>
                                        <xsl:when test="starts-with($filename, 'LOC')">
                                            <xsl:choose>
                                                <xsl:when
                                                  test="document(concat('../../Places/', $filename, '.xml'))//t:TEI">
                                                  <a href="../../Places/{.}">
                                                  <xsl:value-of
                                                  select="document(concat('../../Places/', $filename, '.xml'))//t:TEI//t:place/t:placeName[1]"
                                                  />
                                                  </a>

                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <b
                                                  style="color:red;
                                                        text-align:center;"
                                                  >**No record for Place <xsl:value-of
                                                  select="$filename"/>** = <xsl:value-of select="."
                                                  /> **</b>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:when>
                                        <xsl:when test="starts-with($filename, 'INS')">
                                            <xsl:choose>
                                                <xsl:when
                                                  test="document(concat('../../Institutions/', $filename, '.xml'))//t:TEI">
                                                  <a href="../../Institutions/{.}">
                                                  <xsl:value-of
                                                  select="document(concat('../../Institutions/', $filename, '.xml'))//t:TEI//t:place/t:placeName[1]"
                                                  />
                                                  </a>

                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <b
                                                  style="color:red;
                                                        text-align:center;"
                                                  >**No record for Institution <xsl:value-of
                                                  select="$filename"/>** = <xsl:value-of select="."
                                                  /> **</b>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:when>
                                        <xsl:when test="starts-with($filename, 'LIT')">
                                            <xsl:choose>
                                                <xsl:when
                                                  test="document(concat('../../Works/', $filename, '.xml'))//t:TEI">
                                                  <a href="../../Works/{.}">
                                                  <xsl:value-of
                                                  select="document(concat('../../Works/', $filename, '.xml'))//t:TEI//t:titleStmt/t:title[1]"
                                                  />
                                                  </a>

                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <b
                                                  style="color:red;
                                                        text-align:center;"
                                                  >**No record for Work <xsl:value-of
                                                  select="$filename"/>** = <xsl:value-of select="."
                                                  /> **</b>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:when>
                                        <xsl:when test="starts-with($filename, 'NAR')">
                                            <xsl:choose>
                                                <xsl:when
                                                  test="document(concat('../../Narratives/', $filename, '.xml'))//t:TEI">
                                                  <a href="../../Narratives/{.}">
                                                  <xsl:value-of
                                                  select="document(concat('../../Narratives/', $filename, '.xml'))//t:TEI//t:titleStmt/t:title[1]"
                                                  />
                                                  </a>

                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <b
                                                  style="color:red;
                                                        text-align:center;"
                                                  >**No record for Narrative Unit <xsl:value-of
                                                  select="$filename"/>** = <xsl:value-of select="."
                                                  /> **</b>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:when>
                                        <xsl:otherwise>

                                            <!--                                            assumes that if none of the above, the id must be of a manuscript-->
                                            <xsl:choose>
                                                <xsl:when
                                                  test="document(concat('../../Manuscripts/', $filename, '.xml'))//t:TEI">
                                                  <a href="../../Manuscripts/{.}">
                                                  <xsl:value-of
                                                  select="document(concat('../../Manuscripts/', $filename, '.xml'))//t:TEI//t:titleStmt/t:title[1]"
                                                  />
                                                  </a>

                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <b
                                                  style="color:red;
                                                        text-align:center;"
                                                  >**No record found for <xsl:value-of
                                                  select="$filename"/>** = <xsl:value-of select="."
                                                  /> **</b>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:for-each>
                            </xsl:when>
                            <xsl:otherwise>
                                <!--one entry-->
                                <xsl:variable name="filename">
                                    <xsl:choose>
                                        <xsl:when test="contains(@corresp, '#')">
                                            <xsl:value-of select="substring-before(@corresp, '#')"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="@corresp"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:choose>

                                    <xsl:when test="starts-with($filename, 'PRS')">
                                        <xsl:choose>
                                            <xsl:when
                                                test="document(concat('../../Persons/', $filename, '.xml'))//t:TEI">
                                                <a href="../../Persons/{@corresp}">
                                                    <xsl:choose>
                                                        <xsl:when
                                                            test="document(concat('../../Persons/', $filename, '.xml'))//t:personGrp">
                                                            <xsl:value-of
                                                                select="document(concat('../../Persons/', $filename, '.xml'))//t:TEI//t:personGrp/t:persName[1]"
                                                            />   
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                  <xsl:value-of
                                                  select="document(concat('../../Persons/', $filename, '.xml'))//t:TEI//t:titleStmt/t:title[1]"
                                                  />
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                    
                                                </a>

                                            </xsl:when>
                                            <xsl:otherwise>
                                                <b
                                                  style="color:red;
                                                    text-align:center;"
                                                  >**No record for Person <xsl:value-of
                                                  select="@corresp"/>**</b>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:when test="starts-with($filename, 'LOC')">
                                        <xsl:choose>
                                            <xsl:when
                                                test="document(concat('../../Places/', $filename, '.xml'))//t:TEI">
                                                <a href="../../Places/{@corresp}">
                                                  <xsl:value-of
                                                  select="document(concat('../../Places/', $filename, '.xml'))//t:TEI//t:titleStmt/t:title[1]"
                                                  />
                                                </a>

                                            </xsl:when>
                                            <xsl:otherwise>
                                                <b
                                                  style="color:red;
                                                    text-align:center;"
                                                  >**No record for Place <xsl:value-of
                                                  select="@corresp"/>**</b>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:when test="starts-with($filename, 'INS')">
                                        <xsl:choose>
                                            <xsl:when
                                                test="document(concat('../../Institutions/', $filename, '.xml'))//t:TEI">
                                                <a href="../../Institutions/{@corresp}">
                                                  <xsl:value-of
                                                  select="document(concat('../../Institutions/', $filename, '.xml'))//t:TEI//t:titleStmt/t:title[1]"
                                                  />
                                                </a>

                                            </xsl:when>
                                            <xsl:otherwise>
                                                <b
                                                  style="color:red;
                                                    text-align:center;"
                                                  >**No record for Institution <xsl:value-of
                                                  select="@corresp"/>**</b>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:when test="starts-with($filename, 'LIT')">
                                        <xsl:choose>
                                            <xsl:when
                                                test="document(concat('../../Works/', $filename, '.xml'))//t:TEI">
                                                <a href="../../Works/{@corresp}">
                                                  <xsl:value-of
                                                  select="document(concat('../../Works/', $filename, '.xml'))//t:TEI//t:titleStmt/t:title[1]"
                                                  />
                                                </a>

                                            </xsl:when>
                                            <xsl:otherwise>
                                                <b
                                                  style="color:red;
                                                    text-align:center;"
                                                  >**No record for Work <xsl:value-of
                                                  select="@corresp"/>**</b>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:when test="starts-with($filename, 'NAR')">
                                        <xsl:choose>
                                            <xsl:when
                                                test="document(concat('../../Narratives/', $filename, '.xml'))//t:TEI">
                                                <a href="../../Narratives/{@corresp}">
                                                  <xsl:value-of
                                                  select="document(concat('../../Narratives/', $filename, '.xml'))//t:TEI//t:titleStmt/t:title[1]"
                                                  />
                                                </a>

                                            </xsl:when>
                                            <xsl:otherwise>
                                                <b
                                                  style="color:red;
                                                    text-align:center;"
                                                  >**No record for Narrative Unit <xsl:value-of
                                                  select="$filename"/>**</b>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:otherwise>

                                        <!--                                            assumes that if none of the above, the id must be of a manuscript-->
                                        <xsl:choose>
                                            <xsl:when
                                                test="document(concat('../../Manuscripts/', $filename, '.xml'))//t:TEI">
                                                <a href="../../Manuscripts/{@corresp}">
                                                  <xsl:value-of
                                                  select="document(concat('../../Manuscripts/', $filename, '.xml'))//t:TEI//t:titleStmt/t:title[1]"
                                                  />
                                                </a>

                                            </xsl:when>
                                            <xsl:otherwise>
                                                <b
                                                  style="color:red;
                                                    text-align:center;"
                                                  >**No record for Manuscript <xsl:value-of
                                                  select="@corresp"/>**</b>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:otherwise>
                                </xsl:choose>

                            </xsl:otherwise>
                        </xsl:choose>

                    </xsl:otherwise>
                </xsl:choose>


            </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="@type"> (<xsl:value-of select="@type"/>) </xsl:if>
    </xsl:template>

</xsl:stylesheet>
