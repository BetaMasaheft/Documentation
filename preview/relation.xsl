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

    <xsl:template match="t:listRelation | t:listBibl[@type = 'relations']">


        <div id="BetMesRelView"/>

        <script type="text/javascript">
            // create an array with nodes
            var nodes = new vis.DataSet([
            <xsl:variable name="list">
                <xsl:for-each select="t:relation">
                    
                    <!--needs more cases for multiple entries in active and passive-->
                    <xsl:for-each select="@active | @passive">
                    <xsl:variable name="id">
                        <xsl:analyze-string select="." regex="((\w{{3}})(\d+))(\w+)">
                            <xsl:matching-substring><xsl:value-of select="regex-group(1)"
                            /></xsl:matching-substring>
                        </xsl:analyze-string>
                    </xsl:variable> 
                    <temp>{id:"<xsl:value-of select="$id"/>", label:"<xsl:value-of select="substring-after(.,'#')"/>"},</temp> 
                </xsl:for-each>
                
                <xsl:for-each select="tokenize(@mutual, ' ')">
                    <xsl:variable name="id">
                        <xsl:analyze-string select="." regex="((\w{{3}})(\d+))(\w+)">
                            <xsl:matching-substring><xsl:value-of select="regex-group(1)"
                            /></xsl:matching-substring>
                        </xsl:analyze-string>
                    </xsl:variable>
                    <temp>{id:"<xsl:value-of select="$id"/>", label:"<xsl:value-of select="substring-after(.,'#')"/>"},</temp> 
                </xsl:for-each></xsl:for-each>
            </xsl:variable>
               <xsl:for-each select="distinct-values($list/t:temp)">
                   <xsl:value-of select="."/>
               </xsl:for-each>
           
           
            ]);
            
            
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


    <xsl:template mode="graphnodes" match="t:relation">
        
        
<!--<xsl:variable name="list2">
    <xsl:sequence select="$list"/>
</xsl:variable>
        <xsl:for-each select="$list2/t:temp">
            <xsl:value-of select="distinct-values(normalize-space(@id))"/><xsl:text>, </xsl:text>
        </xsl:for-each>-->
    

    </xsl:template>



    <xsl:template mode="graphedges" match="t:relation">
        

        <xsl:if test="@active">
            <!--needs more cases for multiple entries in active and passive-->
            
            <xsl:variable name="activeid">
                <xsl:analyze-string select="@active" regex="((\w{{3}})(\d+))(\w+)">
                <xsl:matching-substring>
                    <xsl:value-of select="regex-group(1)"/>
                </xsl:matching-substring>
            </xsl:analyze-string>
        </xsl:variable>
        <xsl:variable name="passiveid">
            <xsl:analyze-string select="@passive" regex="((\w{{3}})(\d+))(\w+)">
                <xsl:matching-substring>
                    <xsl:value-of select="regex-group(1)"/>
                </xsl:matching-substring>
            </xsl:analyze-string>
        </xsl:variable>
            
            {from: "<xsl:value-of select="$activeid"/>", to: "<xsl:value-of
                select="$passiveid"/>" , label:"<xsl:value-of select="@name"/>"}, 
        
        </xsl:if>


        <xsl:if test="@mutual">
            <xsl:variable name="mutualid">
                <xsl:for-each select="tokenize(@mutual, ' ')">
                    <xsl:analyze-string select="." regex="((\w{{3}})(\d+))(\w+)">
                                <xsl:matching-substring>
                                    <temp><xsl:value-of select="regex-group(1)"
                                    /></temp></xsl:matching-substring>
                            </xsl:analyze-string>
                    
                </xsl:for-each>
            </xsl:variable> {from: "<xsl:value-of select="$mutualid/t:temp[position()=1]"/>", to: "<xsl:value-of
                select="$mutualid/t:temp[position()=2]"/>" , label:"<xsl:value-of select="@name"/>"},
            {from: "<xsl:value-of select="$mutualid/t:temp[position()=2]"/>", to: "<xsl:value-of
                select="$mutualid/t:temp[position()=1]"/>" , label:"<xsl:value-of select="@name"/>"},
            
            <!--needs more cases for multiple entries-->
            <!--  <xsl:if test="$mutualid/t:temp[position()>2]">
            {from: "<xsl:value-of select="$mutualid/t:temp[position()=1]"/>", to: "<xsl:value-of
                select="$mutualid/t:temp[position()=2]"/>" , label:"<xsl:value-of select="@name"/>"},
        </xsl:if>-->
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
