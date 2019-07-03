xquery version "3.1";
declare namespace t="http://www.tei-c.org/ns/1.0";
declare namespace xi="http://www.w3.org/2001/XInclude";
(:to be run in oXygen:)
let $prefDef :=  
<xi:include href="https://raw.githubusercontent.com/BetaMasaheft/Documentation/master/prefixDef.xml">
            <xi:fallback>
               <p xmlns="http://www.tei-c.org/ns/1.0">Definitions of prefixes used.</p>
            </xi:fallback>
         </xi:include>
(:         needs the flag -tree:linked in preferences for saxon:)
(:change  local path to transform a different dataset:)
let $docs := collection('file:///Users/Liuzzo/Documents/BetMas/Works?select=*.xml;recurse=yes')
(:this can only loop the collection recursively, but then the file to be updated needs to be opened with doc 
https://stackoverflow.com/questions/34310470/xquery-collection-function-on-web-dav-server:)
for $file in $docs
let $head := doc(base-uri($file))//t:teiHeader
return
if($head) then (
let $id := string($head/parent::t:TEI/@xml:id)
let $fD := $head/t:fileDesc
let $text := $head/following-sibling::t:text
let $edesc := $head//t:encodingDesc
let $fulED := <encodingDesc xmlns="http://www.tei-c.org/ns/1.0">{$prefDef}</encodingDesc>
return

(:note that this sintax is different from the one implemented in eXist-db.:)
(
if($head/@xml:base) then () else ( insert node attribute xml:base {'https://betamasaheft.eu/'} into $head ),
if($text/@xml:base) then () else  ( insert node attribute xml:base {'https://betamasaheft.eu/'} into $text ),
if($head//t:encodingDesc)
        then (insert node $prefDef into $edesc)
        else (insert node $fulED after $fD)
           )
           )
           else ()