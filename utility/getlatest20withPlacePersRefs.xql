xquery version "1.0";

declare namespace t="http://www.tei-c.org/ns/1.0";
import module namespace config="https://www.betamasaheft.uni-hamburg.de/BetMas/config" at "config.xqm";


declare option exist:serialize "method=xhtml media-type=text/html indent=yes";


<html>
    <head>
       <title>Find Elements overview</title>
    </head>
    <body>
    <ul>
        {
        
       
let $latests := 
    for $alllatest in collection($config:data-rootMS, $config:data-rootPl, $config:data-rootPr, $config:data-rootIn, $config:data-rootW
    )//t:TEI[t:teiHeader//t:placeName[@ref] or t:teiHeader//t:persName[@ref] or t:text/t:body//t:placeName[@ref] or 
    t:body/t:body//t:placeName[@ref]]/t:teiHeader/t:revisionDesc/t:change[@when][@who = 'DR' or  @who =  'SG' or @who =  'ES' or @who =  'MV']
    order by xs:date($alllatest/@when) descending
    return $alllatest

for $latest at $count in subsequence($latests, 1, 20)
return
<li><a href="{string(root($latest)//t:TEI/@xml:id)}">{string(root($latest)//t:TEI/@xml:id)}</a>: on {string($latest/@when)}, {string($latest/@who)} [{$latest/text()}]
<ul>{
for $place in root($latest)//t:placeName[@ref]
return
<li>{string($place/@ref)}: {$place/text()}</li>
}
</ul>
<ul>{
for $person in root($latest)//t:persName[@ref]
return
<li>{string($person/@ref)}: {$person/text()}</li>
}
</ul>
</li>
}
        </ul>
    </body>
</html>


