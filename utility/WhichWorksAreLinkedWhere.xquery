xquery version "3.0";

declare namespace tei="http://www.tei-c.org/ns/1.0";

declare namespace output="https://www.w3.org/TR/xslt-xquery-serialization-30/";
declare option output:method "html5";
declare option output:media-type "text/html";


<html>
<body>
 <ul>
 
 {
let $work := collection("../../test")//tei:TEI[@type='work']
let $manuscript := collection("../../test")//tei:TEI[@type='mss']
for $workcited in collection("../../test")//tei:title
let $id:= $workcited/@corresp
    return <li>{$work[@xml:id = $id]//tei:titleStmt/tei:title[1]}
    
    </li>
 }
 </ul>
 <ul>
 
 {
 
let $work := collection("../../test")//tei:TEI[@type='work']
 
for $manuscript in collection("../../test")//tei:TEI
    return <li>{$manuscript/@xml:id}
    <ul>
    {for $title in $manuscript//tei:title
        return <li>{$title/@corresp}</li>
    }
    </ul>
    </li>
 }
 </ul>
</body>
</html>
