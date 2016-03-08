 L.mapbox.accessToken = 'pk.eyJ1IjoicGlldHJvbGl1enpvIiwiYSI6ImNpbDB6MjE0bDAwOGl4MW0wa2JvMDd0cHMifQ.wuV3-VuvmCzY69kWRf6CHA';
          
          var 
            grayscale   = L.mapbox.tileLayer('mapbox.light')
            ;
            
          
          var map = L.map('map', 
            {
            center: [9.189, 40.496],
            zoom: 5,
             layers: [grayscale],
            fullscreenControl: true,
            // OR
            fullscreenControl: {
            pseudoFullscreen: false // if true, fullscreen to page width and height
            }
            }
            );
            
             function onEachFeature(feature, layer) {
            
            var popupContent = "An Ethiosphare place " + feature.properties.title +" " + feature.properties.snippet ;
            
           
            layer.bindPopup(popupContent);
            }
            
            var geojson1 =
            
               {
        "bbox": [
        39.463642, 
        14.272528,
        39.463642,
        14.272528
        ],
        "citation": "EthioSphere project Institution placename domlib_institution_00000064",
            "connectsWith": [
            "39274",
            "Tәgray",
        "ˁAddigrat, qäbäle 01; close to ˁAddigrat Qirqos"
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
            "description": "",
            "details": "Däbr. The church is located in the historical core of the city of ˁAddigrat, close to ˁAddigrat Qirqos. Tabots (1): Mädḫahe ˁAläm.",
            "features": [
            {
            "geometry": {
            "coordinates": [
            39.463642,
            14.272528
            ],
            "type": "Point"
            },
            "id": "location-of-Ladesta-Ins",
            "properties": {
            "description": "Location based on Etiosphere",
            "link": "",
            "location_precision": "precise",
            "snippet": "Institution, ; AD 1600 - AD 1700",
            "title": "location of ˁAddigrat Mädḫane ˁAläm / AMM"
            },
            "type": "Feature"
            }
            ],
            "history": [
            {
            "comment": "Mapped to Json from mycore xml",
            "modified": "2016-03-01T22:56:01.992Z",
            "principal": "pliuzzo"
            }
            ],
            "id": "domlib_institution_00000064",
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
            "description": "13 Mss. photographed: AMM-001 Four Gospels ; AMM-002 Psalter ; AMM-003 Missal ; AMM-004 The Book of the Funeral Rite ; AMM-005 Miracles of Jesus ; AMM-006 Miracles of Jesus ; AMM-007 Miracles of Mary ; AMM-008 Synaxarion (March) ; AMM-009 Psalter ; AMM-010 Acts of the Apostles ; AMM-011 Psalter ; AMM-012 Missal ; AMM-013 Psalter",
            "during": [
            ""
            ],
            "end_date": "1700",
            "language": "",
            "name_type": "geographic",
            "provenance": "",
            "romanized": "Däbrä Mädḫanit Mädḫane ˁAläm ˁAddigrat",
            "start_date": "1600",
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
        "end_date": "1700",
        "language": "",
        "name_type": "geographic",
        "provenance": "",
        "romanized": "ˁAddigrat Mädḫane ˁAläm / AMM",
        "start_date": "1600",
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
            
            39.463642,
        14.272528
            ],
            "title": "ˁAddigrat Mädḫane ˁAläm / AMM",
            "type": "FeatureCollection",
            "uri": ""
            }
        
            
            ;
            
            
             var v1 = L.geoJson(geojson1, {
                        
                        
                        onEachFeature: onEachFeature,
                        
                        pointToLayer: function (feature, latlng) {
                        return L.circleMarker(latlng, {
                        radius: 8,
                        fillColor: "green",
                        color: "#000",
                        weight: 1,
                        opacity: 0.3,
                        fillOpacity: 0.2
                        });
                        }
                        }).addTo(map);
                        
                        
         var geojson2 = 
            {
        "bbox": [
        39.378683, 
        14.308833,
        39.378683,
        14.308833
        ],
        "citation": "EthioSphere project Institution placename domlib_institution_00000030",
            "connectsWith": [
            "39274",
            "Tәgray",
        "wäräda Gulo Mäkäda, ṭabiya Kәsad Maˁtäb, qušät Betä Ṗäraqliṭos"
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
            "description": "Existed aready in the pre-Christian time as the religious site of South Arabian migrants; the church has been founded in a later period.",
            "details": "Däbr. A new large church is under construction outside of the compound of the old church, both standing on the rock outcrop (below is the river of Wäfädäbbo). Tabots (8): Jesus, Trinity, Mary, unidentified marble, Gabriel, Kidanä Məḥrät, Michael, Ṗäraqliṭos. The tabot of the local Ṣadəqan (Righteous Ones) was not mentioned, probably by mistake.",
            "features": [
            {
            "geometry": {
            "coordinates": [
            39.378683,
            14.308833
            ],
            "type": "Point"
            },
            "id": "location-of-Ladesta-Ins",
            "properties": {
            "description": "Location based on Etiosphere",
            "link": "",
            "location_precision": "precise",
            "snippet": "Institution, ; AD 1400 - AD 1500",
            "title": "location of ˁAddäqaḥarsi Ṗäraqliṭos / AP"
            },
            "type": "Feature"
            }
            ],
            "history": [
            {
            "comment": "Mapped to Json from mycore xml",
            "modified": "2016-03-01T22:56:01.331Z",
            "principal": "pliuzzo"
            }
            ],
            "id": "domlib_institution_00000030",
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
            "description": "52 Mss. photographed: AP-001 Missal ; AP-002 Hymnary ; AP-003 Four Gospels ; AP-004 Missal ; AP-005 Homily of John Chrysostomos ; AP-006 Homily of St. Michael ; AP-007 Vita of Gäbrä Mänfäs Qǝddus ; AP-008 Pauline Epistles ; AP-009 The Rite of the Holy Week ; AP-010 Vita of Gäbrä Mänfäs Qǝddus ; AP-011 Homily of St. Michael ; AP-012 Absolution of the Son ; AP-013 Absolution of the Son ; AP-014 Synaxarion ; AP-015 Synaxarion ; AP-016 Acts of the Apostles ; AP-017 Vita of Kiros ; AP-018 Vita of Kiros ; AP-019 Acts of the Martyrs of Päraqlitos ; AP-020 Homily of the Sabbath ; AP-021 The Book of the Baptismal Rite ; AP-022 Acts of the Martyrs of Päraqlitos ; AP-023 Vita of Gäbrä Mänfäs Qǝddus ; AP-024 Prayer of Incense ; AP-025 Prayer of Incense ; AP-026 Synoptic Lectionary for the Year ; AP-027 The Book of the Matrimony Rite ; AP-028 Miracles of Mary ; AP-029 Miracles of Mary ; AP-030 Vita of Täklä Haymanot ; AP-031 The Book of the Funeral Rite ; AP-032 The Book of the Funeral Rite ; AP-033 The Glory of the Kings ; AP-034 Acts of the Martyrs of Päraqlitos ; AP-035 Miracles of Mary ; AP-036 Story of the Trinity ; AP-037 Synoptic Lectionary for the Year ; AP-038 Miracles of Jesus ; AP-039 Book of ˀAsläṭi ; AP-040 Collection of New Testament Readings ; AP-041 Acts of the Apostles ; AP-042 Homily of the Saviour of the World ; AP-043 Vita of ˀArägawi ; AP-044 Story of St. Mary ; AP-045 Acts of the Martyrs of Päraqlitos ; AP-046 Acts of the Martyrs of Päraqlitos ; AP-047 Vita of Täklä Haymanot ; AP-048 Vita of St. George ; AP-049 fragments of several mss, including the poetry in honor of the Sadeqan. ; AP-050 Acts of the Martyrs of Päraqlitos ; AP-063 Collection of Hymns ; AP-064 New Testaments Texts; Apocalypse of John .",
            "during": [
            ""
            ],
            "end_date": "1500",
            "language": "",
            "name_type": "geographic",
            "provenance": "",
            "romanized": "ˁAddäqaḥarsi Mäkanä Hәywät Ṗäraqliṭos",
            "start_date": "1400",
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
        "end_date": "1500",
        "language": "",
        "name_type": "geographic",
        "provenance": "",
        "romanized": "ˁAddäqaḥarsi Ṗäraqliṭos / AP",
        "start_date": "1400",
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
            
            39.378683,
        14.308833
            ],
            "title": "ˁAddäqaḥarsi Ṗäraqliṭos / AP",
            "type": "FeatureCollection",
            "uri": ""
            }
        
         ;
         
           var v2 = L.geoJson(geojson2, {
                        
                        
                        onEachFeature: onEachFeature,
                        
                        pointToLayer: function (feature, latlng) {
                        return L.circleMarker(latlng, {
                        radius: 8,
                        fillColor: "green",
                        color: "#000",
                        weight: 1,
                        opacity: 0.3,
                        fillOpacity: 0.2
                        });
                        }
                        }).addTo(map);
                     
                     var geojson3 =
                        {
        "bbox": [
        39.462697, 
        14.273281,
        39.462697,
        14.273281
        ],
        "citation": "EthioSphere project Institution placename domlib_institution_00000065",
            "connectsWith": [
            "39274",
            "Tәgray",
        "ˁAddigrat, qäbäle 01"
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
            "description": "",
            "details": "Däbr. The main historical church of ˁAddigrat. Tabots (4): Qirqos, Urael, Mary, Mädḫane ˁAläm.",
            "features": [
            {
            "geometry": {
            "coordinates": [
            39.462697,
            14.273281
            ],
            "type": "Point"
            },
            "id": "location-of-Ladesta-Ins",
            "properties": {
            "description": "Location based on Etiosphere",
            "link": "",
            "location_precision": "precise",
            "snippet": "Institution, ; AD 1800 - AD 1831",
            "title": "location of ˁAddigrat Däbrä Mänkәrat Qәddus Qirqos / AMQ"
            },
            "type": "Feature"
            }
            ],
            "history": [
            {
            "comment": "Mapped to Json from mycore xml",
            "modified": "2016-03-01T22:56:02.257Z",
            "principal": "pliuzzo"
            }
            ],
            "id": "domlib_institution_00000065",
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
            "description": "23 Mss. photographed: AMQ-001 Four Gospels ; AMQ-002 Miracles of Mary ; AMQ-003 The Rite of the Holy Week ; AMQ-004 The Book of the Funeral Rite ; AMQ-005 Miracles of Jesus ; AMQ-006 Book of Ziq- and Mǝˁraf-Hymns ; AMQ-007 Vita of Cyriacus and Julitta ; AMQ-008 The Faith of the Fathers ; AMQ-009 Miracles of Mary; Miracles of Cyriacus; Miracles of Mänfäs Qǝddus ; AMQ-010 Missal ; AMQ-011 Synaxarion (March) ; AMQ-012 Vita of Cyriacus ; AMQ-013 Vita of Täklä Haymanot ; AMQ-014 Miracles of Mary ; AMQ-015 Miracles of Jesus ; AMQ-016 Missal ; AMQ-017 Collection of Hymns ; AMQ-018 Vitae of Gäbrä Mänfäs Qǝddus, ˀArägawi, Gäbrä Krǝstos ; AMQ-019 Homily of St. Michael ; AMQ-020 Homily of Jesus ; AMQ-021 Homily of St. Michael ; AMQ-022 Four Gospels ; AMQ-023 Synaxarion (September)",
            "during": [
            ""
            ],
            "end_date": "1831",
            "language": "",
            "name_type": "geographic",
            "provenance": "",
            "romanized": "ˁAddigrat Qirqos",
            "start_date": "1800",
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
        "end_date": "1831",
        "language": "",
        "name_type": "geographic",
        "provenance": "",
        "romanized": "ˁAddigrat Däbrä Mänkәrat Qәddus Qirqos / AMQ",
        "start_date": "1800",
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
            
            39.462697,
        14.273281
            ],
            "title": "ˁAddigrat Däbrä Mänkәrat Qәddus Qirqos / AMQ",
            "type": "FeatureCollection",
            "uri": ""
            }
        
                   ;
                    var v3 = L.geoJson(geojson3, {
                        
                        
                        onEachFeature: onEachFeature,
                        
                        pointToLayer: function (feature, latlng) {
                        return L.circleMarker(latlng, {
                        radius: 8,
                        fillColor: "green",
                        color: "#000",
                        weight: 1,
                        opacity: 0.3,
                        fillOpacity: 0.2
                        });
                        }
                        }).addTo(map);
                        
                        var geojson4 =
                        {
        "bbox": [
        39.465111, 
        14.42075,
        39.465111,
        14.42075
        ],
        "citation": "EthioSphere project Institution placename domlib_institution_00000097",
            "connectsWith": [
            "39274",
            "Tǝgray",
        "wäräda Gulo Mäkäda, tabiya Ḥabän, qušät ˁAddi Qolqwal"
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
            "description": "",
            "details": "Gäṭär. Tabots (ca. 10?): some of them are two wooden and one marble of George, one wooden and one marble of Mary, Mädḫane ˁAläm, Trinity.",
            "features": [
            {
            "geometry": {
            "coordinates": [
            39.465111,
            14.42075
            ],
            "type": "Point"
            },
            "id": "location-of-Ladesta-Ins",
            "properties": {
            "description": "Location based on Etiosphere",
            "link": "",
            "location_precision": "precise",
            "snippet": "Institution, ; AD 1400 - AD 1500",
            "title": "location of ˁAddi Qolqwal Giyorgis / AQG"
            },
            "type": "Feature"
            }
            ],
            "history": [
            {
            "comment": "Mapped to Json from mycore xml",
            "modified": "2016-03-01T22:56:02.513Z",
            "principal": "pliuzzo"
            }
            ],
            "id": "domlib_institution_00000097",
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
            "description": "15 Mss. photographed: AQG-001 Psalter ; AQG-002 Miracles of Jesus ; AQG-003 Four Gospels ; AQG-004 The Rite of the Holy Week ; AQG-005 Vitae of the Martyrs ; AQG-006 Book of the Diciples ; AQG-007 Sinodos ; AQG-008 Pentateuch ; AQG-009 The Book of the Funeral Rite ; AQG-010 The Rite of the Holy Week ; AQG-011 Miracles of Mary; Miracles of George ; AQG-012 Missal ; AQG-013 Four Gospels ; AQG-014 Homily of St. George ; AQG-015 Psalter",
            "during": [
            ""
            ],
            "end_date": "1500",
            "language": "",
            "name_type": "geographic",
            "provenance": "",
            "romanized": "Qǝddus Giyorgis ˁAddi Qolqwal",
            "start_date": "1400",
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
        "end_date": "1500",
        "language": "",
        "name_type": "geographic",
        "provenance": "",
        "romanized": "ˁAddi Qolqwal Giyorgis / AQG",
        "start_date": "1400",
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
            
            39.465111,
        14.42075
            ],
            "title": "ˁAddi Qolqwal Giyorgis / AQG",
            "type": "FeatureCollection",
            "uri": ""
            }
        
                   ;
                    var v4 = L.geoJson(geojson4, {
                        
                        
                        onEachFeature: onEachFeature,
                        
                        pointToLayer: function (feature, latlng) {
                        return L.circleMarker(latlng, {
                        radius: 8,
                        fillColor: "green",
                        color: "#000",
                        weight: 1,
                        opacity: 0.3,
                        fillOpacity: 0.2
                        });
                        }
                        }).addTo(map);
                        
                        var geojson5 =
                        {
        "bbox": [
        39.368495, 
        14.268189,
        39.368495,
        14.268189
        ],
        "citation": "EthioSphere project Institution placename domlib_institution_00000175",
            "connectsWith": [
            "39274",
            "Tǝgray",
        "wäräda Ganta ˀAfäšum, ṭabiya Märgahaya, qušät ˀAbrəqo"
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
            "description": "",
            "details": "Gäṭär. Tabots (5): 4 of Mary, Trinity.",
            "features": [
            {
            "geometry": {
            "coordinates": [
            39.368495,
            14.268189
            ],
            "type": "Point"
            },
            "id": "location-of-Ladesta-Ins",
            "properties": {
            "description": "Location based on Etiosphere",
            "link": "",
            "location_precision": "precise",
            "snippet": "Institution, ; AD 1700 - AD 1800",
            "title": "location of ˀAbrəqo Maryam / QMA"
            },
            "type": "Feature"
            }
            ],
            "history": [
            {
            "comment": "Mapped to Json from mycore xml",
            "modified": "2016-03-01T22:56:03.207Z",
            "principal": "pliuzzo"
            }
            ],
            "id": "domlib_institution_00000175",
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
            "description": "6 Mss. photographed: QMA-001 Missal ; QMA-002 Four Gospels ; QMA-003 Collection of Liturgic Prayers ; QMA-004 Missal ; QMA-005 The Sword of the Trinity, The Loosening of the Spell ; QMA-006 Miracles of Mary",
            "during": [
            ""
            ],
            "end_date": "1800",
            "language": "",
            "name_type": "geographic",
            "provenance": "",
            "romanized": "ˀAbrəqo Qəddəst Maryam",
            "start_date": "1700",
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
        "end_date": "1800",
        "language": "",
        "name_type": "geographic",
        "provenance": "",
        "romanized": "ˀAbrəqo Maryam / QMA",
        "start_date": "1700",
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
            
            39.368495,
        14.268189
            ],
            "title": "ˀAbrəqo Maryam / QMA",
            "type": "FeatureCollection",
            "uri": ""
            }
        
                   ;
                    var v5 = L.geoJson(geojson5, {
                        
                        
                        onEachFeature: onEachFeature,
                        
                        pointToLayer: function (feature, latlng) {
                        return L.circleMarker(latlng, {
                        radius: 8,
                        fillColor: "green",
                        color: "#000",
                        weight: 1,
                        opacity: 0.3,
                        fillOpacity: 0.2
                        });
                        }
                        }).addTo(map);
                        
                        var geojson6 =
                        {
        "bbox": [
        39.5961, 
        14.0544,
        39.5961,
        14.0544
        ],
        "citation": "EthioSphere project Institution placename domlib_institution_00000239",
            "connectsWith": [
            "39274",
            "Tәgray",
        "wäräda Saˁsi Ṣaˁda ˀƎmba, ṭabiya Sənqaṭa, qušät ˁAddi Ḉəwa"
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
            "description": "",
            "details": "Däbr / church",
            "features": [
            {
            "geometry": {
            "coordinates": [
            39.5961,
            14.0544
            ],
            "type": "Point"
            },
            "id": "location-of-Ladesta-Ins",
            "properties": {
            "description": "Location based on Etiosphere",
            "link": "",
            "location_precision": "precise",
            "snippet": "Institution, ; AD 1500 - AD 1600",
            "title": "location of ˁAddi Ḉəwa Mikaˀel"
            },
            "type": "Feature"
            }
            ],
            "history": [
            {
            "comment": "Mapped to Json from mycore xml",
            "modified": "2016-03-01T22:56:03.624Z",
            "principal": "pliuzzo"
            }
            ],
            "id": "domlib_institution_00000239",
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
            "description": "",
            "during": [
            ""
            ],
            "end_date": "1600",
            "language": "",
            "name_type": "geographic",
            "provenance": "",
            "romanized": "Mikaˀel ˁAddi Ḉəwa",
            "start_date": "1500",
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
        "end_date": "1600",
        "language": "",
        "name_type": "geographic",
        "provenance": "",
        "romanized": "ˁAddi Ḉəwa Mikaˀel",
        "start_date": "1500",
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
            
            39.5961,
        14.0544
            ],
            "title": "ˁAddi Ḉəwa Mikaˀel",
            "type": "FeatureCollection",
            "uri": ""
            }
        
                   ;
                    var v6 = L.geoJson(geojson6, {
                        
                        
                        onEachFeature: onEachFeature,
                        
                        pointToLayer: function (feature, latlng) {
                        return L.circleMarker(latlng, {
                        radius: 8,
                        fillColor: "green",
                        color: "#000",
                        weight: 1,
                        opacity: 0.3,
                        fillOpacity: 0.2
                        });
                        }
                        }).addTo(map);
                        
                        var geojson7 =
                        {
        "bbox": [
        39.573408, 
        13.797386,
        39.573408,
        13.797386
        ],
        "citation": "EthioSphere project Institution placename domlib_institution_00000264",
            "connectsWith": [
            "39274",
            "Təgray",
        "wäräda Kǝlǝttä ˀAwlaˁlo, ṭabiya Gänfäl, qušät ˁAddi ˀArbaˀa"
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
            "description": "Local tradition claims the foundation in the time of the kings ˀAbrəha and ˀAṣbəḥa.",
            "details": "Däbr. Tabots (1): Mary.",
            "features": [
            {
            "geometry": {
            "coordinates": [
            39.573408,
            13.797386
            ],
            "type": "Point"
            },
            "id": "location-of-Ladesta-Ins",
            "properties": {
            "description": "Location based on Etiosphere",
            "link": "",
            "location_precision": "precise",
            "snippet": "Institution, ; AD 1700 - AD 1800",
            "title": "location of ˁAddi ˀArbaˀa Däbrä Səbḥat Qəddəst Maryam / AADM"
            },
            "type": "Feature"
            }
            ],
            "history": [
            {
            "comment": "Mapped to Json from mycore xml",
            "modified": "2016-03-01T22:56:03.816Z",
            "principal": "pliuzzo"
            }
            ],
            "id": "domlib_institution_00000264",
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
            "description": "14 Mss. photographed: AADM-001 “Prayer of the Incense”; AADM-002 “Dǝggwa”; AADM-003 “Miracles of Mary”; AADM-004 “Horologium”; AADM-005 “Book of ˀAsläti; Excerpts from Missal ”; AADM-006 “Missal”; AADM-007 “Homiliary for the feasts of St. Michael; Miracles of St, Michael”; AADM-008 “Book of the Baptismal Ritual”; AADM-009 “Vita of Gäbrä Mänfäs Qǝddus”; AADM-010 “Missal”; AADM-011 “Miracles of Mary”; AADM-012 “Miracles of Jesus”; AADM-013 “Book of Gǝṣṣawe”; AADM-014 “Missal”.",
            "during": [
            ""
            ],
            "end_date": "1800",
            "language": "",
            "name_type": "geographic",
            "provenance": "",
            "romanized": "ˁAddi ˀArbaˀa Maryam",
            "start_date": "1700",
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
        "end_date": "1800",
        "language": "",
        "name_type": "geographic",
        "provenance": "",
        "romanized": "ˁAddi ˀArbaˀa Däbrä Səbḥat Qəddəst Maryam / AADM",
        "start_date": "1700",
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
            
            39.573408,
        13.797386
            ],
            "title": "ˁAddi ˀArbaˀa Däbrä Səbḥat Qəddəst Maryam / AADM",
            "type": "FeatureCollection",
            "uri": ""
            }
        
                   ;
                    var v7 = L.geoJson(geojson7, {
                        
                        
                        onEachFeature: onEachFeature,
                        
                        pointToLayer: function (feature, latlng) {
                        return L.circleMarker(latlng, {
                        radius: 8,
                        fillColor: "green",
                        color: "#000",
                        weight: 1,
                        opacity: 0.3,
                        fillOpacity: 0.2
                        });
                        }
                        }).addTo(map);
                        
                        var geojson8 =
                        {
        "bbox": [
        38.875, 
        14.194971,
        38.875,
        14.194971
        ],
        "citation": "EthioSphere project Institution placename domlib_institution_00000300",
            "connectsWith": [
            "39274",
            "Central Tigray",
        "wäräda ˁAdwa, ṭabiya ˀAbənnät, qušät Qäṭäna 2"
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
            "description": "",
            "details": "",
            "features": [
            {
            "geometry": {
            "coordinates": [
            38.875,
            14.194971
            ],
            "type": "Point"
            },
            "id": "location-of-Ladesta-Ins",
            "properties": {
            "description": "Location based on Etiosphere",
            "link": "",
            "location_precision": "precise",
            "snippet": "Institution, ; AD 1750 - AD 1800",
            "title": "location of ˀAddi ˀAbun Täklä Haymanot / AATH"
            },
            "type": "Feature"
            }
            ],
            "history": [
            {
            "comment": "Mapped to Json from mycore xml",
            "modified": "2016-03-01T22:56:04.003Z",
            "principal": "pliuzzo"
            }
            ],
            "id": "domlib_institution_00000300",
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
            "description": "More than 70 Mss.",
            "during": [
            ""
            ],
            "end_date": "1800",
            "language": "",
            "name_type": "geographic",
            "provenance": "",
            "romanized": "Däbrä Marqos",
            "start_date": "1750",
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
        "end_date": "1800",
        "language": "",
        "name_type": "geographic",
        "provenance": "",
        "romanized": "ˀAddi ˀAbun Täklä Haymanot / AATH",
        "start_date": "1750",
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
            
            38.875,
        14.194971
            ],
            "title": "ˀAddi ˀAbun Täklä Haymanot / AATH",
            "type": "FeatureCollection",
            "uri": ""
            }
        
                   ;
                    var v8 = L.geoJson(geojson8, {
                        
                        
                        onEachFeature: onEachFeature,
                        
                        pointToLayer: function (feature, latlng) {
                        return L.circleMarker(latlng, {
                        radius: 8,
                        fillColor: "green",
                        color: "#000",
                        weight: 1,
                        opacity: 0.3,
                        fillOpacity: 0.2
                        });
                        }
                        }).addTo(map);
                        
            
                        
                        var points = L.layerGroup([
            v1, v2, v3, v4, v5, v6, v7, v8 ]);
            
            var baseMaps ={
            "Grayscale": grayscale
            }
            
            var overlayMaps = {
            "places": points
            };
            
            L.control.layers(baseMaps, overlayMaps).addTo(map);
            
            function onMapClick(e) {
            alert("You clicked the map at " + e.latlng);
            }
            
            map.on('click', onMapClick);
           