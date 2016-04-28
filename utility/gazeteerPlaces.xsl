<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs t"
    version="2.0">
    <xsl:output method="xml" indent="yes"/>
   
    
    <xsl:template match="/">
<xsl:for-each select="//place">     
    <xsl:sort select="position()"/>
    <xsl:variable name="placeID">
            <xsl:value-of
                select="concat('LOC', format-number(position() + 6550, '0000'), substring(name,0,5))"/>
            
        </xsl:variable>
        
        <xsl:result-document method="xml" href="gazetteerxml/{$placeID}.xml">
            <xsl:processing-instruction name="xml-model">
    <xsl:text>href="https://raw.githubusercontent.com/SChAth/schema/master/tei-betamesaheft.rng" 
schematypens="http://relaxng.org/ns/structure/1.0"</xsl:text>
</xsl:processing-instruction>
            <xsl:processing-instruction name="xml-model">
    <xsl:text>href="https://raw.githubusercontent.com/SChAth/schema/master/tei-betamesaheft.rng" 
type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:text>
</xsl:processing-instruction>
            
            <TEI xmlns="http://www.tei-c.org/ns/1.0" xml:id="{$placeID}" type="place" xml:lang="en">
                <teiHeader>
                    <fileDesc>
                        <titleStmt>
                            <title>
                                <xsl:value-of select="substring-before(name, ' /')"/>
                            </title>
                                <editor>
                                    <xsl:attribute name="key">ES</xsl:attribute>
                                </editor>
                            <editor role="generalEditor" key="AB"/>
                            <funder>Akademie der Wissenschaften in Hamburg</funder>
                        </titleStmt>
                        <publicationStmt>
                            <authority>Hiob Ludolf Zentrum für Äthiopistik</authority>
                            <publisher>Die Schriftkultur des christlichen Äthiopiens: Eine
                                multimediale Forschungsumgebung / beta maṣāḥǝft</publisher>
                            <pubPlace>Hamburg</pubPlace>
                            
                            <availability>
                                <licence target="http://creativecommons.org/licenses/by-sa/4.0/">
                                    This file is licensed under the Creative Commons
                                    Attribution-ShareAlike 4.0. </licence>
                            </availability>
                            
                        </publicationStmt>
                        <sourceDesc>
                            <p>A TEI file created from Gazetteer data in Google Drive</p>
                        </sourceDesc>
                    </fileDesc>
                    <profileDesc>
                        <langUsage>
                            <language ident="en">English</language>
                            <language ident="gez">Gǝʿǝz</language>
                        </langUsage>
                    </profileDesc>
                    <revisionDesc>
                        <change who="PL" when="{current-date()}">Created TEI record from spreadsheet</change>
                    </revisionDesc>
                </teiHeader>
                <text>
                    <body>
                        <listPlace>
                            <place>
                                <xsl:attribute name="type">
                                    <xsl:choose>
                                        <xsl:when test=". = '(wär.|wär)'"><xsl:attribute name="type">waradā</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'reg.'"><xsl:attribute name="type">region</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'settl.'"><xsl:attribute name="type">settlement</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'arch. site'"><xsl:attribute name="type">archaeologicalSite</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'shrine'"><xsl:attribute name="type">shrine</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'town'"><xsl:attribute name="type">town</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'reg'"><xsl:attribute name="type">region</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'mon.'"><xsl:attribute name="type">monastery</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'church'"><xsl:attribute name="type">church</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'lake'"><xsl:attribute name="type">lake</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'area'"><xsl:attribute name="type">area</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'riv.'"><xsl:attribute name="type">river</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'mt.'"><xsl:attribute name="type">mountain</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'peninsula'"><xsl:attribute name="type">peninsula</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'mosque'"><xsl:attribute name="type">mosque</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'district'"><xsl:attribute name="type">district</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'valley'"><xsl:attribute name="type">valley</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'state'"><xsl:attribute name="type">state</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'port'"><xsl:attribute name="type">port</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'rel. site'"><xsl:attribute name="type">religiousSite</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'settl'"><xsl:attribute name="type">settlement</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'church/mon.'"><xsl:attribute name="type">church monastery</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'zone'"><xsl:attribute name="type">zone</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'country'"><xsl:attribute name="type">country</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'Gulf of'"><xsl:attribute name="type">gulf</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'qušät'"><xsl:attribute name="type">qušat</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'pass'"><xsl:attribute name="type">pass</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'is.'"><xsl:attribute name="type">island</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'cataract'"><xsl:attribute name="type">cataract</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'kingdom'"><xsl:attribute name="type">kingdom</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'agär'"><xsl:attribute name="type">region</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'fort'"><xsl:attribute name="type">fort</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'spring'"><xsl:attribute name="type">spring</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'plateau'"><xsl:attribute name="type">plateau</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'forest'"><xsl:attribute name="type">forest</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'adm.'"><xsl:attribute name="type">administrativeUnit</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'gulf'"><xsl:attribute name="type">gulf</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'emirate'"><xsl:attribute name="type">emirate</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'railway station'"><xsl:attribute name="type">station</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'plain'"><xsl:attribute name="type">plain</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'rock art site'"><xsl:attribute name="type">rockSite</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'strait'"><xsl:attribute name="type">strait</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'volcano'"><xsl:attribute name="type">volcano</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'city'"><xsl:attribute name="type">city</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'awr.'"><xsl:attribute name="type">awraǧǧā</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'säfär'"><xsl:attribute name="type">district</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'falls'"><xsl:attribute name="type">falls</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'amba'"><xsl:attribute name="type">mountain ambā</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'church of Yosṭinos'"><xsl:attribute name="type">church</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'sultanate'"><xsl:attribute name="type">sultanate</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'sea'"><xsl:attribute name="type">sea</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'mt'"><xsl:attribute name="type">mountain</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'sanctuary'"><xsl:attribute name="type">religiousSite</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'arch. area'"><xsl:attribute name="type">archaeologicalSite</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'cape/reg.'"><xsl:attribute name="type">cape region</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'town/reg.'"><xsl:attribute name="type">town region</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'arch.'"><xsl:attribute name="type">archaeologicalSite</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'rapids'"><xsl:attribute name="type">falls</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'hill'"><xsl:attribute name="type">mountain</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'dere'"><xsl:attribute name="type">district</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'chapel'"><xsl:attribute name="type">chapel</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'zoba'"><xsl:attribute name="type">zoba</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'WAD'"><xsl:attribute name="type">wādī</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'arch.site'"><xsl:attribute name="type">archaeologicalSite</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'hills'"><xsl:attribute name="type">mountain</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'dam'"><xsl:attribute name="type">dam</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'Asmära quarter'"><xsl:attribute name="type">quarter</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'well'"><xsl:attribute name="type">well</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'reg./ethn.'"><xsl:attribute name="type">region</xsl:attribute></xsl:when>
                                        <xsl:when test=". = '(awr./town|awr.town)'"><xsl:attribute name="type">awraǧǧā town</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'site'"><xsl:attribute name="type">site</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'kätäma'"><xsl:attribute name="type">katamā</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'reg., state'"><xsl:attribute name="type">region state</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'mt., reg.'"><xsl:attribute name="type">mountain region</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'oasis'"><xsl:attribute name="type">oasis</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'riv town'"><xsl:attribute name="type">river town</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'quarter Asmära'"><xsl:attribute name="type">quarter</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'riv'"><xsl:attribute name="type">river</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'kingdom/port'"><xsl:attribute name="type">kingdom port</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'sett.'"><xsl:attribute name="type">settlement</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'Cape'"><xsl:attribute name="type">cape</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'reg. Wällo'"><xsl:attribute name="type">region</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'sub-province'"><xsl:attribute name="type">district</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'prov.'"><xsl:attribute name="type">province</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'gorge'"><xsl:attribute name="type">gorge</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'town/prov.'"><xsl:attribute name="type">town province</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'rock-hewn church'"><xsl:attribute name="type">church</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'state / reg'"><xsl:attribute name="type">state region</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'distr.'"><xsl:attribute name="type">district</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'cave'"><xsl:attribute name="type">cave</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'Strait of'"><xsl:attribute name="type">strait</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'town, reg.'"><xsl:attribute name="type">town region</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'station'"><xsl:attribute name="type">station</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'cathedral'"><xsl:attribute name="type">church</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'waterfalls'"><xsl:attribute name="type">falls</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'custom post'"><xsl:attribute name="type">post</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'market'"><xsl:attribute name="type">market</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'temple town'"><xsl:attribute name="type">town</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'temple'"><xsl:attribute name="type">temple</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'planet'"><xsl:attribute name="type">planet</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'fortress'"><xsl:attribute name="type">fort</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'farm'"><xsl:attribute name="type">farm</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'mts.'"><xsl:attribute name="type">mountain</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'land'"><xsl:attribute name="type">region</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'desert'"><xsl:attribute name="type">desert</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'caves'"><xsl:attribute name="type">cave</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'ziyāra'"><xsl:attribute name="type">religiousSite</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'territory'"><xsl:attribute name="type">region</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'reg.site'"><xsl:attribute name="type">region site</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'Gulf'"><xsl:attribute name="type">gulf</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'water falls'"><xsl:attribute name="type">falls</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'Mt.'"><xsl:attribute name="type">mountain</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'qäbäle'"><xsl:attribute name="type">qabale</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'penins.'"><xsl:attribute name="type">peninsula</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'castle'"><xsl:attribute name="type">castle</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'rock site'"><xsl:attribute name="type">rockSite</xsl:attribute></xsl:when>
                                        <xsl:when test=". = 'Bay of'"><xsl:attribute name="type">bay</xsl:attribute></xsl:when>
                                        <xsl:otherwise><xsl:attribute name="type"><xsl:value-of select="type"/></xsl:attribute></xsl:otherwise>
                                        <!--                                        WAD

HLL

LCTY

PPL

CH

SCH

LK

WLL

VAL

MT

SLP

STMI

STM

MSTY

DAM

EST

PASS

VLC

MTS

MSQE

SPNG

PLAT

LKI

CTRR

WTRH

CLF

HLLS

PPLC

RSTN

PK

WLLS

PLN

MILB

ADMF

PP

HSP

SCRP

CTHSE

CRTR

ISL

MSSN

LAVA

RSV

RDGE

DPR

PND

FLTM

MRSH

STDM

RGN

PRK

CMP

PSTB

POOL

FLLS

MKT

CNLN

PAL

FRM

HSPL

HMCK

FORD

MFG

CMTY

RK

AREA

PO

ARCH

HSPC

MN

HTL

RUIN

SPUR

RESW

PPLL

MNMT

LKC

AGRF

GRGE

RVN

TMB

MESA

PT

MLSW

BLDG

CAVE

PS

PSTC

CTRM

PEN
-->
                                    </xsl:choose>
                                </xsl:attribute>
                                <placeName>
                                    <xsl:value-of select="name"/>
                                </placeName>
                               
                                <country>Ethiopia</country>
                                <region>
                                    <xsl:value-of select="region"/>
                                </region>
                                <district>
                                    <xsl:value-of select="district"/>
                                </district>
                                
                                <location>
                                    <geo>
                                        <xsl:value-of select="concat(replace(lat, ' ', ''), ' ', replace(long, ' ', ''))"
                                        />
                                    </geo>
                                </location>
                                <note><xsl:value-of select="value"/>
                                </note>
                                <listBibl type="secondary">
                                    <bibl/>
                                </listBibl>
                            </place>
                        </listPlace>
                    </body>
                </text>
            </TEI>
        </xsl:result-document>

</xsl:for-each>

    </xsl:template>
</xsl:stylesheet>