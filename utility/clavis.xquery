xquery version "3.0";

declare namespace tei="http://www.tei-c.org/ns/1.0";
declare namespace functx = "http://www.functx.com";

declare namespace output="https://www.w3.org/TR/xslt-xquery-serialization-30/";
declare option output:method "html";
(:declare option output:media-type "text/html";:)
declare function functx:trim
  ( $arg as xs:string? )  as xs:string {

   replace(replace($arg,'\s+$',''),'^\s+','')
 } ;
 

<html  lang="en">
<head>
      <title>Clavis</title>
      <meta charset="utf-8"/>
         <meta name="viewport" content="width=device-width, initial-scale=1"/>
            <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
      <style type="text/css">
  .row:nth-child(odd) 
  {{
    background: #e0e0e0;
}}
</style>
</head>
<body>
 <div class="container-fluid">
 
 {
 
let $person := collection("Persons")//tei:TEI
let $manuscript := collection("Manuscripts")//tei:TEI
for $work in collection("works1")//tei:TEI
    order by substring($work/@xml:id, 4, 4)
    return 
    <div class="row">
   <h2> {substring($work/@xml:id, 4, 4)} </h2>
   
    {
    <div class="col-md-2">
    <h3>Titles</h3>

    <ul>{    for $title in $work//tei:titleStmt/tei:title
       return
       <li>{$title/text()}</li>
 }      
       </ul>
       </div>
    }
    
    {
    
    <div class="col-md-2">
    <h3>Authors</h3>
    <ul>
{    for $author in $work//tei:titleStmt/tei:author
       return
       <li>{$author/text()}</li>
 }      
       </ul>
       </div>
    }
    
     {
     
    <div class="col-md-2">
    <h3>Bibliography</h3>
    <ul>
{   
for $bibl in $work//tei:listBibl[@type='catalogue' or @type='secondary']/tei:bibl/tei:ptr/@target[starts-with(.,'bm:')]
       let $zoteroRec := doc(concat('https://api.zotero.org/groups/358366/items?tag=',$bibl, '&amp;format=tei'))//tei:listBibl
       return
      <li>{
           if ($zoteroRec//tei:author)
           then $zoteroRec//tei:author/text()
           else $zoteroRec//tei:editor/text()
           }
           , {$zoteroRec//tei:title/text()}, {$zoteroRec//tei:date/text()}</li>
}
       </ul>
       </div>
    }
     {
     
    <div class="col-md-2">
    <h3>Witnesses</h3>
    <ul>
{    for $witness in $work//tei:listWit/tei:witness/@corresp
       return
       <li>{$manuscript[@xml:id = $witness]//tei:msIdentifier/tei:idno/text()}</li>
 }      
       </ul>
       </div>
    }
    
    {
     
    <div class="col-md-2">
    <h3>Relations</h3>
    <ul>
{    for $relation in tokenize(normalize-space($work//tei:listBibl/tei:relation/@passive),'#')
     let $relationtrim := functx:trim($relation)
     let $thiswork := $work[@xml:id = $relationtrim]
       return
       <li id="{$relationtrim}">
       {$thiswork}
       </li>
 }      
       </ul>
       </div>
    }
     {
     
    <div class="col-md-2">
    <h3>Contained in</h3>
   <ul>
{    for $MssContainer in $manuscript//tei:title[@ref = $work/@xml:id]
     let $idno := $MssContainer//ancestor::tei:msDesc/tei:msIdentifier/tei:idno/text()
     return
       <li id="{concat($MssContainer//ancestor::tei:TEI/@xml:id,'#',$MssContainer//ancestor::tei:msItem/@xml:id)}">{$idno}</li>
 }      
       </ul>
       </div>
    }
    </div>
 }
 </div>

</body>
</html>
