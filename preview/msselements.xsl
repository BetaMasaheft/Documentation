<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:t="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all" version="2.0">
    <xsl:template match="t:msDesc">
        <xsl:if test="t:msContents/t:summary">
            <xsl:apply-templates select="t:msContents/t:summary"/>
        </xsl:if>
        <xsl:if test="t:history">
            <div id="{@xml:id}history">
                <xsl:apply-templates select="t:history"/>
            </div>
        </xsl:if>
        <xsl:if test="t:physDesc//t:objectDesc/t:supportDesc">
            <div id="{@xml:id}dimensions">
                <xsl:apply-templates select="t:physDesc//t:objectDesc/t:supportDesc"/>
            </div>
        </xsl:if>
        <xsl:if test="t:physDesc//t:bindingDesc">
            <div id="{@xml:id}binding">
                <xsl:apply-templates select="t:physDesc//t:bindingDesc"/>
            </div>
        </xsl:if>
        <xsl:if test="t:physDesc//t:objectDesc/t:layoutDesc">
            <div id="{@xml:id}dimensions">
                <xsl:apply-templates select="t:physDesc//t:objectDesc/t:layoutDesc"/>
            </div>
        </xsl:if>
        <xsl:if test="t:physDesc/t:handDesc">
            <div id="{@xml:id}hands">
                <xsl:apply-templates select="t:physDesc/t:handDesc"/>
            </div>
        </xsl:if>
        <xsl:if test="t:msContents">
            <div id="{@xml:id}content">
                <xsl:apply-templates select="t:msContents except t:summary"/>
            </div>
        </xsl:if>
        <xsl:if test="t:physDesc/t:additions">
            <div id="{@xml:id}additiones">
                <xsl:apply-templates select="t:physDesc/t:additions"/>
            </div>
        </xsl:if>
        <xsl:if test="t:physDesc/t:decoDesc">
            <div id="{@xml:id}decoration">
                <xsl:apply-templates select="t:physDesc/t:decoDesc"/>
            </div>
        </xsl:if>
        <xsl:if test="t:additional">
            <div id="{@xml:id}additionals">
                <xsl:apply-templates select="t:additional"/>
            </div>
        </xsl:if>
        <xsl:if test="t:msPart">
            <div id="{@xml:id}parts">
                <xsl:apply-templates select="t:msPart"/>
            </div>
        </xsl:if>
        <xsl:if test="t:msFrag">
            <div id="{@xml:id}fragments">
                <xsl:apply-templates select="t:msFrag"/>
            </div>
        </xsl:if>
    </xsl:template>
    <xsl:template match="t:msPart[parent::t:sourceDesc or parent::t:msDesc]">
        <div>
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <div class="row">
                <h2>Codicological Unit <xsl:value-of select="substring-after(@xml:id, 'p')"/>
                </h2>
            </div>
            <xsl:if test="t:msContents/t:summary">
                <xsl:apply-templates select="t:msContents/t:summary"/>
            </xsl:if>
            <div id="{@xml:id}history">
                <xsl:apply-templates select="t:history"/>
            </div>
            <div id="{@xml:id}dimensions">
                <xsl:apply-templates select="t:physDesc//t:objectDesc/t:supportDesc"/>
            </div>
            <div id="{@xml:id}binding">
                <xsl:apply-templates select="t:physDesc//t:bindingDesc"/>
            </div>
            <div id="{@xml:id}dimensions">
                <xsl:apply-templates select="t:physDesc//t:objectDesc/t:layoutDesc"/>
            </div>
            <div id="{@xml:id}hands">
                <xsl:apply-templates select="t:physDesc/t:handDesc"/>
            </div>
            <div id="{@xml:id}content">
                <xsl:apply-templates select="t:msContents except t:summary"/>
            </div>
            <div id="{@xml:id}additiones">
                <xsl:apply-templates select="t:physDesc/t:additions"/>
            </div>
            <div id="{@xml:id}decoration">
                <xsl:apply-templates select="t:physDesc/t:decoDesc"/>
            </div>
            <div id="{@xml:id}additionals">
                <xsl:apply-templates select="t:additional"/>
            </div>
            <div id="{@xml:id}parts">
                <xsl:apply-templates select="t:msPart"/>
            </div>
            <div id="{@xml:id}fragments">
                <xsl:apply-templates select="t:msFrag"/>
            </div>
        </div>
        <hr/>
    </xsl:template>
    <xsl:template match="t:msFrag[parent::t:sourceDesc or parent::t:msFrag]">
        <div>
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <xsl:if test="t:msContents/t:summary">
                <xsl:apply-templates select="t:msContents/t:summary"/>
            </xsl:if>
            <div id="{@xml:id}history">
                <xsl:apply-templates select="t:history"/>
            </div>
            <div id="{@xml:id}dimensions">
                <xsl:apply-templates select="t:physDesc//t:objectDesc/t:supportDesc"/>
            </div>
            <div id="{@xml:id}binding">
                <xsl:apply-templates select="t:physDesc//t:bindingDesc"/>
            </div>
            <div id="{@xml:id}dimensions">
                <xsl:apply-templates select="t:physDesc//t:objectDesc/t:layoutDesc"/>
            </div>
            <div id="{@xml:id}hands">
                <xsl:apply-templates select="t:physDesc/t:handDesc"/>
            </div>
            <div id="{@xml:id}content">
                <xsl:apply-templates select="t:msContents except t:summary"/>
            </div>
            <div id="{@xml:id}additiones">
                <xsl:apply-templates select="t:physDesc/t:additions"/>
            </div>
            <div id="{@xml:id}decoration">
                <xsl:apply-templates select="t:physDesc/t:decoDesc"/>
            </div>
            <div id="{@xml:id}additionals">
                <xsl:apply-templates select="t:additional"/>
            </div>
            <div id="{@xml:id}parts">
                <xsl:apply-templates select="t:msPart"/>
            </div>
            <div id="{@xml:id}fragments">
                <xsl:apply-templates select="t:msFrag"/>
            </div>
        </div>
        <hr/>
    </xsl:template>
    <xsl:template match="t:msPart[parent::t:msPart]">
        <div class="msPart">
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <hr class="msParts"/>
            <xsl:if test="t:msContents/t:summary">
                <xsl:apply-templates select="t:msContents/t:summary"/>
            </xsl:if>
            <div id="{@xml:id}history">
                <xsl:apply-templates select="t:history"/>
            </div>
            <div id="{@xml:id}dimensions">
                <xsl:apply-templates select="t:physDesc//t:objectDesc/t:supportDesc"/>
            </div>
            <div id="{@xml:id}binding">
                <xsl:apply-templates select="t:physDesc//t:bindingDesc"/>
            </div>
            <div id="{@xml:id}dimensions">
                <xsl:apply-templates select="t:physDesc//t:objectDesc/t:layoutDesc"/>
            </div>
            <div id="{@xml:id}hands">
                <xsl:apply-templates select="t:physDesc/t:handDesc"/>
            </div>
            <div id="{@xml:id}content">
                <xsl:apply-templates select="t:msContents except t:summary"/>
            </div>
            <div id="{@xml:id}additiones">
                <xsl:apply-templates select="t:physDesc/t:additions"/>
            </div>
            <div id="{@xml:id}decoration">
                <xsl:apply-templates select="t:physDesc/t:decoDesc"/>
            </div>
            <div id="{@xml:id}additionals">
                <xsl:apply-templates select="t:additional"/>
            </div>
            <div id="{@xml:id}parts">
                <xsl:apply-templates select="t:msPart"/>
            </div>
            <div id="{@xml:id}fragments">
                <xsl:apply-templates select="t:msFrag"/>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="t:msFrag[parent::t:msFrag]">
        <div class="msFrag">
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <hr class="msParts"/>
            <xsl:if test="t:msContents/t:summary">
                <xsl:apply-templates select="t:msContents/t:summary"/>
            </xsl:if>
            <div id="{@xml:id}history">
                <xsl:apply-templates select="t:history"/>
            </div>
            <div id="{@xml:id}dimensions">
                <xsl:apply-templates select="t:physDesc//t:objectDesc/t:supportDesc"/>
            </div>
            <div id="{@xml:id}binding">
                <xsl:apply-templates select="t:physDesc//t:bindingDesc"/>
            </div>
            <div id="{@xml:id}dimensions">
                <xsl:apply-templates select="t:physDesc//t:objectDesc/t:layoutDesc"/>
            </div>
            <div id="{@xml:id}hands">
                <xsl:apply-templates select="t:physDesc/t:handDesc"/>
            </div>
            <div id="{@xml:id}content">
                <xsl:apply-templates select="t:msContents except t:summary"/>
            </div>
            <div id="{@xml:id}additiones">
                <xsl:apply-templates select="t:physDesc/t:additions"/>
            </div>
            <div id="{@xml:id}decoration">
                <xsl:apply-templates select="t:physDesc/t:decoDesc"/>
            </div>
            <div id="{@xml:id}additionals">
                <xsl:apply-templates select="t:additional"/>
            </div>
            <div id="{@xml:id}parts">
                <xsl:apply-templates select="t:msPart"/>
            </div>
            <div id="{@xml:id}fragments">
                <xsl:apply-templates select="t:msFrag"/>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>