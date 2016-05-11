<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="2.0">
    
    
    <xsl:template match="t:relation" mode="reltable">
        <tr>
            <th>
                <xsl:value-of select="@active"/>
            </th>
            <th>
                <xsl:value-of select="@name"/>
            </th>
            <th>
                <xsl:value-of select="@passive"/>
            </th>
        </tr>
    </xsl:template>



    <xsl:template mode="graph" match="t:listRelation | t:listBibl[@type = 'relations']">


        <div id="BetMesRelView"/>

        <script type="text/javascript">
            // create an array with nodes
            var nodes = new vis.DataSet([
            <xsl:variable name="list">
                <xsl:for-each select="t:relation">
<!--                    this needs to stay here in order to process all the relation nodes in one time, sequence them and remove doubles-->

                    <!--                    pick up node labels from files for @active-->
                    
                    <!--needs more cases for multiple entries in active and passive-->
                    <xsl:for-each select="@active">
                        <xsl:variable name="filename" select="substring-after(., '#')"/>
                    <xsl:variable name="id">
                        <xsl:choose>
                            <xsl:when test="starts-with($filename, 'INS') or starts-with($filename, 'PRS') or starts-with($filename, 'LOC') or starts-with($filename, 'LIT') or starts-with($filename, 'NAR')">
                                <xsl:analyze-string select="$filename" regex="((\w{{3}})(\d+))(\w+)">
                            <xsl:matching-substring><xsl:value-of select="regex-group(1)"/></xsl:matching-substring>
                            <xsl:non-matching-substring><xsl:value-of select="."/></xsl:non-matching-substring>
                        </xsl:analyze-string></xsl:when>
                            <xsl:otherwise><xsl:value-of select="$filename"/></xsl:otherwise></xsl:choose>
                    </xsl:variable> 
                        <xsl:variable name="path" select="
                            if ($filename = document('../../Authority-Files/taxonomy.xml')//t:catDesc)
                            then
                            ('Authority-Files')
                            else
                            (
                            if (starts-with($filename, 'PRS'))
                                then
                                    ('Persons')
                                else
                                    (
                                    if (starts-with($filename, 'LOC'))
                                    then
                                        ('Places')
                                    else
                                        (
                                        if (starts-with($filename, 'INS'))
                                        then
                                            ('Institutions')
                                        else
                                            (
                                            if (starts-with($filename, 'LIT'))
                                            then
                                                ('Works')
                                            else
                                                (
                                                if (starts-with($filename, 'NAR'))
                                                then
                                                    ('Narrative')
                                                else
                                                    ('Manuscripts')
                                                )
                                            )
                                        )
                                    )
                                    )
                                "/>
                        <xsl:variable name="label" select="document(concat('../../', $path, '/', $filename, '.xml'))//t:TEI"/>
                        <temp>{id:"<xsl:value-of select="$id"/>", label:"<xsl:choose>
                            <xsl:when test="starts-with($filename, 'PRS')"><xsl:value-of select="normalize-space($label//t:person/t:persName[1])"/></xsl:when>
                            <xsl:when test="starts-with($filename, 'LOC')"><xsl:value-of select="normalize-space($label//t:place/t:placeName[1])"/></xsl:when>
                            <xsl:when test="starts-with($filename, 'INS')"><xsl:value-of select="normalize-space($label//t:place/t:placeName[1])"/></xsl:when>
                            <xsl:when test="starts-with($filename, 'LIT')"><xsl:value-of select="normalize-space(replace($label//t:titleStmt/t:title[@xml:id = 't1'], '&quot;', ' '))"/></xsl:when>
                            <xsl:when test="starts-with($filename, 'NAR')"><xsl:value-of select="normalize-space(replace($label//t:titleStmt/t:title[1], '&quot;', ' '))"/></xsl:when>
                            <xsl:otherwise><xsl:value-of select="normalize-space(replace($label//t:titleStmt/t:title[1], '&quot;', ' '))"/></xsl:otherwise>
                        </xsl:choose>"},</temp> 
                </xsl:for-each>
       
       
<!--       pick up labels from files for @passive -->
                    
                    
                    <xsl:for-each select="tokenize(@passive, ' ')">
                        <xsl:variable name="filename" select="substring-after(., '#')"/>
                        <xsl:variable name="id">
                            <xsl:choose>
                                <xsl:when test="starts-with($filename, 'INS') or starts-with($filename, 'PRS') or starts-with($filename, 'LOC') or starts-with($filename, 'LIT') or starts-with($filename, 'NAR')">
                            <xsl:analyze-string select="$filename" regex="((\w{{3}})(\d+))(\w+)">
                                <xsl:matching-substring><xsl:value-of select="regex-group(1)"/></xsl:matching-substring>
                                <xsl:non-matching-substring><xsl:value-of select="."/></xsl:non-matching-substring>
                            </xsl:analyze-string>
                            </xsl:when>
                                <xsl:otherwise><xsl:value-of select="$filename"/></xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <xsl:variable name="path" select="
                            if ($filename = document('../../Authority-Files/taxonomy.xml')//t:catDesc)
                            then
                            ('Authority-Files')
                            else
                            (if (starts-with($filename, 'PRS'))
                                then
                                    ('Persons')
                                else
                                    (
                                    if (starts-with($filename, 'LOC'))
                                    then
                                        ('Places')
                                    else
                                        (
                                        if (starts-with($filename, 'INS'))
                                        then
                                            ('Institutions')
                                        else
                                            (
                                            if (starts-with($filename, 'LIT'))
                                            then
                                                ('Works')
                                            else
                                                (
                                                if (starts-with($filename, 'NAR'))
                                                then
                                                    ('Narrative')
                                                else
                                                    ('Manuscripts')
                                                )
                                            )
                                        )
                                    )
                                    )
                                "/>
                        <xsl:variable name="label" select="document(concat('../../', $path, '/', $filename, '.xml'))//t:TEI"/>
                        <temp>{id:"<xsl:value-of select="$id"/>", label:"<xsl:choose>
                            <xsl:when test="starts-with($filename, 'PRS')"><xsl:value-of select="normalize-space($label//t:person/t:persName[1])"/></xsl:when>
                            <xsl:when test="starts-with($filename, 'LOC')"><xsl:value-of select="normalize-space($label//t:place/t:placeName[1])"/></xsl:when>
                            <xsl:when test="starts-with($filename, 'INS')"><xsl:value-of select="normalize-space($label//t:place/t:placeName[1])"/></xsl:when>
                            <xsl:when test="starts-with($filename, 'LIT')"><xsl:value-of select="normalize-space(replace($label//t:titleStmt/t:title[@xml:id = 't1'], '&quot;', ' '))"/></xsl:when>
                            <xsl:when test="starts-with($filename, 'NAR')"><xsl:value-of select="normalize-space(replace($label//t:titleStmt/t:title[1], '&quot;', ' '))"/></xsl:when>
                            <xsl:otherwise><xsl:value-of select="normalize-space(replace($label//t:titleStmt/t:title[1], '&quot;', ' '))"/></xsl:otherwise>
                        </xsl:choose>"},</temp> 
                    </xsl:for-each>
                
                
                
                    <!--       pick up labels from files for @mutual -->
                    
                    
                <xsl:for-each select="tokenize(@mutual, ' ')">
                    <xsl:variable name="filename" select="substring-after(., '#')"/>
                    <xsl:variable name="id">
                        <xsl:choose>
                            <xsl:when test="starts-with($filename, 'INS') or starts-with($filename, 'PRS') or starts-with($filename, 'LOC') or starts-with($filename, 'LIT') or starts-with($filename, 'NAR')">
                                
                                <xsl:analyze-string select="$filename" regex="((\w{{3}})(\d+))(\w+)">
                            <xsl:matching-substring><xsl:value-of select="regex-group(1)"/></xsl:matching-substring>
                            
                            <xsl:non-matching-substring><xsl:value-of select="."/></xsl:non-matching-substring>
                        </xsl:analyze-string>
                            </xsl:when>
                            <xsl:otherwise><xsl:value-of select="$filename"/></xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:variable name="path" select="
                        if ($filename = document('../../Authority-Files/taxonomy.xml')//t:catDesc)
                        then
                        ('Authority-Files')
                        else
                        ( 
                        if (starts-with($filename, 'PRS'))
                                then
                                    ('Persons')
                                else
                                    (
                                    if (starts-with($filename, 'LOC'))
                                    then
                                        ('Places')
                                    else
                                        (
                                        if (starts-with($filename, 'INS'))
                                        then
                                            ('Institutions')
                                        else
                                            (
                                            if (starts-with($filename, 'LIT'))
                                            then
                                                ('Works')
                                            else
                                                (
                                                if (starts-with($filename, 'NAR'))
                                                then
                                                    ('Narrative')
                                                else
                                                    ('Manuscripts')
                                                )
                                            )
                                        )
                                    )
                                    )
                                "/>
                    <xsl:variable name="label" select="document(concat('../../', $path, '/', $filename, '.xml'))//t:TEI"/>
                    <temp>{id:"<xsl:value-of select="$id"/>", label:"<xsl:choose>
                        <xsl:when test="starts-with($filename, 'PRS')"><xsl:value-of select="normalize-space($label//t:person/t:persName[1])"/></xsl:when>
                        <xsl:when test="starts-with($filename, 'LOC')"><xsl:value-of select="normalize-space($label//t:place/t:placeName[1])"/></xsl:when>
                        <xsl:when test="starts-with($filename, 'INS')"><xsl:value-of select="normalize-space($label//t:place/t:placeName[1])"/></xsl:when>
                        <xsl:when test="starts-with($filename, 'LIT')"><xsl:value-of select="normalize-space(replace($label//t:titleStmt/t:title[@xml:id = 't1'], '&quot;', ' '))"/></xsl:when>
                        <xsl:when test="starts-with($filename, 'NAR')"><xsl:value-of select="normalize-space(replace($label//t:titleStmt/t:title[1], '&quot;', ' '))"/></xsl:when>
                        <xsl:otherwise><xsl:value-of select="normalize-space(replace($label//t:titleStmt/t:title[1], '&quot;', ' '))"/></xsl:otherwise>
                    </xsl:choose>"},</temp> 
                </xsl:for-each>
                </xsl:for-each>
            </xsl:variable>
            
<!--            prints each of the strings above with id and label only once-->
               <xsl:for-each select="distinct-values($list/t:temp)">
                   <xsl:value-of select="."/>
               </xsl:for-each>
           
           
            ]);
            
     <!-- edges-->      
            var edges = new vis.DataSet([
            
            <xsl:apply-templates mode="graphedges" select="//t:relation"/>
            ]);
            
            
            
            // create a network
            var container = document.getElementById('BetMesRelView');
            var data = {
            nodes: nodes,
            edges: edges
            };
            var options = {
            layout:{
            improvedLayout:false
            },
            edges: {
            smooth: {
            enabled: false,
            type: "dynamic",
            //   roundness: 0.7
            },
            },
            physics: {
            stabilization: {
            enabled: false,
            iterations: 10000, // maximum number of iteration to stabilize
            updateInterval: 5,
            onlyDynamicEdges: false,
            fit: true
            },
            }
            };
            options={
            layout:{
            improvedLayout:true
            },
            physics: {
            stabilization: {
            enabled: false}
            }
            };
            var network = new vis.Network(container, data, options);
        </script>

    </xsl:template>


    


 
    <xsl:template mode="graphedges" match="t:relation">


        <xsl:if test="@active">
            <!--needs more cases for multiple entries in active and passive-->
            
            <xsl:variable name="activeid">
                <xsl:variable name="filenameac" select="substring-after(@active, '#')"/>
                <xsl:choose>
                    <xsl:when test="starts-with($filenameac, 'INS') or starts-with($filenameac, 'PRS') or starts-with($filenameac, 'LOC') or starts-with($filenameac, 'LIT') or starts-with($filenameac, 'NAR')">
                <xsl:analyze-string select="$filenameac" regex="((\w{{3}})(\d+))(\w+)">
                    <xsl:matching-substring>
                        <xsl:value-of select="regex-group(1)"/>
                    </xsl:matching-substring>
                    <xsl:non-matching-substring><xsl:value-of select="."
                        /></xsl:non-matching-substring>
                </xsl:analyze-string>
                </xsl:when>
                <xsl:otherwise><xsl:value-of select="$filenameac"/></xsl:otherwise></xsl:choose>
            </xsl:variable>
            
            
            <xsl:variable name="passiveid">
                <xsl:variable name="filenamepa" select="substring-after(@passive, '#')"/>
                <xsl:choose>
                    <xsl:when test="starts-with($filenamepa, 'INS') or starts-with($filenamepa, 'PRS') or starts-with($filenamepa, 'LOC') or starts-with($filenamepa, 'LIT') or starts-with($filenamepa, 'NAR')">
                 <xsl:analyze-string select="$filenamepa" regex="((\w{{3}})(\d+))(\w+)">
                    <xsl:matching-substring>
                        <xsl:value-of select="regex-group(1)"/>
                    </xsl:matching-substring>
                    <xsl:non-matching-substring><xsl:value-of select="."
                        /></xsl:non-matching-substring>
                </xsl:analyze-string>
                    </xsl:when>
                    <xsl:otherwise><xsl:value-of select="$filenamepa"/></xsl:otherwise>
                </xsl:choose>
            </xsl:variable> 
            
            {from: "<xsl:value-of select="$activeid"/>", to: "<xsl:value-of
                select="$passiveid"/>" , label:"<xsl:value-of select="@name"/>"}, </xsl:if>


        <xsl:if test="@mutual">
            <xsl:variable name="mutualid">
                <xsl:for-each select="tokenize(@mutual, ' ')">
                    <xsl:variable name="filename" select="substring-after(., '#')"/>
                    <xsl:choose>
                        <xsl:when test="starts-with($filename, 'INS') or starts-with($filename, 'PRS') or starts-with($filename, 'LOC') or starts-with($filename, 'LIT') or starts-with($filename, 'NAR')">
                            
                    <xsl:analyze-string select="." regex="((\w{{3}})(\d+))(\w+)">
                        <xsl:matching-substring>
                            <temp><xsl:value-of select="regex-group(1)"
                            /></temp></xsl:matching-substring>
                        <xsl:non-matching-substring><xsl:value-of select="."
                            /></xsl:non-matching-substring>
                    </xsl:analyze-string>
                        </xsl:when>
                        <xsl:otherwise><xsl:value-of select="$filename"/></xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:variable> 
            
            {from: "<xsl:value-of select="$mutualid/t:temp[position() = 1]"/>", to:
                "<xsl:value-of select="$mutualid/t:temp[position() = 2]"/>" , label:"<xsl:value-of
                select="@name"/>"}, {from: "<xsl:value-of select="$mutualid/t:temp[position() = 2]"
            />", to: "<xsl:value-of select="$mutualid/t:temp[position() = 1]"/>" ,
                label:"<xsl:value-of select="@name"/>"}, <!--needs more cases for multiple entries-->
            <!--  <xsl:if test="$mutualid/t:temp[position()>2]">
            {from: "<xsl:value-of select="$mutualid/t:temp[position()=1]"/>", to: "<xsl:value-of
                select="$mutualid/t:temp[position()=2]"/>" , label:"<xsl:value-of select="@name"/>"},
        </xsl:if>-->
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
