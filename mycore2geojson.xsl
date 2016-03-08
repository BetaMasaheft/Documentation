<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">
    <xsl:output method="text"/>
    
    <xsl:template match="/">
        <xsl:result-document method="text" href="json/{mycoreobject/@ID}.json">   {
        "bbox": [
        <xsl:value-of select="//longitude"/>, 
        <xsl:value-of select="//latitude"/>,
        <xsl:value-of select="//longitude"/>,
        <xsl:value-of select="//latitude"/>
        ],
        "citation": "EthioSphere project Institution placename <xsl:value-of select="mycoreobject/@ID"/>",
            "connectsWith": [
            "39274",
            "<xsl:value-of select="//area"/>",
        "<xsl:value-of select="normalize-space(//town)"/>"
            ],
            "contributors": [
            {
            "name": "Jefferey Becker",
            "username": "jbecker"
            },
            {
            "name": "Sean Gillies",
            "username": "sgillies"
            },
            {
            "name": "Tom Elliott",
            "orcid": "0000-0002-4114-6677",
            "username": "thomase",
            "viaf": "309842724"
            },
            {
            "name": "Richard Talbert",
            "username": "rtalbert",
            "viaf": "59162760"
            },
            {
            "name": "Pietro Liuzzo",
            "username": "pliuzzo",
            "viaf": "310697060"
            }
            ],
            "creators": [
            {
            "name": "Eugenia Sokolinski",
            "viaf": "313449704"
            },
            {
            "name": "Denis Nosnitsin",
            "viaf": "17529544"
            }
            ],
            "description": "<xsl:value-of select="normalize-space(//txfndate)"/>",
            "details": "<xsl:value-of select="normalize-space(//condition)"/>",
            "features": [
            {
            "geometry": {
            "coordinates": [
            <xsl:value-of select="//longitude"/>,
            <xsl:value-of select="//latitude"/>
            ],
            "type": "Point"
            },
            "id": "location-of-Ladesta-Ins",
            "properties": {
            "description": "Location based on Etiosphere",
            "link": "",
            "location_precision": "precise",
            "snippet": "Island, ; AD <xsl:value-of select="//foundationdate"/> - AD <xsl:value-of select="//foundtodate"/>",
            "title": "location of <xsl:value-of select="//name"/>"
            },
            "type": "Feature"
            }
            ],
            "history": [
            {
            "comment": "Mapped to Json from mycore xml",
            "modified": "<xsl:value-of select="current-dateTime()"/>",
            "principal": "pliuzzo"
            }
            ],
            "id": "<xsl:value-of select="//mycoreobject/@ID"/>",
            "names": [
            {
            "association_certainty": "certain",
            "attested": "",
            "contributors": [
            {
            "name": "Pietro Liuzzo",
            "username": "pliuzzo",
            "viaf": "310697060"
            }
            ],
            "creators": [
            {
            "name": "Eugenia Sokolinski",
            "viaf": "313449704"
            },
            {
            "name": "Denis Nosnitsin",
            "viaf": "17529544"
            }
            ],
            "description": "<xsl:value-of select="normalize-space(replace(//description, '&quot;', ' '))"/>",
            "during": [
            ""
            ],
            "end_date": "<xsl:value-of select="//foundtodate"/>",
            "language": "",
            "name_type": "geographic",
            "provenance": "",
            "romanized": "<xsl:value-of select="normalize-space(//altname)"/>",
            "start_date": "<xsl:value-of select="//foundationdate"/>",
            "transcription_accuracy": "accurate",
            "transcription_completeness": "complete",
            "uri": ""
            },
            {
            "association_certainty": "certain",
            "attested": "",
            "contributors": [
            {
            "name": "Pietro Liuzzo",
            "username": "pliuzzo",
            "viaf": "310697060"
            }
            ],
            "creators": [
            {
            "name": "Eugenia Sokolinski",
            "viaf": "313449704"
            },
            {
            "name": "Denis Nosnitsin",
            "viaf": "17529544"
            }
            ],
            "description": "",
        "during": [
        ""
        ],
        "end_date": "<xsl:value-of select="//foundtodate"/>",
        "language": "",
        "name_type": "geographic",
        "provenance": "",
        "romanized": "<xsl:value-of select="normalize-space(//name)"/>",
        "start_date": "<xsl:value-of select="//foundationdate"/>",
        "transcription_accuracy": "accurate",
        "transcription_completeness": "complete",
        "uri": ""
        }
            ],
            "place_types": [
            "institution"
            ],
            "provenance": "",
            "references": [
            {
            "detail": "Ethio-SPaRe - Hiob Ludolf Center for Ethiopian Studies",
            "reason": "citesForInformation",
            "work_id": ""
            }
            ],
            "reprPoint": [
            
            <xsl:value-of select="//longitude"/>,
        <xsl:value-of select="//latitude"/>
            ],
            "title": "<xsl:value-of select="normalize-space(//name)"/>",
            "type": "FeatureCollection",
            "uri": ""
            }
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>