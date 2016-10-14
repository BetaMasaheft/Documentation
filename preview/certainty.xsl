<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:t="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all" version="2.0">
    <xsl:template match="t:certainty">
        <!--
        need to add support for `certainty` to specify for example that the uncertainty lies with the completeness and not with the title.
        
        e.g. 
        
        <title type="Complete" ref="LIT1716Kidanz"><certainty locus="value" match="../@type" cert="low"></title>
        
        instead of
        
        <title type="Complete" cert="low" ref="LIT1716Kidanz"/>-->
        <a href="#" data-toggle="tooltip" title="The certainty about the {@locus} of {@match} is {@cert}">
            <sup>[!]</sup>
        </a>
    </xsl:template>
</xsl:stylesheet>