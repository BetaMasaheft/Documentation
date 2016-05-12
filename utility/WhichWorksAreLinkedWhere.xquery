xquery version "3.0";

declare namespace tei="http://www.tei-c.org/ns/1.0";

declare namespace output="https://www.w3.org/TR/xslt-xquery-serialization-30/";
declare option output:method "html5";
declare option output:media-type "text/html";


<html>
<body>
 <ul>
 
 {
 
let $person := collection("../../Personstest")//tei:TEI
let $manuscript := collection("../../test")//tei:TEI
let $work := collection("../../workstest")//tei:TEI
for $workcited in distinct-values($manuscript//tei:title/@corresp)
    return <li>{
        if ($work[@xml:id = $workcited])
        then $work[@xml:id = $workcited]//tei:titleStmt/tei:title[1]/text()
        else $workcited
        }
    cited by
    <ul>
    {for $citingmss in $manuscript[//tei:title/@corresp = $workcited]
        return <li>{concat($citingmss//tei:titleStmt/tei:title[1]/text(),' (',$citingmss/@xml:id, ')')}</li>}
    {for $citingmss in $person[//tei:title/@corresp = $workcited]
        return <li>{concat($citingmss//tei:titleStmt/tei:title[1]/text(),' (',$citingmss/@xml:id, ')')}</li>}
    </ul>
    </li>
 }
 </ul>

</body>
</html>
