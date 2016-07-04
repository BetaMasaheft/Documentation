
            L.mapbox.accessToken = 'pk.eyJ1IjoicGlldHJvbGl1enpvIiwiYSI6ImNpbDB6MjE0bDAwOGl4MW0wa2JvMDd0cHMifQ.wuV3-VuvmCzY69kWRf6CHA';
            
            var 
            ancientworld = L.mapbox.tileLayer('isawnyu.map-knmctlkh')
            grayscale   = L.mapbox.tileLayer('mapbox.light'),
            streets  = L.mapbox.tileLayer('mapbox.streets');
            
            
            var map = L.map('map', 
            {
            center: [11.5500, 39.2833],
            zoom: 14,
            layers: [ancientworld, grayscale, streets],
            fullscreenControl: true,
            // OR
            fullscreenControl: {
            pseudoFullscreen: false // if true, fullscreen to page width and height
            }
            }
            );
            
            
            
            
            
            function onEachFeature(feature, layer) {
            
            var popupContent = "See more information about Pleaides place " + feature.properties.snippet +" " + feature.properties.link ;
            
            
            
            layer.bindPopup(popupContent);
            }
            
            
            
                        var geojsonFeature1001896 =
                        {"connectsWith": [], "recent_changes": [{"modified": "2015-09-04T19:15:42Z", "principal": "jbecker"}, {"modified": "2012-02-15T02:07:35Z", "principal": "admin"}], "description": "An ancient place, cited: BAtlas 102 D4 no. 10 (Hellas)", "title": "Hellas", "reprPoint": [22.5, 37.5], "features": [{"geometry": {"type": "Polygon", "coordinates": [[[20.0, 35.0], [20.0, 40.0], [25.0, 40.0], [25.0, 35.0], [20.0, 35.0]]]}, "type": "Feature", "properties": {"snippet": "Unknown", "link": "http://pleiades.stoa.org/places/1001896/batlas-location", "description": "", "location_precision": "rough", "title": "Barrington Atlas location"}, "id": "batlas-location"}], "names": ["\u0395\u03bb\u03bb\u03ac\u03c2", "\u0395\u03bb\u03bb\u03ac\u03b4\u03b1", "Hellas"], "type": "FeatureCollection", "id": "1001896", "bbox": [20.0, 35.0, 25.0, 40.0]}
                        
                        ;
                        
                        var v1001896 = L.geoJson(geojsonFeature1001896).addTo(map);
                        
                    
                        
                        var geojsonFeature580101 =
                        {"connectsWith": ["570654", "579896"], "recent_changes": [{"modified": "2015-08-03T18:34:31Z", "principal": "jbecker"}, {"modified": "2013-03-07T15:12:25Z", "principal": "thomase"}], "description": "Salamis is the largest island of the Saronic Gulf. ", "title": "Salamis (island)", "reprPoint": [23.510000000000002, 37.93], "features": [{"geometry": {"type": "Point", "coordinates": [23.510000000000002, 37.93]}, "type": "Feature", "properties": {"snippet": "Island, ; AD 1700 - AD 2100", "link": "http://pleiades.stoa.org/places/580101/location-of-salamis-ins", "description": "Coordinates after BAtlas; verified in Google Earth 2013 with reference to Wikipedia.", "location_precision": "precise", "title": "location of Salamis Ins."}, "id": "location-of-salamis-ins"}], "names": ["Salamis"], "type": "FeatureCollection", "id": "580101", "bbox": [23.510000000000002, 37.93, 23.510000000000002, 37.93]}
                        
                        ;
                        
                        var v580101 =  L.geoJson(geojsonFeature580101, {
                        
                        
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
                    
                        
                        var geojsonFeature501434 =
                        {"connectsWith": ["560221", "511381"], "recent_changes": [{"modified": "2013-05-16T23:59:29Z", "principal": "jbecker"}, {"modified": "2012-02-15T05:41:40Z", "principal": "admin"}], "description": "A narrow strait of northwestern Turkey that connect the Aegean Sea to Propontis (Sea of Marmara).", "title": "Hellespontus", "reprPoint": [26.399999999999999, 40.200000000000003], "features": [{"geometry": {"type": "Point", "coordinates": [26.399999999999999, 40.200000000000003]}, "type": "Feature", "properties": {"snippet": "Water-open, ; AD 1700 - AD 2100", "link": "http://pleiades.stoa.org/places/501434/representative-point-for-hellespontus", "description": "verified in Google Earth 2013.", "location_precision": "precise", "title": "representative point for Hellespontus"}, "id": "representative-point-for-hellespontus"}], "names": ["Hellespontus", "Heptastadion"], "type": "FeatureCollection", "id": "501434", "bbox": [26.399999999999999, 40.200000000000003, 26.399999999999999, 40.200000000000003]}
                        
                        ;
                        
                        var v501434 =  L.geoJson(geojsonFeature501434, {
                        
                        
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
                    
                      
                    
                        var geojsonFeature580059 =
                        {"connectsWith": [], "recent_changes": [{"modified": "2012-02-15T06:44:54Z", "principal": "admin"}], "description": "An ancient place, cited: BAtlas 59 B2 Parnes M.", "title": "Parnes M.", "reprPoint": [23.625, 38.125], "features": [{"geometry": {"type": "Polygon", "coordinates": [[[23.5, 38.0], [23.5, 38.25], [23.75, 38.25], [23.75, 38.0], [23.5, 38.0]]]}, "type": "Feature", "properties": {"snippet": "Unknown", "link": "http://pleiades.stoa.org/places/580059/batlas-location", "description": "", "location_precision": "rough", "title": "Barrington Atlas location"}, "id": "batlas-location"}], "names": ["Parnes M."], "type": "FeatureCollection", "id": "580059", "bbox": [23.5, 38.0, 23.75, 38.25]}
                        
                        ;
                        
                        var v580059 = L.geoJson(geojsonFeature580059).addTo(map);
                        
                    
                        
                        var geojsonFeature579885 =
                        {"connectsWith": ["579888", "619860902", "813654446", "580123", "211653327", "235795850", "310115518", "copy_of_310115518", "728329644", "206543406", "421260481", "146086514", "149047472", "759679649", "580051"], "recent_changes": [{"modified": "2015-09-04T21:07:48Z", "principal": "jbecker"}, {"modified": "2013-08-14T13:24:29Z", "principal": "arabinowitz"}], "description": "A major Greek city-state and the principal city of Attika.", "title": "Athenae", "reprPoint": [23.723985181818183, 37.972746545454555], "features": [{"geometry": {"type": "Point", "coordinates": [23.722014000000001, 37.975855000000003]}, "type": "Feature", "properties": {"snippet": "Stoa, ; 550 BC - AD 300", "link": "http://pleiades.stoa.org/places/579885/stoa-of-zeus-eleutherios", "description": "The Stoa of Zeus Eleutherios was built on the west side of the Agora of Athens between 430-425 BC, in honor of Zeus \"of Freedom\"; the stoa, Doric in its external order, housed the shields of Athenians who had died fighting for the city ", "location_precision": "precise", "title": "Stoa of Zeus (Eleutherios)"}, "id": "stoa-of-zeus-eleutherios"}, {"geometry": {"type": "Point", "coordinates": [23.726443, 37.972000000000001]}, "type": "Feature", "properties": {"snippet": "Temple, ; 550 BC - AD 300", "link": "http://pleiades.stoa.org/places/579885/the-erechtheion", "description": "The Erechtheion is a temple on the Athenian Acropolis dedicated to Athena Polias and other deities and heroes; the temple is of the Ionic order with several distinctive features, including its famous caryatid porch ", "location_precision": "precise", "title": "The Erechtheion"}, "id": "the-erechtheion"}, {"geometry": {"type": "Point", "coordinates": [23.726464, 37.971687000000003]}, "type": "Feature", "properties": {"snippet": "Settlement; 750 BC - AD 640", "link": "http://pleiades.stoa.org/places/579885/dare-location", "description": "Representative point location, site precision", "location_precision": "precise", "title": "DARE Location"}, "id": "dare-location"}, {"geometry": {"type": "Point", "coordinates": [23.719536999999999, 37.970793]}, "type": "Feature", "properties": {"snippet": "Unknown; 750 BC - AD 640", "link": "http://pleiades.stoa.org/places/579885/darmc-location-21246", "description": "Point location", "location_precision": "precise", "title": "DARMC location 21246"}, "id": "darmc-location-21246"}, {"geometry": {"type": "Point", "coordinates": [23.72775, 37.970278]}, "type": "Feature", "properties": {"snippet": "Theatre, ; 550 BC - AD 300", "link": "http://pleiades.stoa.org/places/579885/theatre-of-dionysus-eleuthereus", "description": "Theatre on the south slope of the Acropolis. ", "location_precision": "precise", "title": "Theatre of Dionysus Eleuthereus"}, "id": "theatre-of-dionysus-eleuthereus"}, {"geometry": {"type": "Point", "coordinates": [23.721392999999999, 37.975574000000002]}, "type": "Feature", "properties": {"snippet": "Temple, ; 550 BC - AD 1450", "link": "http://pleiades.stoa.org/places/579885/hephaisteion", "description": "Temple of Hephaistos located on the northwest side of the Agora of Athens", "location_precision": "precise", "title": "Hephaisteion"}, "id": "hephaisteion"}, {"geometry": {"type": "Point", "coordinates": [23.718610999999999, 37.978332999999999]}, "type": "Feature", "properties": {"snippet": "Cemetery, ; 750 BC - AD 640", "link": "http://pleiades.stoa.org/places/579885/kerameikos", "description": "A district of ancient Athens located northwest of the Acropolis, the Kerameikos takes its name from the potters' workshops in the area; the portion of the district lying outside the Dipylon Gate served as a necropolis.", "location_precision": "precise", "title": "Kerameikos"}, "id": "kerameikos"}, {"geometry": {"type": "Point", "coordinates": [23.726165999999999, 37.971420999999999]}, "type": "Feature", "properties": {"snippet": "Temple, ; 750 BC - AD 640", "link": "http://pleiades.stoa.org/places/579885/acropolis-of-athens", "description": "The acropolis of the ancient city", "location_precision": "precise", "title": "Acropolis of Athens"}, "id": "acropolis-of-athens"}, {"geometry": {"type": "Point", "coordinates": [23.7225, 37.975000000000001]}, "type": "Feature", "properties": {"snippet": "Plaza, ; 750 BC - AD 640", "link": "http://pleiades.stoa.org/places/579885/agora-of-athens", "description": "The marketplace of the ancient city", "location_precision": "precise", "title": "Agora of Athens"}, "id": "agora-of-athens"}], "names": ["Athen", "\u1f08\u03b8\u1fc6\u03bd\u03b1\u03b9", "Athenae", "Athens", "\u0391\u03b8\u1f75\u03bd\u03b1"], "type": "FeatureCollection", "id": "579885", "bbox": [23.719536999999999, 37.970793, 23.726464, 37.975855000000003]}
                        
                        ;
                        
                        var v579885 =  L.geoJson(geojsonFeature579885, {
                        
                        
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
                    
                        var geojsonFeature580094 =
                        {"connectsWith": ["570654"], "recent_changes": [{"modified": "2015-08-03T18:29:26Z", "principal": "jbecker"}, {"modified": "2012-02-15T06:45:25Z", "principal": "admin"}], "description": "An island located in the Saronic Gulf.", "title": "Psyttaleia (island)", "reprPoint": [23.625, 37.875], "features": [{"geometry": {"type": "Polygon", "coordinates": [[[23.5, 37.75], [23.5, 38.0], [23.75, 38.0], [23.75, 37.75], [23.5, 37.75]]]}, "type": "Feature", "properties": {"snippet": "Unknown", "link": "http://pleiades.stoa.org/places/580094/batlas-location", "description": "", "location_precision": "rough", "title": "Barrington Atlas location"}, "id": "batlas-location"}], "names": ["\u03a8\u03c5\u03c4\u03c4\u03ac\u03bb\u03b5\u03b9\u03b1"], "type": "FeatureCollection", "id": "580094", "bbox": [23.5, 37.75, 23.75, 38.0]}
                        
                        ;
                        
                        var v580094 = L.geoJson(geojsonFeature580094).addTo(map);
                        
                    
                        
                        var geojsonFeature579853 =
                        {"connectsWith": [], "recent_changes": [{"modified": "2012-10-23T19:39:17Z", "principal": "sgillies"}, {"modified": "2012-02-15T06:40:01Z", "principal": "admin"}], "description": "An ancient place, cited: BAtlas 59 A3 Aigina", "title": "Aigina", "reprPoint": [23.423668000000003, 37.750149], "features": [{"geometry": {"type": "Point", "coordinates": [23.423667999999999, 37.750149]}, "type": "Feature", "properties": {"snippet": "Settlement; 750 BC - AD 640", "link": "http://pleiades.stoa.org/places/579853/dare-location", "description": "Representative point location, site precision", "location_precision": "precise", "title": "DARE Location"}, "id": "dare-location"}, {"geometry": {"type": "Point", "coordinates": [23.433333000000001, 37.75]}, "type": "Feature", "properties": {"snippet": "Unknown; 750 BC - AD 640", "link": "http://pleiades.stoa.org/places/579853/darmc-location-31224", "description": "  scale point location", "location_precision": "precise", "title": "DARMC location 31224"}, "id": "darmc-location-31224"}], "names": ["Aigina"], "type": "FeatureCollection", "id": "579853", "bbox": [23.423667999999999, 37.750149, 23.423667999999999, 37.750149]}
                        
                        ;
                        
                        var v579853 =  L.geoJson(geojsonFeature579853, {
                        
                        
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
                    
                        
                        var geojsonFeature599636 =
                        {"connectsWith": ["599564", "991381"], "recent_changes": [{"modified": "2013-02-25T18:23:00Z", "principal": "jbecker"}, {"modified": "2012-10-23T19:34:29Z", "principal": "sgillies"}], "description": "An ancient city in Caria, now known as Bodrum in Turkey (BAtlas 61 E3 Halicarnassus)", "title": "Halicarnassus/Halikarnassos", "reprPoint": [27.423765, 37.038220500000001], "features": [{"geometry": {"type": "Point", "coordinates": [27.429126, 37.032062000000003]}, "type": "Feature", "properties": {"snippet": "Temple, ; 550 BC - 330 BC", "link": "http://pleiades.stoa.org/places/599636/approximate-location-of-the-palace-of-mausolos-at-bodrum", "description": "", "location_precision": "precise", "title": "Approximate location of the palace of Mausolos at Bodrum"}, "id": "approximate-location-of-the-palace-of-mausolos-at-bodrum"}, {"geometry": {"type": "Point", "coordinates": [27.420200999999999, 37.042901000000001]}, "type": "Feature", "properties": {"snippet": "Unknown; 550 BC - AD 1453", "link": "http://pleiades.stoa.org/places/599636/approximate-centerpoint-of-the-acropolis-of-halicarnassus-bodrum", "description": "", "location_precision": "precise", "title": "Approximate centerpoint of the acropolis of Halicarnassus (Bodrum)"}, "id": "approximate-centerpoint-of-the-acropolis-of-halicarnassus-bodrum"}, {"geometry": {"type": "Point", "coordinates": [27.421589999999998, 37.040053999999998]}, "type": "Feature", "properties": {"snippet": "Unknown; 330 BC - AD 1453", "link": "http://pleiades.stoa.org/places/599636/centerpoint-of-the-orchestra-of-the-theater-at-bodrum", "description": "", "location_precision": "precise", "title": "Centerpoint of the orchestra of the theater at Bodrum"}, "id": "centerpoint-of-the-orchestra-of-the-theater-at-bodrum"}, {"geometry": {"type": "Point", "coordinates": [27.424143000000001, 37.037864999999996]}, "type": "Feature", "properties": {"snippet": "Temple, ; 550 BC - AD 1453", "link": "http://pleiades.stoa.org/places/599636/centerpoint-of-visible-remains-of-the-mausoleum-at-bodrum", "description": "", "location_precision": "precise", "title": "Centerpoint of visible remains of the Mausoleum at Bodrum"}, "id": "centerpoint-of-visible-remains-of-the-mausoleum-at-bodrum"}], "names": ["Halicarnassus", "Bodrum", "\u1f09\u03bb\u03b9\u03ba\u03b1\u03c1\u03bd\u03b1\u03c3\u03c3\u03cc\u03c2"], "type": "FeatureCollection", "id": "599636", "bbox": [27.420200999999999, 37.032062000000003, 27.429126, 37.042901000000001]}
                        
                        ;
                        
                        var v599636 =  L.geoJson(geojsonFeature599636, {
                        
                        
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
                    
                        var geojsonFeature580122 =
                        {"connectsWith": [], "recent_changes": [{"modified": "2013-02-04T16:43:35Z", "principal": "jbecker"}, {"modified": "2012-02-15T06:45:45Z", "principal": "admin"}], "description": "An ancient place, cited: BAtlas 59 B2 Thriasion Pedion", "title": "Thriasion Pedion", "reprPoint": [23.625, 38.125], "features": [{"geometry": {"type": "Polygon", "coordinates": [[[23.5, 38.0], [23.5, 38.25], [23.75, 38.25], [23.75, 38.0], [23.5, 38.0]]]}, "type": "Feature", "properties": {"snippet": "Unknown; 550 BC - AD 300", "link": "http://pleiades.stoa.org/places/580122/batlas-location", "description": "", "location_precision": "rough", "title": "Barrington Atlas location"}, "id": "batlas-location"}], "names": ["Thriasion Pedion"], "type": "FeatureCollection", "id": "580122", "bbox": [23.5, 38.0, 23.75, 38.25]}
                        
                        ;
                        
                        var v580122 = L.geoJson(geojsonFeature580122).addTo(map);
                        
                    
                        
                        var geojsonFeature579920 =
                        {"connectsWith": ["935032928", "408217405"], "recent_changes": [{"modified": "2015-08-01T14:33:59Z", "principal": "jbecker"}, {"modified": "2012-10-20T21:54:06Z", "principal": "sgillies"}], "description": "An ancient place, cited: BAtlas 59 B2 Eleusis", "title": "Eleusis", "reprPoint": [23.537400999999999, 38.041100999999998], "features": [{"geometry": {"type": "Point", "coordinates": [23.537400999999999, 38.041100999999998]}, "type": "Feature", "properties": {"snippet": "Settlement; 750 BC - AD 640", "link": "http://pleiades.stoa.org/places/579920/dare-location", "description": "Representative point location, site precision", "location_precision": "precise", "title": "DARE Location"}, "id": "dare-location"}, {"geometry": {"type": "Point", "coordinates": [23.541893999999999, 38.050001999999999]}, "type": "Feature", "properties": {"snippet": "Unknown; 750 BC - AD 640", "link": "http://pleiades.stoa.org/places/579920/darmc-location-21263", "description": "Point location", "location_precision": "precise", "title": "DARMC location 21263"}, "id": "darmc-location-21263"}, {"geometry": {"type": "Point", "coordinates": [23.545197999999999, 38.041302999999999]}, "type": "Feature", "properties": {"snippet": "Unknown; 750 BC - AD 640", "link": "http://pleiades.stoa.org/places/579920/darmc-location-41", "description": "TIB point location", "location_precision": "precise", "title": "DARMC location 41"}, "id": "darmc-location-41"}], "names": ["Eleusis"], "type": "FeatureCollection", "id": "579920", "bbox": [23.537400999999999, 38.041100999999998, 23.537400999999999, 38.041100999999998]}
                        
                        ;
                        
                        var v579920 =  L.geoJson(geojsonFeature579920, {
                        
                        
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
                    
                        var geojsonFeature981531 =
                        {"connectsWith": [], "recent_changes": [{"modified": "2012-02-15T23:44:13Z", "principal": "admin"}], "description": "An ancient place, cited: BAtlas 100 L3 Macedonia", "title": "Macedonia", "reprPoint": [22.5, 42.5], "features": [{"geometry": {"type": "Polygon", "coordinates": [[[20.0, 40.0], [20.0, 45.0], [25.0, 45.0], [25.0, 40.0], [20.0, 40.0]]]}, "type": "Feature", "properties": {"snippet": "Unknown", "link": "http://pleiades.stoa.org/places/981531/batlas-location", "description": "", "location_precision": "rough", "title": "Barrington Atlas location"}, "id": "batlas-location"}], "names": ["Macedonia"], "type": "FeatureCollection", "id": "981531", "bbox": [20.0, 40.0, 25.0, 45.0]}
                        
                        ;
                        
                        var v981531 = L.geoJson(geojsonFeature981531).addTo(map);
                        
                    
                        
                        var geojsonFeature541138 =
                        {"connectsWith": ["540689"], "recent_changes": [{"modified": "2015-10-27T14:49:49Z", "principal": "jbecker"}, {"modified": "2012-10-20T20:58:06Z", "principal": "sgillies"}], "description": "The ancient city of Thebes in Boeotia (modern Greece).", "title": "Thebai/Thebae", "reprPoint": [23.317798999999997, 38.319076000000003], "features": [{"geometry": {"type": "Point", "coordinates": [23.317799000000001, 38.319076000000003]}, "type": "Feature", "properties": {"snippet": "Settlement; 750 BC - AD 640", "link": "http://pleiades.stoa.org/places/541138/dare-location", "description": "Representative point location, site precision", "location_precision": "precise", "title": "DARE Location"}, "id": "dare-location"}, {"geometry": {"type": "Point", "coordinates": [23.317354999999999, 38.319235999999997]}, "type": "Feature", "properties": {"snippet": "Unknown; 750 BC - AD 640", "link": "http://pleiades.stoa.org/places/541138/darmc-location-24220", "description": "5M scale point location", "location_precision": "precise", "title": "DARMC location 24220"}, "id": "darmc-location-24220"}], "names": ["Thebae", "\u0398\u03ae\u03b2\u03b1", "Thebes", "\u0398\u1fc6\u03b2\u03b1\u03b9"], "type": "FeatureCollection", "id": "541138", "bbox": [23.317799000000001, 38.319076000000003, 23.317799000000001, 38.319076000000003]}
                        
                        ;
                        
                        var v541138 =  L.geoJson(geojsonFeature541138, {
                        
                        
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
                    
                        
                        var geojsonFeature541063 =
                        {"connectsWith": [], "recent_changes": [{"modified": "2015-10-28T14:33:16Z", "principal": "thomase"}, {"modified": "2015-10-27T15:07:54Z", "principal": "jbecker"}], "description": "Plataea is an ancient city of Boeotia, located south of Thebes. In 479 BC Plataea was the site of the Battle of Plataea, in which an allied Greek army defeated the Persians. Plataea was destroyed in the Peloponnesian War by Thebes and Sparta in 427 BC and rebuilt in 386 BC.", "title": "Plataea", "reprPoint": [23.273344999999996, 38.221257000000001], "features": [{"geometry": {"type": "Point", "coordinates": [23.273344999999999, 38.221257000000001]}, "type": "Feature", "properties": {"snippet": "Settlement; 750 BC - AD 640", "link": "http://pleiades.stoa.org/places/541063/dare-location", "description": "Representative point location, site precision", "location_precision": "precise", "title": "DARE Location"}, "id": "dare-location"}, {"geometry": {"type": "Point", "coordinates": [23.27486, 38.213999000000001]}, "type": "Feature", "properties": {"snippet": "Unknown; 750 BC - AD 640", "link": "http://pleiades.stoa.org/places/541063/darmc-location-5554", "description": "500K scale point location", "location_precision": "precise", "title": "DARMC location 5554"}, "id": "darmc-location-5554"}, {"geometry": {"type": "Point", "coordinates": [23.267337000000001, 38.211934999999997]}, "type": "Feature", "properties": {"snippet": "Unknown; 750 BC - AD 640", "link": "http://pleiades.stoa.org/places/541063/darmc-location-11744", "description": "TIB point location", "location_precision": "precise", "title": "DARMC location 11744"}, "id": "darmc-location-11744"}], "names": ["Plataea", "\u03a0\u03bb\u03ac\u03c4\u03b1\u03b9\u03b1\u03b9"], "type": "FeatureCollection", "id": "541063", "bbox": [23.273344999999999, 38.221257000000001, 23.273344999999999, 38.221257000000001]}
                        
                        ;
                        
                        var v541063 =  L.geoJson(geojsonFeature541063, {
                        
                        
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
                    
                        
                        var geojsonFeature540689 =
                        {"connectsWith": ["540987", "540787", "541146", "540791", "541179", "543884", "809327743", "540801", "580114", "541138", "540913"], "recent_changes": [{"modified": "2015-10-28T16:18:15Z", "principal": "jbecker"}, {"modified": "2015-09-07T11:52:41Z", "principal": "pmotylewicz"}], "description": "A region of central Greece inhabited since prehistoric times. ", "title": "Boeotia", "reprPoint": [23.1835855, 38.345856133333335], "features": [], "names": ["Boeotia", "\u0392\u03bf\u03b9\u03c9\u03c4\u03af\u03b1"], "type": "FeatureCollection", "id": "540689", "bbox": [22.746666999999999, 38.256503000000002, 23.586234000000001, 38.493319]}
                        
                        ;
                        
                        var v540689 =  L.geoJson(geojsonFeature540689, {
                        
                        
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
                    
                        var geojsonFeature922698 =
                        {"connectsWith": [], "recent_changes": [{"modified": "2012-02-15T09:38:23Z", "principal": "admin"}], "description": "An ancient place, cited: BAtlas 94 B3 Persis/Pars", "title": "Persis/Pars", "reprPoint": [51.5, 30.5], "features": [{"geometry": {"type": "Polygon", "coordinates": [[[51.0, 30.0], [51.0, 31.0], [52.0, 31.0], [52.0, 30.0], [51.0, 30.0]]]}, "type": "Feature", "properties": {"snippet": "Unknown; 550 BC - AD 640", "link": "http://pleiades.stoa.org/places/922698/batlas-location", "description": "", "location_precision": "rough", "title": "Barrington Atlas location"}, "id": "batlas-location"}], "names": ["Persis", "Pars"], "type": "FeatureCollection", "id": "922698", "bbox": [51.0, 30.0, 52.0, 31.0]}
                        
                        ;
                        
                        var v922698 = L.geoJson(geojsonFeature922698).addTo(map);
                        
                    
                        var geojsonFeature570406 =
                        {"connectsWith": ["570561", "570706", "570248", "570685"], "recent_changes": [{"modified": "2015-10-30T22:04:26Z", "principal": "jbecker"}, {"modified": "2012-02-15T06:30:45Z", "principal": "admin"}], "description": "Lacedaemon/Laconia is a region comprising the south-eastern part of the Peloponnese.", "title": "Lacedaemon/Laconia", "reprPoint": [22.371002200000003, 37.065926733333335], "features": [{"geometry": {"type": "Polygon", "coordinates": [[[22.0, 37.0], [22.0, 37.5], [22.5, 37.5], [22.5, 37.0], [22.0, 37.0]]]}, "type": "Feature", "properties": {"snippet": "Unknown; 750 BC - AD 300", "link": "http://pleiades.stoa.org/places/570406/batlas-location", "description": "", "location_precision": "rough", "title": "Barrington Atlas location"}, "id": "batlas-location"}], "names": ["Lacedaemon", "Laconia"], "type": "FeatureCollection", "id": "570406", "bbox": [22.333493099999998, 36.953544000000001, 22.435455000000001, 37.161519699999999]}
                        
                        ;
                        
                        var v570406 = L.geoJson(geojsonFeature570406).addTo(map);
                        
                    
                        
                        var geojsonFeature541140 =
                        {"connectsWith": ["540929"], "recent_changes": [{"modified": "2015-06-22T21:42:47Z", "principal": "jbecker"}, {"modified": "2012-10-20T20:58:11Z", "principal": "sgillies"}], "description": "Thermopylae is the name of a narrow pass leading from Thessaly into Locris. It was the site of a pivotal battle during the Graeco-Persian wars in 480 BC.", "title": "Thermopylae", "reprPoint": [22.538293999999997, 38.796511000000002], "features": [{"geometry": {"type": "Point", "coordinates": [22.538294, 38.796511000000002]}, "type": "Feature", "properties": {"snippet": "Fort", "link": "http://pleiades.stoa.org/places/541140/dare-location", "description": "Representative point location, site precision", "location_precision": "precise", "title": "DARE Location"}, "id": "dare-location"}, {"geometry": {"type": "Point", "coordinates": [22.548994, 38.795489000000003]}, "type": "Feature", "properties": {"snippet": "Unknown", "link": "http://pleiades.stoa.org/places/541140/darmc-location-8365", "description": "500K scale point location", "location_precision": "precise", "title": "DARMC location 8365"}, "id": "darmc-location-8365"}], "names": ["\u0398\u03b5\u03c1\u03bc\u03bf\u03c0\u03cd\u03bb\u03b1\u03b9", "Thermopylae"], "type": "FeatureCollection", "id": "541140", "bbox": [22.538294, 38.796511000000002, 22.538294, 38.796511000000002]}
                        
                        ;
                        
                        var v541140 =  L.geoJson(geojsonFeature541140, {
                        
                        
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
                    
                        
                        var geojsonFeature599799 =
                        {"connectsWith": ["599777", "599668", "599671"], "recent_changes": [{"modified": "2013-08-22T16:35:49Z", "principal": "admin"}, {"modified": "2013-05-17T00:16:02Z", "principal": "jbecker"}], "description": "A major city in Caria", "title": "Miletus", "reprPoint": [27.2774885, 37.5292362], "features": [{"geometry": {"type": "Point", "coordinates": [27.2774885, 37.5292362]}, "type": "Feature", "properties": {"snippet": "Settlement; 750 BC - AD 640", "link": "http://pleiades.stoa.org/places/599799/dare-location", "description": "Representative point location, site precision", "location_precision": "precise", "title": "DARE Location"}, "id": "dare-location"}, {"geometry": {"type": "Point", "coordinates": [27.275676399999998, 37.531213100000002]}, "type": "Feature", "properties": {"snippet": "Theatre, ; 550 BC - AD 640", "link": "http://pleiades.stoa.org/places/599799/location-of-theater-of-miletus", "description": "Location based on OpenStreetMap", "location_precision": "precise", "title": "location of theater of Miletus"}, "id": "location-of-theater-of-miletus"}, {"geometry": {"type": "Point", "coordinates": [27.279561000000001, 37.531525999999999]}, "type": "Feature", "properties": {"snippet": "Unknown; 750 BC - AD 640", "link": "http://pleiades.stoa.org/places/599799/darmc-location-4819", "description": "500K scale point location", "location_precision": "precise", "title": "DARMC location 4819"}, "id": "darmc-location-4819"}, {"geometry": {"type": "Point", "coordinates": [27.277901, 37.507952000000003]}, "type": "Feature", "properties": {"snippet": "Unknown; 750 BC - AD 640", "link": "http://pleiades.stoa.org/places/599799/darmc-location-24087", "description": "5M scale point location", "location_precision": "precise", "title": "DARMC location 24087"}, "id": "darmc-location-24087"}, {"geometry": {"type": "Point", "coordinates": [27.277901, 37.507952000000003]}, "type": "Feature", "properties": {"snippet": "Unknown; 750 BC - AD 640", "link": "http://pleiades.stoa.org/places/599799/darmc-location-24020", "description": "1M scale point location", "location_precision": "precise", "title": "DARMC location 24020"}, "id": "darmc-location-24020"}], "names": ["Milet", "Palatia", "Amtal\u0131n", "Balat", "Balat", "Miletos", "Mil\u0113tos, Miletos", "Am\u1e6dalin, Amtalin", "Miletus"], "type": "FeatureCollection", "id": "599799", "bbox": [27.2774885, 37.5292362, 27.2774885, 37.5292362]}
                        
                        ;
                        
                        var v599799 =  L.geoJson(geojsonFeature599799, {
                        
                        
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
                    
                        
                        var geojsonFeature599805 =
                        {"connectsWith": ["599905"], "recent_changes": [{"modified": "2013-02-25T20:08:56Z", "principal": "jbecker"}, {"modified": "2012-02-15T07:01:56Z", "principal": "admin"}], "description": "An ancient place, cited: BAtlas 61 E2 Mycale M.", "title": "Mycale M.", "reprPoint": [27.083333, 37.666666999999997], "features": [{"geometry": {"type": "Point", "coordinates": [27.083333, 37.666666999999997]}, "type": "Feature", "properties": {"snippet": "Mountain, ; AD 1700 - AD 2100", "link": "http://pleiades.stoa.org/places/599805/location-of-mycale-m", "description": "verified in Google Earth 2013.", "location_precision": "precise", "title": "location of Mycale M."}, "id": "location-of-mycale-m"}], "names": ["Mycale M."], "type": "FeatureCollection", "id": "599805", "bbox": [27.083333, 37.666666999999997, 27.083333, 37.666666999999997]}
                        
                        ;
                        
                        var v599805 =  L.geoJson(geojsonFeature599805, {
                        
                        
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
                    
                        var geojsonFeature1001887 =
                        {"connectsWith": [], "recent_changes": [{"modified": "2012-02-15T02:07:31Z", "principal": "admin"}], "description": "An ancient place, cited: BAtlas 102 E3 no. 1 (Europe)", "title": "Europe", "reprPoint": [27.5, 42.5], "features": [{"geometry": {"type": "Polygon", "coordinates": [[[25.0, 40.0], [25.0, 45.0], [30.0, 45.0], [30.0, 40.0], [25.0, 40.0]]]}, "type": "Feature", "properties": {"snippet": "Unknown", "link": "http://pleiades.stoa.org/places/1001887/batlas-location", "description": "", "location_precision": "rough", "title": "Barrington Atlas location"}, "id": "batlas-location"}], "names": ["Europe"], "type": "FeatureCollection", "id": "1001887", "bbox": [25.0, 40.0, 30.0, 45.0]}
                        
                        ;
                        
                        var v1001887 = L.geoJson(geojsonFeature1001887).addTo(map);
                        
                    
                        
                        var geojsonFeature501609 =
                        {"connectsWith": [], "recent_changes": [{"modified": "2013-11-17T03:28:36Z", "principal": "jbecker"}, {"modified": "2012-02-15T05:43:57Z", "principal": "admin"}], "description": "An ancient place, cited: BAtlas 51 G4 Sestos", "title": "Sestos", "reprPoint": [26.417224999999998, 40.228355999999998], "features": [{"geometry": {"type": "Point", "coordinates": [26.417224999999998, 40.228355999999998]}, "type": "Feature", "properties": {"snippet": "Unknown; 750 BC - AD 300", "link": "http://pleiades.stoa.org/places/501609/darmc-location-9525", "description": "500K scale point location", "location_precision": "precise", "title": "DARMC location 9525"}, "id": "darmc-location-9525"}], "names": ["Sestos"], "type": "FeatureCollection", "id": "501609", "bbox": [26.417224999999998, 40.228355999999998, 26.417224999999998, 40.228355999999998]}
                        
                        ;
                        
                        var v501609 =  L.geoJson(geojsonFeature501609, {
                        
                        
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
                    
                        
                        var geojsonFeature540726 =
                        {"connectsWith": ["203037083", "707804475", "513711610", "333036424", "333036425", "333036426", "464482219"], "recent_changes": [{"modified": "2015-03-20T17:47:25Z", "principal": "jbecker"}, {"modified": "2015-03-13T21:05:26Z", "principal": "thomase"}], "description": "The ancient pan-Hellenic sanctuary of Delphi in Greece, seat of the oracle of Apollo.", "title": "Delphi", "reprPoint": [22.501169000000001, 38.482289000000002], "features": [{"geometry": {"type": "Point", "coordinates": [22.501169000000001, 38.482289000000002]}, "type": "Feature", "properties": {"snippet": "Settlement; 750 BC - AD 640", "link": "http://pleiades.stoa.org/places/540726/dare-location", "description": "Representative point location, site precision", "location_precision": "precise", "title": "DARE Location"}, "id": "dare-location"}], "names": ["Delphi", "\u0394\u03b5\u03bb\u03c6\u03bf\u03af", "\u062f\u0644\u0641\u064a", "Delfos", "Delfi"], "type": "FeatureCollection", "id": "540726", "bbox": [22.501169000000001, 38.482289000000002, 22.501169000000001, 38.482289000000002]}
                        
                        ;
                        
                        var v540726 =  L.geoJson(geojsonFeature540726, {
                        
                        
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
                    
                        var geojsonFeature903080 =
                        {"connectsWith": [], "recent_changes": [{"modified": "2013-05-20T18:45:07Z", "principal": "jbecker"}, {"modified": "2012-02-15T09:29:56Z", "principal": "admin"}], "description": "Media/Mad(aya) was a region of northwestern Iran.", "title": "Media/Mad(aya)", "reprPoint": [46.5, 34.5], "features": [{"geometry": {"type": "Polygon", "coordinates": [[[46.0, 34.0], [46.0, 35.0], [47.0, 35.0], [47.0, 34.0], [46.0, 34.0]]]}, "type": "Feature", "properties": {"snippet": "Unknown; 750 BC - AD 640", "link": "http://pleiades.stoa.org/places/903080/batlas-location", "description": "", "location_precision": "rough", "title": "Barrington Atlas location"}, "id": "batlas-location"}], "names": ["Media", "Madaya", "Mad"], "type": "FeatureCollection", "id": "903080", "bbox": [46.0, 34.0, 47.0, 35.0]}
                        
                        ;
                        
                        var v903080 = L.geoJson(geojsonFeature903080).addTo(map);
                        
                    
                        
                        var geojsonFeature580062 =
                        {"connectsWith": ["580029", "580136", "579966", "579988", "570654", "579903", "580078", "582867", "582868", "116035285", "245682332"], "recent_changes": [{"modified": "2015-07-30T15:16:04Z", "principal": "jbecker"}, {"modified": "2012-10-20T21:55:17Z", "principal": "sgillies"}], "description": "The ancient, fortified port settlement (and deme) of ancient Athens.", "title": "Peiraieus/Piraeus", "reprPoint": [23.644608999999999, 37.937221999999998], "features": [{"geometry": {"type": "Point", "coordinates": [23.644608999999999, 37.937221999999998]}, "type": "Feature", "properties": {"snippet": "Settlement; 750 BC - AD 640", "link": "http://pleiades.stoa.org/places/580062/dare-location", "description": "Representative point location, site precision", "location_precision": "precise", "title": "DARE Location"}, "id": "dare-location"}, {"geometry": {"type": "Point", "coordinates": [23.644639000000002, 37.937277999999999]}, "type": "Feature", "properties": {"snippet": "Theatre, ; 330 BC - 30 BC", "link": "http://pleiades.stoa.org/places/580062/theater-of-zea", "description": "Visible remains of a Hellenistic theater located to the west of the Zea Harbor in Piraeus, dating ca. 200 BC.", "location_precision": "precise", "title": "Theater of Zea"}, "id": "theater-of-zea"}, {"geometry": {"type": "Point", "coordinates": [23.645455999999999, 37.938183000000002]}, "type": "Feature", "properties": {"snippet": "Unknown; 750 BC - AD 640", "link": "http://pleiades.stoa.org/places/580062/darmc-location-21312", "description": "Point location", "location_precision": "precise", "title": "DARMC location 21312"}, "id": "darmc-location-21312"}], "names": ["\u03a0\u03b5\u03b9\u03c1\u03b1\u03b9\u03b5\u03cd\u03c2", "Piraeus", "Piraeea", "Piraeeus", "\u03a0\u03b5\u03b9\u03c1\u03b1\u03b5\u1f50\u03c2"], "type": "FeatureCollection", "id": "580062", "bbox": [23.644608999999999, 37.937221999999998, 23.644608999999999, 37.937221999999998]}
                        
                        ;
                        
                        var v580062 =  L.geoJson(geojsonFeature580062, {
                        
                        
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
                    
                        var geojsonFeature580029 =
                        {"connectsWith": ["580062"], "recent_changes": [{"modified": "2013-09-07T04:03:12Z", "principal": "jbecker"}, {"modified": "2012-02-15T06:44:32Z", "principal": "admin"}], "description": "An ancient place, cited: BAtlas 59 B3 Mounichia Limen", "title": "Mounichia Limen", "reprPoint": [23.644608999999999, 37.937221999999998], "features": [{"geometry": {"type": "Polygon", "coordinates": [[[23.5, 37.75], [23.5, 38.0], [23.75, 38.0], [23.75, 37.75], [23.5, 37.75]]]}, "type": "Feature", "properties": {"snippet": "Unknown", "link": "http://pleiades.stoa.org/places/580029/batlas-location", "description": "", "location_precision": "rough", "title": "Barrington Atlas location"}, "id": "batlas-location"}], "names": ["Mounichia Limen"], "type": "FeatureCollection", "id": "580029", "bbox": [23.644608999999999, 37.937221999999998, 23.644608999999999, 37.937221999999998]}
                        
                        ;
                        
                        var v580029 = L.geoJson(geojsonFeature580029).addTo(map);
                        
                    
                        var geojsonFeature580071 =
                        {"connectsWith": [], "recent_changes": [{"modified": "2012-02-15T06:45:04Z", "principal": "admin"}], "description": "An ancient place, cited: BAtlas 59 B3 Phaleron Limen", "title": "Phaleron Limen", "reprPoint": [23.625, 37.875], "features": [{"geometry": {"type": "Polygon", "coordinates": [[[23.5, 37.75], [23.5, 38.0], [23.75, 38.0], [23.75, 37.75], [23.5, 37.75]]]}, "type": "Feature", "properties": {"snippet": "Unknown; 550 BC - AD 300", "link": "http://pleiades.stoa.org/places/580071/batlas-location", "description": "", "location_precision": "rough", "title": "Barrington Atlas location"}, "id": "batlas-location"}], "names": ["Phaleron Limen"], "type": "FeatureCollection", "id": "580071", "bbox": [23.5, 37.75, 23.75, 38.0]}
                        
                        ;
                        
                        var v580071 = L.geoJson(geojsonFeature580071).addTo(map);
                        
                    
                        
                        var geojsonFeature570106 =
                        {"connectsWith": ["570104"], "recent_changes": [{"modified": "2015-09-07T17:39:20Z", "principal": "jbecker"}, {"modified": "2012-10-23T17:18:19Z", "principal": "sgillies"}], "description": "Argos was a city of ancient Greece that reached its cultural highpoint under Pheidon in the seventh century BC.", "title": "Argos", "reprPoint": [22.719463999999999, 37.631560999999998], "features": [{"geometry": {"type": "Point", "coordinates": [22.719463999999999, 37.631560999999998]}, "type": "Feature", "properties": {"snippet": "Settlement; 750 BC - AD 300", "link": "http://pleiades.stoa.org/places/570106/dare-location", "description": "Representative point location, site precision", "location_precision": "precise", "title": "DARE Location"}, "id": "dare-location"}, {"geometry": {"type": "Point", "coordinates": [22.730905, 37.640672000000002]}, "type": "Feature", "properties": {"snippet": "Unknown; 750 BC - AD 300", "link": "http://pleiades.stoa.org/places/570106/darmc-location-3334", "description": "500K scale point location", "location_precision": "precise", "title": "DARMC location 3334"}, "id": "darmc-location-3334"}, {"geometry": {"type": "Point", "coordinates": [22.721032000000001, 37.626756]}, "type": "Feature", "properties": {"snippet": "Unknown; 750 BC - AD 300", "link": "http://pleiades.stoa.org/places/570106/darmc-location-24038", "description": "1M scale point location", "location_precision": "precise", "title": "DARMC location 24038"}, "id": "darmc-location-24038"}, {"geometry": {"type": "Point", "coordinates": [22.705327, 37.829650000000001]}, "type": "Feature", "properties": {"snippet": "Unknown; 750 BC - AD 300", "link": "http://pleiades.stoa.org/places/570106/darmc-location-24039", "description": "5M scale point location", "location_precision": "precise", "title": "DARMC location 24039"}, "id": "darmc-location-24039"}], "names": ["Argos", "Pelasgia", "\u1f0c\u03c1\u03b3\u03bf\u03c2"], "type": "FeatureCollection", "id": "570106", "bbox": [22.719463999999999, 37.631560999999998, 22.719463999999999, 37.631560999999998]}
                        
                        ;
                        
                        var v570106 =  L.geoJson(geojsonFeature570106, {
                        
                        
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
                    
                        
                        var geojsonFeature570685 =
                        {"connectsWith": ["570406", "570248"], "recent_changes": [{"modified": "2015-09-07T04:23:57Z", "principal": "jbecker"}, {"modified": "2012-10-20T21:52:29Z", "principal": "sgillies"}], "description": "Sparta was a prominent city-state (polis) of ancient Greece.", "title": "Sparta", "reprPoint": [22.429557500000001, 37.082716499999997], "features": [{"geometry": {"type": "Point", "coordinates": [22.435455000000001, 37.083300999999999]}, "type": "Feature", "properties": {"snippet": "Temple, ; 850 BC - AD 300", "link": "http://pleiades.stoa.org/places/570685/temple-of-artemis-orthia-4", "description": "Archaic temple dedicated to Artemis Orthia within the sanctuary of this goddess at Sparta. The site contained rich deposits of votives and masks.", "location_precision": "precise", "title": "Temple of Artemis Orthia"}, "id": "temple-of-artemis-orthia-4"}, {"geometry": {"type": "Point", "coordinates": [22.423660000000002, 37.082132000000001]}, "type": "Feature", "properties": {"snippet": "Settlement; 750 BC - AD 300", "link": "http://pleiades.stoa.org/places/570685/dare-location", "description": "Representative point location, site precision", "location_precision": "precise", "title": "DARE Location"}, "id": "dare-location"}, {"geometry": {"type": "Point", "coordinates": [22.423445000000001, 37.082741400000003]}, "type": "Feature", "properties": {"snippet": "Theatre, ; 550 BC - 330 BC", "link": "http://pleiades.stoa.org/places/570685/location-of-ancient-theater", "description": "Location based on OpenStreetMap", "location_precision": "precise", "title": "location of ancient theater"}, "id": "location-of-ancient-theater"}, {"geometry": {"type": "Point", "coordinates": [22.430937, 37.073678000000001]}, "type": "Feature", "properties": {"snippet": "Unknown; 750 BC - AD 300", "link": "http://pleiades.stoa.org/places/570685/darmc-location-6072", "description": "500K scale point location", "location_precision": "precise", "title": "DARMC location 6072"}, "id": "darmc-location-6072"}], "names": ["Sparta"], "type": "FeatureCollection", "id": "570685", "bbox": [22.423660000000002, 37.082132000000001, 22.435455000000001, 37.083300999999999]}
                        
                        ;
                        
                        var v570685 =  L.geoJson(geojsonFeature570685, {
                        
                        
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
                    
                        
                        var geojsonFeature599587 =
                        {"connectsWith": ["599588", "576206943"], "recent_changes": [{"modified": "2014-06-01T19:21:51Z", "principal": "jbecker"}, {"modified": "2013-06-14T17:22:23Z", "principal": "arabinowitz"}], "description": "The ancient settlement of Delos, located on the Aegean island of the same name.", "title": "Delos (settlement)", "reprPoint": [25.267471, 37.400438999999999], "features": [{"geometry": {"type": "Point", "coordinates": [25.268194000000001, 37.397274000000003]}, "type": "Feature", "properties": {"snippet": "Settlement; 750 BC - AD 300", "link": "http://pleiades.stoa.org/places/599587/dare-location", "description": "Representative point location, site precision", "location_precision": "precise", "title": "DARE Location"}, "id": "dare-location"}, {"geometry": {"type": "Point", "coordinates": [25.267222, 37.401667000000003]}, "type": "Feature", "properties": {"snippet": "Temple, ; 330 BC - AD 640", "link": "http://pleiades.stoa.org/places/599587/agora-of-the-italians", "description": "Hellenistic and Roman complex on the island of Delos", "location_precision": "precise", "title": "Agora of the Italians"}, "id": "agora-of-the-italians"}, {"geometry": {"type": "Point", "coordinates": [25.266997, 37.402375999999997]}, "type": "Feature", "properties": {"snippet": "Plaza, ; 750 BC - AD 640", "link": "http://pleiades.stoa.org/places/599587/terrace-of-the-lions", "description": "Nine white marble lions arranged in a single row along a terrace facing the sacred lake. The pathway marks an entry point into the city from the Bay of Skardana towards the shrine of Leto.", "location_precision": "precise", "title": "Terrace of the Lions"}, "id": "terrace-of-the-lions"}, {"geometry": {"type": "Point", "coordinates": [25.26904, 37.389479999999999]}, "type": "Feature", "properties": {"snippet": "Unknown; 750 BC - AD 300", "link": "http://pleiades.stoa.org/places/599587/darmc-location-12175", "description": "500K scale point location", "location_precision": "precise", "title": "DARMC location 12175"}, "id": "darmc-location-12175"}], "names": ["Delos"], "type": "FeatureCollection", "id": "599587", "bbox": [25.266997, 37.397274000000003, 25.268194000000001, 37.402375999999997]}
                        
                        ;
                        
                        var v599587 =  L.geoJson(geojsonFeature599587, {
                        
                        
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
                    
                        var geojsonFeature77402394 =
                        {"connectsWith": [], "recent_changes": [{"modified": "2013-09-09T23:42:19Z", "principal": "admin"}], "description": "A place from the TAVO Index", "title": "\u0130stanbul", "reprPoint": [28.75, 41.25], "features": [{"geometry": {"type": "Polygon", "coordinates": [[[28.5, 41.0], [28.5, 41.5], [29.0, 41.5], [29.0, 41.0], [28.5, 41.0]]]}, "type": "Feature", "properties": {"snippet": "Settlement; 1200 BC - AD 2000", "link": "http://pleiades.stoa.org/places/77402394/gane-location-30033", "description": "Approximate location from the TAVO index", "location_precision": "rough", "title": "GANE Location 30033"}, "id": "gane-location-30033"}], "names": ["\u0130stanbul, Istanbul", "\u0130stanbul, Istanbul", "\u0130slambol, Islambol", "Istanb\u016bl", "Byzantion", "bznt", "\u1e32us\u1e6dan\u1e6diniye, Kustantiniye, Qustantiniye", "Istanbul", "Qu\u1e63tan\u1e6d\u012bn\u012bya", "al-Qustant\u012bn\u012bya, al-Qustantiniya, el-Qustantiniye, al-Qustantiniyah, el-Qustantiniyeh", "Qu\u1e63\u1e6dan\u1e6d\u012bn\u012bya", "K\u014dnstantinoupolis, Konstantinoupolis", "Konstantino\u00fapolis", "Qos\u1e6dan\u1e6diniye, Qostantiniye", "Konstantinoupolis", "Konstantinopel"], "type": "FeatureCollection", "id": "77402394", "bbox": [28.5, 41.0, 29.0, 41.5]}
                        
                        ;
                        
                        var v77402394 = L.geoJson(geojsonFeature77402394).addTo(map);
                        
                    
                        
                        var geojsonFeature570702 =
                        {"connectsWith": ["570703", "570577"], "recent_changes": [{"modified": "2016-01-16T05:31:43Z", "principal": "jbecker"}, {"modified": "2012-02-15T06:33:37Z", "principal": "admin"}], "description": "An ancient settlement, located near the tip of a southern peninsula of the Peloponnese, known also by the name \"Tainaron\" in antiquity (modern Cape Matapon in Greece).", "title": "Tainaron (settlement)", "reprPoint": [22.482064000000001, 36.387566999999997], "features": [{"geometry": {"type": "Point", "coordinates": [22.482064000000001, 36.387566999999997]}, "type": "Feature", "properties": {"snippet": "Unknown; 750 BC - AD 300", "link": "http://pleiades.stoa.org/places/570702/darmc-location-24212", "description": "1M scale point location", "location_precision": "precise", "title": "DARMC location 24212"}, "id": "darmc-location-24212"}], "names": ["Tainaron"], "type": "FeatureCollection", "id": "570702", "bbox": [22.482064000000001, 36.387566999999997, 22.482064000000001, 36.387566999999997]}
                        
                        ;
                        
                        var v570702 =  L.geoJson(geojsonFeature570702, {
                        
                        
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
                    
                        
                        var geojsonFeature530835 =
                        {"connectsWith": ["1046", "530834"], "recent_changes": [{"modified": "2015-09-10T14:37:08Z", "principal": "jbecker"}, {"modified": "2013-03-07T15:05:12Z", "principal": "thomase"}], "description": "Corcyra Ins. (Kerkyra/Corfu) is an island in the Ionian Sea.", "title": "Corcyra (island)", "reprPoint": [19.75, 39.666666999999997], "features": [{"geometry": {"type": "Point", "coordinates": [19.75, 39.666666999999997]}, "type": "Feature", "properties": {"snippet": "Island, ; AD 1700 - AD 2100", "link": "http://pleiades.stoa.org/places/530835/location-of-corcyra-ins", "description": "Coordinates after BAtlas; verified in Google Earth 2013.", "location_precision": "precise", "title": "location of Corcyra Ins."}, "id": "location-of-corcyra-ins"}], "names": ["Corcyra", "\u039a\u03ad\u03c1\u03ba\u03c5\u03c1\u03b1", "\u039a\u03ad\u03c1\u03ba\u03c5\u03c1\u03b1", "Corfu"], "type": "FeatureCollection", "id": "530835", "bbox": [19.75, 39.666666999999997, 19.75, 39.666666999999997]}
                        
                        ;
                        
                        var v530835 =  L.geoJson(geojsonFeature530835, {
                        
                        
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
                    
                        var geojsonFeature531003 =
                        {"connectsWith": ["531025"], "recent_changes": [{"modified": "2012-02-15T06:00:52Z", "principal": "admin"}], "description": "An ancient place, cited: BAtlas 54 B2 Molossis", "title": "Molossis", "reprPoint": [20.925408999999998, 39.271166000000001], "features": [{"geometry": {"type": "Polygon", "coordinates": [[[20.0, 39.5], [20.0, 40.0], [20.5, 40.0], [20.5, 39.5], [20.0, 39.5]]]}, "type": "Feature", "properties": {"snippet": "Unknown; 550 BC - AD 300", "link": "http://pleiades.stoa.org/places/531003/batlas-location", "description": "", "location_precision": "rough", "title": "Barrington Atlas location"}, "id": "batlas-location"}], "names": ["Molossis"], "type": "FeatureCollection", "id": "531003", "bbox": [20.925408999999998, 39.271166000000001, 20.925408999999998, 39.271166000000001]}
                        
                        ;
                        
                        var v531003 = L.geoJson(geojsonFeature531003).addTo(map);
                        
                    
                        
                        var geojsonFeature570577 =
                        {"connectsWith": ["570181", "570654", "570103", "570495", "570407", "570123", "570185", "570175", "570184", "copy_of_570756", "570067", "570104", "570101", "570390", "570756", "570556", "570182", "570555", "570702", "570229", "570274", "570455", "570483", "570540", "570703", "570096", "570310", "570487", "570371"], "recent_changes": [{"modified": "2015-09-05T16:03:37Z", "principal": "jbecker"}], "description": "The large peninsula protuding into the Mediterranean Sea that constitutes the southern part of Greece. It is largely separated from mainland Greece on the north by the Corinthian Gulf, joining it only in the northeast via the narrow Isthmus of Corinth. ", "title": "Peloponnesus/Peloponnesos/Peloponnese", "reprPoint": [22.352045428571426, 37.298833214285715], "features": [], "names": ["\u03a0\u03b5\u03bb\u03bf\u03c0\u03cc\u03bd\u03bd\u03b7\u03c3\u03bf\u03c2", "\u03a0\u03b5\u03bb\u03bf\u03c0\u03bf\u03bd\u03bd\u03ae\u03c3\u03bf\u03c2", "\u1f08\u03c0\u03af\u03b1", "\u2019\u0399\u03bd\u03b1\u03c7\u1f77\u03b1", "\u03a0\u03b5\u03bb\u03bf\u03c0\u03cc\u03bd\u03bd\u03b1\u03c3\u03bf\u03c2"], "type": "FeatureCollection", "id": "570577", "bbox": [21.143868999999999, 36.387566999999997, 24.0, 38.316670000000002]}
                        
                        ;
                        
                        var v570577 =  L.geoJson(geojsonFeature570577, {
                        
                        
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
                    
                        
                        var geojsonFeature599822 =
                        {"connectsWith": ["560221", "560353", "599631", "954230963", "599540"], "recent_changes": [{"modified": "2013-03-07T15:16:58Z", "principal": "thomase"}, {"modified": "2013-02-06T20:17:48Z", "principal": "jbecker"}], "description": "Naxos is the largest of the Cycladic islands and was the center of the Cycladic civilization.", "title": "Naxos Ins.", "reprPoint": [25.489999999999998, 37.049999999999997], "features": [{"geometry": {"type": "Point", "coordinates": [25.489999999999998, 37.049999999999997]}, "type": "Feature", "properties": {"snippet": "Island, ; AD 1700 - AD 2100", "link": "http://pleiades.stoa.org/places/599822/location-of-naxos-ins", "description": "Coordinates after BAtlas; verified in Google Earth 2013 with reference to Wikipedia.", "location_precision": "precise", "title": "location of Naxos Ins."}, "id": "location-of-naxos-ins"}], "names": ["Naxos"], "type": "FeatureCollection", "id": "599822", "bbox": [25.489999999999998, 37.049999999999997, 25.489999999999998, 37.049999999999997]}
                        
                        ;
                        
                        var v599822 =  L.geoJson(geojsonFeature599822, {
                        
                        
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
                    
                        
                        var geojsonFeature550706 =
                        {"connectsWith": ["550701"], "recent_changes": [{"modified": "2013-09-10T00:44:09Z", "principal": "admin"}, {"modified": "2013-05-18T20:13:37Z", "principal": "jbecker"}], "description": "Magnesia ad Sipylum was an ancient city in Lydia in Asia Minor.  Lucius Cornelius Scipio Asiaticus defeated Antiochus the Great at the battle of Magnesia in 190 BC.", "title": "Magnesia ad Sipylum", "reprPoint": [27.487301500000001, 38.541316999999999], "features": [{"geometry": {"type": "Point", "coordinates": [27.438639999999999, 38.604382999999999]}, "type": "Feature", "properties": {"snippet": "Unknown; 550 BC - AD 640", "link": "http://pleiades.stoa.org/places/550706/darmc-location-4654", "description": "500K scale point location", "location_precision": "precise", "title": "DARMC location 4654"}, "id": "darmc-location-4654"}, {"geometry": {"type": "Point", "coordinates": [27.535962999999999, 38.478251]}, "type": "Feature", "properties": {"snippet": "Unknown; 550 BC - AD 640", "link": "http://pleiades.stoa.org/places/550706/darmc-location-14655", "description": "500K scale point location", "location_precision": "precise", "title": "DARMC location 14655"}, "id": "darmc-location-14655"}], "names": ["Saruhan", "Magnesia am Sipylos, Magnesia at Sipylos", "Magn\u0113sia, Magnesia", "Magn\u0113sia Sipylou", "Ma\u0121nisa, Maghnisa", "Ma\u0121n\u012bsiya, Maghnisiya, Maghnisiyah, Maghnisiyya, Maghnisiyyah, Maghnisiye, Maghnisiyeh, Maghnisiyye, Maghnisiyyeh", "Ma\u0121n\u012bsiy\u0101h", "Manisa, Mag\u0306nisa, Maghnisa", "Magnesia ad Sipylum"], "type": "FeatureCollection", "id": "550706", "bbox": [27.438639999999999, 38.478251, 27.535962999999999, 38.604382999999999]}
                        
                        ;
                        
                        var v550706 =  L.geoJson(geojsonFeature550706, {
                        
                        
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
                    
                        
                        var geojsonFeature501570 =
                        {"connectsWith": ["550944", "981526"], "recent_changes": [{"modified": "2015-01-10T23:15:22Z", "principal": "jbecker"}, {"modified": "2012-02-15T05:43:30Z", "principal": "admin"}], "description": "A Greek city located on the eastern side of the Hellespont. ", "title": "Pityoussa/Lampsacus", "reprPoint": [26.699162000000001, 40.346685000000001], "features": [{"geometry": {"type": "Point", "coordinates": [26.699162000000001, 40.346685000000001]}, "type": "Feature", "properties": {"snippet": "Unknown; 750 BC - AD 300", "link": "http://pleiades.stoa.org/places/501570/darmc-location-14306", "description": "500K scale point location", "location_precision": "precise", "title": "DARMC location 14306"}, "id": "darmc-location-14306"}], "names": ["Pityoussa", "\u039b\u03ac\u03bc\u03c8\u03b1\u03ba\u03bf\u03c2"], "type": "FeatureCollection", "id": "501570", "bbox": [26.699162000000001, 40.346685000000001, 26.699162000000001, 40.346685000000001]}
                        
                        ;
                        
                        var v501570 =  L.geoJson(geojsonFeature501570, {
                        
                        
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
                    
                        
                        var geojsonFeature599813 =
                        {"connectsWith": [], "recent_changes": [{"modified": "2013-05-03T14:24:49Z", "principal": "rmhorne"}, {"modified": "2012-02-15T07:02:03Z", "principal": "admin"}], "description": "An ancient place, cited: BAtlas 61 E2 Myous", "title": "Myous", "reprPoint": [27.433116999999999, 37.595252000000002], "features": [{"geometry": {"type": "Point", "coordinates": [27.433116999999999, 37.595252000000002]}, "type": "Feature", "properties": {"snippet": "Unknown; 550 BC - AD 300", "link": "http://pleiades.stoa.org/places/599813/darmc-location-5039", "description": "500K scale point location", "location_precision": "precise", "title": "DARMC location 5039"}, "id": "darmc-location-5039"}], "names": ["Myous"], "type": "FeatureCollection", "id": "599813", "bbox": [27.433116999999999, 37.595252000000002, 27.433116999999999, 37.595252000000002]}
                        
                        ;
                        
                        var v599813 =  L.geoJson(geojsonFeature599813, {
                        
                        
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
                    
                        
                        var geojsonFeature599778 =
                        {"connectsWith": [], "recent_changes": [{"modified": "2015-09-10T14:28:22Z", "principal": "jbecker"}, {"modified": "2012-10-20T20:38:05Z", "principal": "sgillies"}], "description": "An ancient place, cited: BAtlas 61 F2 Magnesia ad Maeandrum/Leukophrys", "title": "Magnesia ad Maeandrum/Leukophrys", "reprPoint": [27.518986999999999, 37.848005999999998], "features": [{"geometry": {"type": "Point", "coordinates": [27.518986999999999, 37.848005999999998]}, "type": "Feature", "properties": {"snippet": "Settlement; 550 BC - AD 640", "link": "http://pleiades.stoa.org/places/599778/dare-location", "description": "Representative point location, site precision", "location_precision": "precise", "title": "DARE Location"}, "id": "dare-location"}, {"geometry": {"type": "Point", "coordinates": [27.533090999999999, 37.853090999999999]}, "type": "Feature", "properties": {"snippet": "Unknown; 550 BC - AD 640", "link": "http://pleiades.stoa.org/places/599778/darmc-location-13587", "description": "500K scale point location", "location_precision": "precise", "title": "DARMC location 13587"}, "id": "darmc-location-13587"}], "names": ["Magnesia ad Maeandrum", "Leukophrys"], "type": "FeatureCollection", "id": "599778", "bbox": [27.518986999999999, 37.848005999999998, 27.518986999999999, 37.848005999999998]}
                        
                        ;
                        
                        var v599778 =  L.geoJson(geojsonFeature599778, {
                        
                        
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
                    
                        var geojsonFeature639034 =
                        {"connectsWith": ["639109"], "recent_changes": [{"modified": "2014-01-19T18:19:06Z", "principal": "jbecker"}, {"modified": "2012-02-15T07:30:37Z", "principal": "admin"}], "description": "An ancient place, cited: BAtlas 65 E4 Pamphylia", "title": "Pamphylia", "reprPoint": [30.98638, 36.990721000000001], "features": [{"geometry": {"type": "Polygon", "coordinates": [[[30.5, 36.5], [30.5, 37.0], [31.0, 37.0], [31.0, 36.5], [30.5, 36.5]]]}, "type": "Feature", "properties": {"snippet": "Unknown", "link": "http://pleiades.stoa.org/places/639034/batlas-location", "description": "", "location_precision": "rough", "title": "Barrington Atlas location"}, "id": "batlas-location"}], "names": ["Pamphylia"], "type": "FeatureCollection", "id": "639034", "bbox": [30.98638, 36.990721000000001, 30.98638, 36.990721000000001]}
                        
                        ;
                        
                        var v639034 = L.geoJson(geojsonFeature639034).addTo(map);
                        
                    
                        
                        var geojsonFeature638836 =
                        {"connectsWith": ["1043", "638776", "640251"], "recent_changes": [{"modified": "2013-05-30T02:35:06Z", "principal": "jbecker"}, {"modified": "2012-02-15T07:28:16Z", "principal": "admin"}], "description": "Eurymedon fl. (K\u00f6pr\u00fc\u00e7ay River)", "title": "Eurymedon fl.", "reprPoint": [31.181543900000001, 37.196853099999998], "features": [{"geometry": {"type": "Point", "coordinates": [31.181543900000001, 37.196853099999998]}, "type": "Feature", "properties": {"snippet": "River, ; AD 1700 - AD 2100", "link": "http://pleiades.stoa.org/places/638836/location-of-Eurymedon-fl", "description": "Location based on OpenStreetMap", "location_precision": "precise", "title": "location of Eurymedon fl."}, "id": "location-of-Eurymedon-fl"}], "names": ["Eurymedon"], "type": "FeatureCollection", "id": "638836", "bbox": [31.181543900000001, 37.196853099999998, 31.181543900000001, 37.196853099999998]}
                        
                        ;
                        
                        var v638836 =  L.geoJson(geojsonFeature638836, {
                        
                        
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
                    
                        var geojsonFeature707498 =
                        {"connectsWith": ["1043", "668339", "648602", "707532", "707534", "707517", "707437", "707617", "707502", "13818291", "13818292", "707468", "707445", "707462", "707526", "797419069", "707644", "707503", "707553", "172140914", "448083500", "790744210", "807160605", "707604", "707556", "707636", "707634", "707635", "707623", "707613", "707594", "707579", "707578", "707571", "707564", "707563", "707561", "707538", "707531", "707510", "707504", "707487", "707466", "707471", "707464", "707632", "707477", "751079112", "707459", "657559696", "707638", "707633", "707622", "707621", "707615", "707618", "707610", "707608", "707606", "707593", "707590", "707584", "707581", "707575", "707576", "707572", "707569", "707573", "707566", "707530", "707513", "707512", "707511", "707484", "707490", "754796063", "707519", "707628", "707626", "707607", "707574", "707549", "707546", "707541", "707533", "707529", "707523", "707558", "707496", "707478", "442917179", "707483", "707470", "707449", "707619", "208278117", "707596", "540510822", "707586", "707620", "707609", "707583", "707582", "707580", "707570", "707567", "707554", "707550", "707545", "707542", "707544", "707539", "707540", "707524", "707508", "707505", "707501", "707469", "707476", "707475", "380086882", "981516", "707624", "707555", "707551", "707642", "707455", "707639"], "recent_changes": [{"modified": "2013-08-01T14:51:58Z", "principal": "jbecker"}, {"modified": "2012-05-14T19:14:09Z", "principal": "sgillies"}], "description": "Third largest island in the Mediterranean Sea.", "title": "Cyprus (island)", "reprPoint": [33.149695017592585, 35.043728009259269], "features": [{"geometry": {"type": "Polygon", "coordinates": [[[32.0, 34.5], [32.0, 36.0], [35.0, 36.0], [35.0, 34.5], [32.0, 34.5]]]}, "type": "Feature", "properties": {"snippet": "Unknown", "link": "http://pleiades.stoa.org/places/707498/undetermined", "description": "", "location_precision": "rough", "title": "Barrington Atlas grid location"}, "id": "undetermined"}], "names": ["Cyprus"], "type": "FeatureCollection", "id": "707498", "bbox": [19.999995699999999, 34.573988999999997, 34.586367000000003, 35.692703000000002]}
                        
                        ;
                        
                        var v707498 = L.geoJson(geojsonFeature707498).addTo(map);
                        
                    
                        var geojsonFeature766 =
                        {"connectsWith": [], "recent_changes": [{"modified": "2015-02-25T04:54:32Z", "principal": "jbecker"}, {"modified": "2012-02-15T08:22:01Z", "principal": "admin"}], "description": "The Roman province of Egypt (Aegyptus) was established in 30 BC after the defeat of Marcus Antonius and Cleopatra VII at the Battle of Actium.", "title": "Aegyptus", "reprPoint": [32.5, 32.5], "features": [{"geometry": {"type": "Polygon", "coordinates": [[[30.0, 30.0], [30.0, 35.0], [35.0, 35.0], [35.0, 30.0], [30.0, 30.0]]]}, "type": "Feature", "properties": {"snippet": "Unknown", "link": "http://pleiades.stoa.org/places/766/batlas-location", "description": "", "location_precision": "rough", "title": "Barrington Atlas location"}, "id": "batlas-location"}], "names": ["Aegyptus"], "type": "FeatureCollection", "id": "766", "bbox": [30.0, 30.0, 35.0, 35.0]}
                        
                        ;
                        
                        var v766 = L.geoJson(geojsonFeature766).addTo(map);
                        
                    
                        var geojsonFeature727206 =
                        {"connectsWith": [], "recent_changes": [{"modified": "2012-05-03T17:26:14Z", "principal": "sgillies"}, {"modified": "2012-02-15T08:08:27Z", "principal": "admin"}], "description": "An ancient place, cited: BAtlas 74 D4 Prosopites Nomos", "title": "Prosopites Nomos", "reprPoint": [30.75, 30.25], "features": [{"geometry": {"type": "Polygon", "coordinates": [[[30.5, 30.0], [30.5, 30.5], [31.0, 30.5], [31.0, 30.0], [30.5, 30.0]]]}, "type": "Feature", "properties": {"snippet": "Unknown; 30 BC - AD 640", "link": "http://pleiades.stoa.org/places/727206/undetermined", "description": "", "location_precision": "rough", "title": "Undetermined location"}, "id": "undetermined"}], "names": ["Prosopites Nomos"], "type": "FeatureCollection", "id": "727206", "bbox": [30.5, 30.0, 31.0, 30.5]}
                        
                        ;
                        
                        var v727206 = L.geoJson(geojsonFeature727206).addTo(map);
                        
                    
                        
                        var geojsonFeature579888 =
                        {"connectsWith": ["585903", "540756", "560221", "579879", "579863", "580097", "579885", "579958", "606653928"], "recent_changes": [{"modified": "2015-09-07T17:40:04Z", "principal": "jbecker"}, {"modified": "2012-02-15T06:40:40Z", "principal": "admin"}], "description": "Historical region of Greece, centered on the Attic peninsula.", "title": "Attica", "reprPoint": [23.804119940441851, 38.037841368230843], "features": [], "names": ["\u1f08\u03c4\u03c4\u03b9\u03ba\u03ae", "Attica"], "type": "FeatureCollection", "id": "579888", "bbox": [23.374905999999999, 37.823770000000003, 24.028009000000001, 38.222726999999999]}
                        
                        ;
                        
                        var v579888 =  L.geoJson(geojsonFeature579888, {
                        
                        
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
                    
                        
                        var geojsonFeature580114 =
                        {"connectsWith": ["540672", "540689"], "recent_changes": [{"modified": "2015-10-30T16:24:39Z", "principal": "jbecker"}, {"modified": "2012-02-15T06:45:38Z", "principal": "admin"}], "description": "Tanagra was an ancient settlement of Boeotia. ", "title": "Tanagra", "reprPoint": [23.581173000000003, 38.300198333333334], "features": [{"geometry": {"type": "Point", "coordinates": [23.586234000000001, 38.304316999999998]}, "type": "Feature", "properties": {"snippet": "Unknown; 750 BC - AD 300", "link": "http://pleiades.stoa.org/places/580114/darmc-location-21559", "description": "Point location", "location_precision": "precise", "title": "DARMC location 21559"}, "id": "darmc-location-21559"}, {"geometry": {"type": "Point", "coordinates": [23.584378999999998, 38.295670999999999]}, "type": "Feature", "properties": {"snippet": "Unknown; 750 BC - AD 300", "link": "http://pleiades.stoa.org/places/580114/darmc-location-1284", "description": "TIB point location", "location_precision": "precise", "title": "DARMC location 1284"}, "id": "darmc-location-1284"}, {"geometry": {"type": "Point", "coordinates": [23.572906, 38.300606999999999]}, "type": "Feature", "properties": {"snippet": "Unknown; 750 BC - AD 300", "link": "http://pleiades.stoa.org/places/580114/darmc-location-6265", "description": "500K scale point location", "location_precision": "precise", "title": "DARMC location 6265"}, "id": "darmc-location-6265"}], "names": ["\u03a4\u03b1\u03bd\u03ac\u03b3\u03c1\u1fb3"], "type": "FeatureCollection", "id": "580114", "bbox": [23.572906, 38.295670999999999, 23.586234000000001, 38.304316999999998]}
                        
                        ;
                        
                        var v580114 =  L.geoJson(geojsonFeature580114, {
                        
                        
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
                    
                        
                        var geojsonFeature540975 =
                        {"connectsWith": [], "recent_changes": [{"modified": "2012-10-20T20:56:25Z", "principal": "sgillies"}, {"modified": "2012-02-15T06:08:21Z", "principal": "admin"}], "description": "An ancient place, cited: BAtlas 55 F4 Oinophyta?", "title": "Oinophyta?", "reprPoint": [23.638134999999998, 38.306286], "features": [{"geometry": {"type": "Point", "coordinates": [23.638134999999998, 38.306286]}, "type": "Feature", "properties": {"snippet": "Unknown; 750 BC - 30 BC", "link": "http://pleiades.stoa.org/places/540975/darmc-location-13994", "description": "500K scale point location", "location_precision": "precise", "title": "DARMC location 13994"}, "id": "darmc-location-13994"}], "names": ["Oinophyta"], "type": "FeatureCollection", "id": "540975", "bbox": [23.638134999999998, 38.306286, 23.638134999999998, 38.306286]}
                        
                        ;
                        
                        var v540975 =  L.geoJson(geojsonFeature540975, {
                        
                        
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
                    
                        
                        var geojsonFeature707534 =
                        {"connectsWith": ["707498", "709709"], "recent_changes": [{"modified": "2014-02-26T21:49:56Z", "principal": "jbecker"}, {"modified": "2012-10-20T20:19:16Z", "principal": "sgillies"}], "description": "Kition was an ancient city founded on the southern coast of Cyprus in the thirteenth century BC.", "title": "Kition", "reprPoint": [33.632745, 34.920211000000002], "features": [{"geometry": {"type": "Point", "coordinates": [33.632745, 34.920211000000002]}, "type": "Feature", "properties": {"snippet": "Settlement; 750 BC - AD 640", "link": "http://pleiades.stoa.org/places/707534/dare-location", "description": "Representative point location, site precision", "location_precision": "precise", "title": "DARE Location"}, "id": "dare-location"}, {"geometry": {"type": "Point", "coordinates": [33.629471000000002, 34.929597000000001]}, "type": "Feature", "properties": {"snippet": "Unknown; 750 BC - AD 640", "link": "http://pleiades.stoa.org/places/707534/darmc-location-13198", "description": "500K scale point location", "location_precision": "precise", "title": "DARMC location 13198"}, "id": "darmc-location-13198"}], "names": ["Kition", "Citium", "Qarth.ada\u0161t"], "type": "FeatureCollection", "id": "707534", "bbox": [33.632745, 34.920211000000002, 33.632745, 34.920211000000002]}
                        
                        ;
                        
                        var v707534 =  L.geoJson(geojsonFeature707534, {
                        
                        
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
                    
                        var geojsonFeature580022 =
                        {"connectsWith": [], "recent_changes": [{"modified": "2012-02-15T06:42:39Z", "principal": "admin"}], "description": "An ancient place, cited: BAtlas 59 C2 Marathonian Pedion", "title": "Marathonian Pedion", "reprPoint": [23.875, 38.125], "features": [{"geometry": {"type": "Polygon", "coordinates": [[[23.75, 38.0], [23.75, 38.25], [24.0, 38.25], [24.0, 38.0], [23.75, 38.0]]]}, "type": "Feature", "properties": {"snippet": "Unknown", "link": "http://pleiades.stoa.org/places/580022/batlas-location", "description": "", "location_precision": "rough", "title": "Barrington Atlas location"}, "id": "batlas-location"}], "names": ["Marathonian Pedion"], "type": "FeatureCollection", "id": "580022", "bbox": [23.75, 38.0, 24.0, 38.25]}
                        
                        ;
                        
                        var v580022 = L.geoJson(geojsonFeature580022).addTo(map);
                        
                    
                        var geojsonFeature521064 =
                        {"connectsWith": [], "recent_changes": [{"modified": "2015-01-18T02:48:54Z", "principal": "jbecker"}, {"modified": "2012-02-15T05:54:50Z", "principal": "admin"}], "description": "An ancient place, cited: BAtlas 53 B2 Kyaneai Inss.", "title": "Kyaneai Inss.", "reprPoint": [29.125, 41.125], "features": [{"geometry": {"type": "Polygon", "coordinates": [[[29.0, 41.0], [29.0, 41.25], [29.25, 41.25], [29.25, 41.0], [29.0, 41.0]]]}, "type": "Feature", "properties": {"snippet": "Unknown; 330 BC - AD 300", "link": "http://pleiades.stoa.org/places/521064/batlas-location", "description": "", "location_precision": "rough", "title": "Barrington Atlas location"}, "id": "batlas-location"}], "names": ["Kyaneai"], "type": "FeatureCollection", "id": "521064", "bbox": [29.0, 41.0, 29.25, 41.25]}
                        
                        ;
                        
                        var v521064 = L.geoJson(geojsonFeature521064).addTo(map);
                        
                    
                        
                        var geojsonFeature639051 =
                        {"connectsWith": [], "recent_changes": [{"modified": "2014-06-01T23:00:26Z", "principal": "jbecker"}, {"modified": "2012-10-23T17:26:21Z", "principal": "sgillies"}], "description": "An ancient place, cited: BAtlas 65 E4 Phaselis", "title": "Phaselis", "reprPoint": [30.551573000000001, 36.524579000000003], "features": [{"geometry": {"type": "Point", "coordinates": [30.551573000000001, 36.524579000000003]}, "type": "Feature", "properties": {"snippet": "Settlement; 550 BC - AD 640", "link": "http://pleiades.stoa.org/places/639051/dare-location", "description": "Representative point location, site precision", "location_precision": "precise", "title": "DARE Location"}, "id": "dare-location"}, {"geometry": {"type": "Point", "coordinates": [30.552665999999999, 36.522824]}, "type": "Feature", "properties": {"snippet": "Unknown; 550 BC - AD 640", "link": "http://pleiades.stoa.org/places/639051/darmc-location-1398", "description": "TIB point location", "location_precision": "precise", "title": "DARMC location 1398"}, "id": "darmc-location-1398"}, {"geometry": {"type": "Point", "coordinates": [30.542908000000001, 36.521016000000003]}, "type": "Feature", "properties": {"snippet": "Unknown; 550 BC - AD 640", "link": "http://pleiades.stoa.org/places/639051/darmc-location-5500", "description": "500K scale point location", "location_precision": "precise", "title": "DARMC location 5500"}, "id": "darmc-location-5500"}], "names": ["Phaselis"], "type": "FeatureCollection", "id": "639051", "bbox": [30.551573000000001, 36.524579000000003, 30.551573000000001, 36.524579000000003]}
                        
                        ;
                        
                        var v639051 =  L.geoJson(geojsonFeature639051, {
                        
                        
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
                    
                        
                        var geojsonFeature638800 =
                        {"connectsWith": ["639035"], "recent_changes": [{"modified": "2016-02-22T04:42:50Z", "principal": "jbecker"}, {"modified": "2012-02-15T07:26:01Z", "principal": "admin"}], "description": "Cape Gelidonya.", "title": "Chelidonium Pr./Hiera Akra/Tauri Pr.", "reprPoint": [30.407, 36.215000000000003], "features": [{"geometry": {"type": "Point", "coordinates": [30.407, 36.215000000000003]}, "type": "Feature", "properties": {"snippet": "Cape, ; AD 1700 - AD 2100", "link": "http://pleiades.stoa.org/places/638800/location-of-chelidonium-pr.-hiera-akra-tauri-pr", "description": "verified in Google Earth 2013.", "location_precision": "precise", "title": "location of Chelidonium Pr./Hiera Akra/Tauri Pr."}, "id": "location-of-chelidonium-pr.-hiera-akra-tauri-pr"}], "names": ["Chelidonium Pr.", "Hiera Akra", "Tauri Pr."], "type": "FeatureCollection", "id": "638800", "bbox": [30.407, 36.215000000000003, 30.407, 36.215000000000003]}
                        
                        ;
                        
                        var v638800 =  L.geoJson(geojsonFeature638800, {
                        
                        
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
                    
                        var geojsonFeature541048 =
                        {"connectsWith": [], "recent_changes": [{"modified": "2012-02-15T06:09:23Z", "principal": "admin"}], "description": "An ancient place, cited: BAtlas 55 C4 Phocis", "title": "Phocis", "reprPoint": [22.25, 38.25], "features": [{"geometry": {"type": "Polygon", "coordinates": [[[22.0, 38.0], [22.0, 38.5], [22.5, 38.5], [22.5, 38.0], [22.0, 38.0]]]}, "type": "Feature", "properties": {"snippet": "Unknown", "link": "http://pleiades.stoa.org/places/541048/batlas-location", "description": "", "location_precision": "rough", "title": "Barrington Atlas location"}, "id": "batlas-location"}], "names": ["Phocis"], "type": "FeatureCollection", "id": "541048", "bbox": [22.0, 38.0, 22.5, 38.5]}
                        
                        ;
                        
                        var v541048 = L.geoJson(geojsonFeature541048).addTo(map);
                        
                    
                        var geojsonFeature540918 =
                        {"connectsWith": [], "recent_changes": [{"modified": "2013-12-22T14:48:22Z", "principal": "jbecker"}, {"modified": "2012-02-15T06:07:38Z", "principal": "admin"}], "description": "An ancient place, cited: BAtlas 55 D3 Locris Opuntia", "title": "Locris Opuntia", "reprPoint": [22.75, 38.75], "features": [{"geometry": {"type": "Polygon", "coordinates": [[[22.5, 38.5], [22.5, 39.0], [23.0, 39.0], [23.0, 38.5], [22.5, 38.5]]]}, "type": "Feature", "properties": {"snippet": "Unknown", "link": "http://pleiades.stoa.org/places/540918/batlas-location", "description": "", "location_precision": "rough", "title": "Barrington Atlas location"}, "id": "batlas-location"}], "names": ["Locris Opuntia"], "type": "FeatureCollection", "id": "540918", "bbox": [22.5, 38.5, 23.0, 39.0]}
                        
                        ;
                        
                        var v540918 = L.geoJson(geojsonFeature540918).addTo(map);
                        
                    
                        
                        var geojsonFeature543756 =
                        {"connectsWith": [], "recent_changes": [{"modified": "2012-08-20T18:03:41Z", "principal": "sgillies"}, {"modified": "2012-02-15T06:12:55Z", "principal": "admin"}], "description": "An ancient settlement, attested by literary or documentary sources, whose precise location cannot be determined today", "title": "Koroneia", "reprPoint": null, "features": [{"geometry": null, "type": "Feature", "properties": {"snippet": "Unknown; 750 BC - AD 300", "link": "http://pleiades.stoa.org/places/543756/batlas-location", "description": "", "location_precision": "unlocated", "title": "Barrington Atlas location"}, "id": "batlas-location"}], "names": ["Koroneia"], "type": "FeatureCollection", "id": "543756", "bbox": null}
                        
                        ;
                        
                        var v543756 =  L.geoJson(geojsonFeature543756, {
                        
                        
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
                    
                        
                        var geojsonFeature570268 =
                        {"connectsWith": [], "recent_changes": [{"modified": "2013-06-04T18:59:36Z", "principal": "jbecker"}, {"modified": "2012-10-23T17:19:21Z", "principal": "sgillies"}], "description": "An ancient place, cited: BAtlas 58 D4 Gyth(e)ion", "title": "Gyth(e)ion", "reprPoint": [22.562341, 36.763663000000001], "features": [{"geometry": {"type": "Point", "coordinates": [22.562341, 36.763663000000001]}, "type": "Feature", "properties": {"snippet": "Settlement; 750 BC - AD 300", "link": "http://pleiades.stoa.org/places/570268/dare-location", "description": "Representative point location, site precision", "location_precision": "precise", "title": "DARE Location"}, "id": "dare-location"}, {"geometry": {"type": "Point", "coordinates": [22.562860000000001, 36.756481999999998]}, "type": "Feature", "properties": {"snippet": "Unknown; 750 BC - AD 300", "link": "http://pleiades.stoa.org/places/570268/darmc-location-3007", "description": "500K scale point location", "location_precision": "precise", "title": "DARMC location 3007"}, "id": "darmc-location-3007"}], "names": ["Gytheion", "Gythion"], "type": "FeatureCollection", "id": "570268", "bbox": [22.562341, 36.763663000000001, 22.562341, 36.763663000000001]}
                        
                        ;
                        
                        var v570268 =  L.geoJson(geojsonFeature570268, {
                        
                        
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
                    
                        
                        var geojsonFeature540775 =
                        {"connectsWith": ["638269272", "541117", "540736", "540911", "570336", "540909", "579925"], "recent_changes": [{"modified": "2015-09-09T13:27:31Z", "principal": "jbecker"}, {"modified": "2015-09-09T08:40:37Z", "principal": "pmotylewicz"}], "description": "Euboea is the second largest Greek island by area and is separated from the Greek mainland by the Euripus Strait.", "title": "Euboea (island)", "reprPoint": [23.870000000000001, 38.530000000000001], "features": [{"geometry": {"type": "Point", "coordinates": [23.870000000000001, 38.530000000000001]}, "type": "Feature", "properties": {"snippet": "Island, ; AD 1700 - AD 2100", "link": "http://pleiades.stoa.org/places/540775/location-of-euboea-ins", "description": "Coordinates after BAtlas; verified in Google Earth 2013 with reference to Wikipedia.", "location_precision": "precise", "title": "location of Euboea Ins."}, "id": "location-of-euboea-ins"}], "names": ["Euboea", "\u0395\u1f54\u03b2\u03bf\u03b9\u03b1"], "type": "FeatureCollection", "id": "540775", "bbox": [23.870000000000001, 38.530000000000001, 23.870000000000001, 38.530000000000001]}
                        
                        ;
                        
                        var v540775 =  L.geoJson(geojsonFeature540775, {
                        
                        
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
                    
                        
                        var geojsonFeature599926 =
                        {"connectsWith": ["599668", "599669", "599924", "599992", "640889631", "600982", "629167850", "599902", "599710", "599825", "599688", "599641"], "recent_changes": [{"modified": "2015-09-09T01:18:40Z", "principal": "jbecker"}, {"modified": "2015-09-08T19:58:11Z", "principal": "pmotylewicz"}], "description": "The island of Samos.", "title": "Samos (island)", "reprPoint": [26.84, 37.729999999999997], "features": [{"geometry": {"type": "Point", "coordinates": [26.84, 37.729999999999997]}, "type": "Feature", "properties": {"snippet": "Island, ; AD 1700 - AD 2100", "link": "http://pleiades.stoa.org/places/599926/location-of-samos-ins", "description": "Coordinates after BAtlas with reference to Wikipedia; verified in Google Earth 2013.", "location_precision": "precise", "title": "location of Samos Ins."}, "id": "location-of-samos-ins"}], "names": ["Samos", "\u03a3\u03ac\u03bc\u03bf\u03c2"], "type": "FeatureCollection", "id": "599926", "bbox": [26.84, 37.729999999999997, 26.84, 37.729999999999997]}
                        
                        ;
                        
                        var v599926 =  L.geoJson(geojsonFeature599926, {
                        
                        
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
                    
                        
                        var geojsonFeature570468 =
                        {"connectsWith": [], "recent_changes": [{"modified": "2015-08-03T21:43:00Z", "principal": "jbecker"}, {"modified": "2012-02-15T06:31:22Z", "principal": "admin"}], "description": "Megara was an important ancient city of Greece, located in the northern part of the the Isthmus of Corinth opposite the island of Salamis.", "title": "Megara", "reprPoint": [23.340163, 37.985078000000001], "features": [{"geometry": {"type": "Point", "coordinates": [23.340163, 37.985078000000001]}, "type": "Feature", "properties": {"snippet": "Unknown; 750 BC - AD 300", "link": "http://pleiades.stoa.org/places/570468/darmc-location-4793", "description": "500K scale point location", "location_precision": "precise", "title": "DARMC location 4793"}, "id": "darmc-location-4793"}], "names": ["\u039c\u03ad\u03b3\u03b1\u03c1\u03b1"], "type": "FeatureCollection", "id": "570468", "bbox": [23.340163, 37.985078000000001, 23.340163, 37.985078000000001]}
                        
                        ;
                        
                        var v570468 =  L.geoJson(geojsonFeature570468, {
                        
                        
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
                    
                        
                        var geojsonFeature481818 =
                        {"connectsWith": ["196789404", "481865", "1004"], "recent_changes": [{"modified": "2014-12-05T19:29:54Z", "principal": "jbecker"}, {"modified": "2012-10-20T22:13:51Z", "principal": "sgillies"}], "description": "A city founded in 627 B.C. by colonists from Corinth and Kerkyra.", "title": "Dyrr(h)achium/Epidamnos", "reprPoint": [19.444876000000001, 41.316434999999998], "features": [{"geometry": {"type": "Point", "coordinates": [19.444876000000001, 41.316434999999998]}, "type": "Feature", "properties": {"snippet": "Settlement; 750 BC - AD 640", "link": "http://pleiades.stoa.org/places/481818/dare-location", "description": "Representative point location, site precision", "location_precision": "precise", "title": "DARE Location"}, "id": "dare-location"}, {"geometry": {"type": "Point", "coordinates": [19.449833999999999, 41.316249999999997]}, "type": "Feature", "properties": {"snippet": "Unknown; 750 BC - AD 300", "link": "http://pleiades.stoa.org/places/481818/darmc-location-24631", "description": "1M scale point location", "location_precision": "precise", "title": "DARMC location 24631"}, "id": "darmc-location-24631"}, {"geometry": {"type": "Point", "coordinates": [19.445180199999999, 41.312382800000002]}, "type": "Feature", "properties": {"snippet": "Amphitheatre, ; 30 BC - AD 300", "link": "http://pleiades.stoa.org/places/481818/location-of-roman-amphitheater", "description": "position based on OSM coordinates", "location_precision": "precise", "title": "location of Roman amphitheater"}, "id": "location-of-roman-amphitheater"}], "names": ["Dyrrhachium", "Dyrrachium", "\u1f18\u03c0\u1f77\u03b4\u03b1\u03bc\u03bd\u03bf\u03c2"], "type": "FeatureCollection", "id": "481818", "bbox": [19.444876000000001, 41.316434999999998, 19.444876000000001, 41.316434999999998]}
                        
                        ;
                        
                        var v481818 =  L.geoJson(geojsonFeature481818, {
                        
                        
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
                    
                        
                        var geojsonFeature570182 =
                        {"connectsWith": ["570577", "570347", "570059"], "recent_changes": [{"modified": "2015-06-20T20:49:30Z", "principal": "jbecker"}, {"modified": "2014-05-29T13:39:02Z", "principal": "jherbst"}], "description": "The ancient Greek and Roman city of Corinth, located in the Peloponnese, Greece. Also known today as Archaia Korinthos and not to be confused with the nearby modern town.", "title": "Corinthus/Korinthos", "reprPoint": [22.879189, 37.906033000000001], "features": [{"geometry": {"type": "Point", "coordinates": [22.879189, 37.906033000000001]}, "type": "Feature", "properties": {"snippet": "Unknown; 550 BC - AD 640", "link": "http://pleiades.stoa.org/places/570182/center-of-the-temple-of-apollo-at-corinth", "description": "The second temple of Apollo at Corinth whose reconstructed remains are visible on the site today.", "location_precision": "precise", "title": "Center of the Temple of Apollo at Corinth"}, "id": "center-of-the-temple-of-apollo-at-corinth"}], "names": ["Corinthus", "Aigiales", "Aigialos", "Sicyonia", "Corinth", "\u039a\u03cc\u03c1\u03b9\u03bd\u03b8\u03bf\u03c2"], "type": "FeatureCollection", "id": "570182", "bbox": [22.879189, 37.906033000000001, 22.879189, 37.906033000000001]}
                        
                        ;
                        
                        var v570182 =  L.geoJson(geojsonFeature570182, {
                        
                        
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
                    
                        
                        var geojsonFeature491701 =
                        {"connectsWith": ["491682"], "recent_changes": [{"modified": "2014-09-14T03:50:36Z", "principal": "jbecker"}, {"modified": "2012-02-15T05:36:10Z", "principal": "admin"}], "description": "Poteidaia/Kassandreia was a Greek colony founded ca. 600 BC by Corinthians on the peninsula of Pallene in western Chalcidice.", "title": "Poteidaia/Kassandreia", "reprPoint": [23.327812000000002, 40.193696000000003], "features": [{"geometry": {"type": "Point", "coordinates": [23.327812000000002, 40.193696000000003]}, "type": "Feature", "properties": {"snippet": "Unknown; 750 BC - AD 300", "link": "http://pleiades.stoa.org/places/491701/darmc-location-24187", "description": "1M scale point location", "location_precision": "precise", "title": "DARMC location 24187"}, "id": "darmc-location-24187"}], "names": ["\u03a0\u03bf\u03c4\u03b5\u03af\u03b4\u03b1\u03b9\u03b1", "Kassandreia"], "type": "FeatureCollection", "id": "491701", "bbox": [23.327812000000002, 40.193696000000003, 23.327812000000002, 40.193696000000003]}
                        
                        ;
                        
                        var v491701 =  L.geoJson(geojsonFeature491701, {
                        
                        
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
                    
                        var geojsonFeature501638 =
                        {"connectsWith": ["316674974", "491556", "528109753"], "recent_changes": [{"modified": "2012-02-15T05:46:00Z", "principal": "admin"}], "description": "An ancient place, cited: BAtlas 51 F1 Thracia", "title": "Thracia", "reprPoint": [23.129408000000002, 40.288041], "features": [{"geometry": {"type": "Polygon", "coordinates": [[[25.5, 41.5], [25.5, 42.0], [26.0, 42.0], [26.0, 41.5], [25.5, 41.5]]]}, "type": "Feature", "properties": {"snippet": "Unknown; 750 BC - AD 640", "link": "http://pleiades.stoa.org/places/501638/batlas-location", "description": "", "location_precision": "rough", "title": "Barrington Atlas location"}, "id": "batlas-location"}], "names": ["Thracia"], "type": "FeatureCollection", "id": "501638", "bbox": [23.129408000000002, 40.288041, 23.129408000000002, 40.288041]}
                        
                        ;
                        
                        var v501638 = L.geoJson(geojsonFeature501638).addTo(map);
                        
                    
            
            var points = L.layerGroup([
            v580101, v501434, v579885, v579853, v599636, v579920, v541138, v541063, v540689, v541140, v599799, v599805, v501609, v540726, v580062, v570106, v570685, v599587, v570702, v530835, v570577, v599822, v550706, v501570, v599813, v599778, v638836, v579888, v580114, v540975, v707534, v639051, v638800, v543756, v570268, v540775, v599926, v570468, v481818, v570182, v491701
            ]);
            
            var poligons = L.layerGroup([
            v1001896, v580059, v580094, v580122, v981531, v922698, v570406, v1001887, v903080, v580029, v580071, v77402394, v531003, v639034, v707498, v766, v727206, v580022, v521064, v541048, v540918, v501638 
            ]);
            
            var baseMaps ={
            "Grayscale": grayscale,
            "Streets": streets,
            "ancient world": ancientworld
            
            
            }
            var overlayMaps = {
            "places": points,
            "regions": poligons,
            "roads": roads
            };
            
            L.control.layers(baseMaps, overlayMaps).addTo(map);
            
            function onMapClick(e) {
            alert("You clicked the map at " + e.latlng);
            }
            
            map.on('click', onMapClick);
            
        