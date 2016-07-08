<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml"  exclude-result-prefixes="#all" version="2.0">

    <xsl:template match="t:msDesc">
        <xsl:if test="t:history">
            <div class="row-fluid" id="{@xml:id}history">

                <xsl:apply-templates select="t:history"/>
            </div>
        </xsl:if>

        <xsl:if test="t:physDesc//t:objectDesc/t:supportDesc">
            <div class="row-fluid" id="{@xml:id}dimensions">
                <xsl:apply-templates select="t:physDesc//t:objectDesc/t:supportDesc"/>
            </div>
        </xsl:if>

        <xsl:if test="t:physDesc//t:bindingDesc">
            <div class="row-fluid" id="{@xml:id}binding">
                <xsl:apply-templates select="t:physDesc//t:bindingDesc"/>
            </div>
        </xsl:if>

        <xsl:if test="t:physDesc//t:objectDesc/t:layoutDesc">
            <div class="row-fluid" id="{@xml:id}dimensions">
                <xsl:apply-templates select="t:physDesc//t:objectDesc/t:layoutDesc"/>
            </div>
        </xsl:if>

        <xsl:if test="t:physDesc/t:handDesc">
            <div class="row-fluid" id="{@xml:id}hands">
                <xsl:apply-templates select="t:physDesc/t:handDesc"/>
            </div>
        </xsl:if>

        <xsl:if test="t:msContents">
            <div class="row-fluid" id="{@xml:id}content">
                <xsl:apply-templates select="t:msContents"/>
            </div>
        </xsl:if>

        <xsl:if test="t:physDesc/t:additions">
            <div class="row-fluid" id="{@xml:id}additiones">
                <xsl:apply-templates select="t:physDesc/t:additions"/>
            </div>
        </xsl:if>

        <xsl:if test="t:physDesc/t:decoDesc">
            <div class="row-fluid" id="{@xml:id}decoration">
                <xsl:apply-templates select="t:physDesc/t:decoDesc"/>
            </div>
        </xsl:if>

        <xsl:if test="t:additional">
            <div class="row-fluid" id="{@xml:id}additionals">
                <xsl:apply-templates select="t:additional"/>
            </div>
        </xsl:if>

        <xsl:if test="t:msPart">
            <div class="row-fluid" id="{@xml:id}parts">
                <xsl:apply-templates select="t:msPart"/>
            </div>
        </xsl:if>

        <xsl:if test="t:msFrag">
            <div class="row-fluid" id="{@xml:id}fragments">
                <xsl:apply-templates select="t:msFrag"/>
            </div>
        </xsl:if>

    </xsl:template>

    

    <xsl:template match="t:msPart[parent::t:sourceDesc or parent::t:msDesc]">
        <div class="row-fluid">
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <div class="row-fluid" id="{@xml:id}history">
                <xsl:apply-templates select="t:history"/>
            </div>

            <div class="row-fluid" id="{@xml:id}dimensions">
                <xsl:apply-templates select="t:physDesc//t:objectDesc/t:supportDesc"/>
            </div>

            <div class="row-fluid" id="{@xml:id}binding">
                <xsl:apply-templates select="t:physDesc//t:bindingDesc"/>
            </div>

            <div class="row-fluid" id="{@xml:id}dimensions">
                <xsl:apply-templates select="t:physDesc//t:objectDesc/t:layoutDesc"/>
            </div>

            <div class="row-fluid" id="{@xml:id}hands">
                <xsl:apply-templates select="t:physDesc/t:handDesc"/>
            </div>

            <div  class="row-fluid" id="{@xml:id}content">
                <xsl:apply-templates select="t:msContents"/>
            </div>

            <div class="row-fluid" id="{@xml:id}additiones">
                <xsl:apply-templates select="t:physDesc/t:additions"/>
            </div>

            <div class="row-fluid" id="{@xml:id}decoration">
                <xsl:apply-templates select="t:physDesc/t:decoDesc"/>
            </div>

            <div class="row-fluid" id="{@xml:id}additionals">
                <xsl:apply-templates select="t:additional"/>
            </div>

            <div class="row-fluid" id="{@xml:id}parts">
                <xsl:apply-templates select="t:msPart"/>
            </div>

            <div class="row-fluid" id="{@xml:id}fragments">
                <xsl:apply-templates select="t:msFrag"/>
            </div>

        </div>
        <hr/>
    </xsl:template>

    <xsl:template match="t:msFrag[parent::t:sourceDesc or parent::t:msFrag]">
        <div class="row-fluid">
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <div  class="row-fluid" id="{@xml:id}history">
                <xsl:apply-templates select="t:history"/>
            </div>
            
            <div class="row-fluid" id="{@xml:id}dimensions">
                <xsl:apply-templates select="t:physDesc//t:objectDesc/t:supportDesc"/>
            </div>
            
            <div class="row-fluid" id="{@xml:id}binding">
                <xsl:apply-templates select="t:physDesc//t:bindingDesc"/>
            </div>
            
            <div class="row-fluid" id="{@xml:id}dimensions">
                <xsl:apply-templates select="t:physDesc//t:objectDesc/t:layoutDesc"/>
            </div>
            
            <div class="row-fluid" id="{@xml:id}hands">
                <xsl:apply-templates select="t:physDesc/t:handDesc"/>
            </div>
            
            <div class="row-fluid" id="{@xml:id}content">
                <xsl:apply-templates select="t:msContents"/>
            </div>
            
            <div class="row-fluid" id="{@xml:id}additiones">
                <xsl:apply-templates select="t:physDesc/t:additions"/>
            </div>
            
            <div class="row-fluid" id="{@xml:id}decoration">
                <xsl:apply-templates select="t:physDesc/t:decoDesc"/>
            </div>
            
            <div class="row-fluid" id="{@xml:id}additionals">
                <xsl:apply-templates select="t:additional"/>
            </div>
            
            <div class="row-fluid" id="{@xml:id}parts">
                <xsl:apply-templates select="t:msPart"/>
            </div>
            
            <div class="row-fluid" id="{@xml:id}fragments">
                <xsl:apply-templates select="t:msFrag"/>
            </div>
            
        </div>
        <hr/>
    </xsl:template>

    <xsl:template match="t:msPart[parent::t:msPart]">
        <div class="row-fluid">
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <hr style="border-top: dotted 1px;"/>

            <div class="row-fluid" id="{@xml:id}history">
                <xsl:apply-templates select="t:history"/>
            </div>

            <div class="row-fluid" id="{@xml:id}dimensions">
                <xsl:apply-templates select="t:physDesc//t:objectDesc/t:supportDesc"/>
            </div>

            <div class="row-fluid" id="{@xml:id}binding">
                <xsl:apply-templates select="t:physDesc//t:bindingDesc"/>
            </div>

            <div class="row-fluid" id="{@xml:id}dimensions">
                <xsl:apply-templates select="t:physDesc//t:objectDesc/t:layoutDesc"/>
            </div>

            <div class="row-fluid" id="{@xml:id}hands">
                <xsl:apply-templates select="t:physDesc/t:handDesc"/>
            </div>

            <div class="row-fluid" id="{@xml:id}content">
                <xsl:apply-templates select="t:msContents"/>
            </div>

            <div class="row-fluid" id="{@xml:id}additiones">
                <xsl:apply-templates select="t:physDesc/t:additions"/>
            </div>

            <div class="row-fluid" id="{@xml:id}decoration">
                <xsl:apply-templates select="t:physDesc/t:decoDesc"/>
            </div>

            <div class="row-fluid" id="{@xml:id}additionals">
                <xsl:apply-templates select="t:additional"/>
            </div>

            <div class="row-fluid" id="{@xml:id}parts">
                <xsl:apply-templates select="t:msPart"/>
            </div>

            <div class="row-fluid" id="{@xml:id}fragments">
                <xsl:apply-templates select="t:msFrag"/>
            </div>

        </div>
    </xsl:template>
    
    <xsl:template match="t:msFrag[parent::t:msFrag]">
        <div class="row-fluid" style="padding-left: 50px;">
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <hr style="border-top: dotted 1px;"/>
            
            <div class="row-fluid" id="{@xml:id}history">
                <xsl:apply-templates select="t:history"/>
            </div>
            
            <div class="row-fluid" id="{@xml:id}dimensions">
                <xsl:apply-templates select="t:physDesc//t:objectDesc/t:supportDesc"/>
            </div>
            
            <div class="row-fluid" id="{@xml:id}binding">
                <xsl:apply-templates select="t:physDesc//t:bindingDesc"/>
            </div>
            
            <div class="row-fluid" id="{@xml:id}dimensions">
                <xsl:apply-templates select="t:physDesc//t:objectDesc/t:layoutDesc"/>
            </div>
            
            <div class="row-fluid" id="{@xml:id}hands">
                <xsl:apply-templates select="t:physDesc/t:handDesc"/>
            </div>
            
            <div class="row-fluid" id="{@xml:id}content">
                <xsl:apply-templates select="t:msContents"/>
            </div>
            
            <div class="row-fluid" id="{@xml:id}additiones">
                <xsl:apply-templates select="t:physDesc/t:additions"/>
            </div>
            
            <div class="row-fluid" id="{@xml:id}decoration">
                <xsl:apply-templates select="t:physDesc/t:decoDesc"/>
            </div>
            
            <div class="row-fluid" id="{@xml:id}additionals">
                <xsl:apply-templates select="t:additional"/>
            </div>
            
            <div class="row-fluid" id="{@xml:id}parts">
                <xsl:apply-templates select="t:msPart"/>
            </div>
            
            <div class="row-fluid" id="{@xml:id}fragments">
                <xsl:apply-templates select="t:msFrag"/>
            </div>
            
        </div>
    </xsl:template>


    <xsl:include href="dimensions.xsl"/>
    <xsl:include href="extent.xsl"/>
    <xsl:include href="foliation.xsl"/>
    <xsl:include href="collation.xsl"/>
    <xsl:include href="material.xsl"/>
    <xsl:include href="handNote.xsl"/>
    <xsl:include href="bindingDesc.xsl"/>    
    <xsl:include href="summary.xsl"/>
    <xsl:include href="msItem.xsl"/>
    <xsl:include href="colophon.xsl"/>
    <xsl:include href="condition.xsl"/>
    <xsl:include href="layoutDesc.xsl"/>
    <xsl:include href="additions.xsl"/>
    <xsl:include href="decoDesc.xsl"/>

    <xsl:include href="VARIAsmall.xsl"/><!--includes many templates which don't do much but are all used-->
    

    


</xsl:stylesheet>
