xquery version "3.1";
declare namespace t="http://www.tei-c.org/ns/1.0";
declare namespace xi="http://www.w3.org/2001/XInclude";
import module namespace config="https://www.betamasaheft.uni-hamburg.de/BetMas/config" at "xmldb:exist:///db/apps/BetMas/modules/config.xqm";


let $prefDef :=  <xi:include href="https://raw.githubusercontent.com/BetaMasaheft/Documentation/master/prefixDef.xml">
            <xi:fallback>
               <p xmlns="http://www.tei-c.org/ns/1.0">Definitions of prefixes used.</p>
            </xi:fallback>
         </xi:include>
 let $taxonomy := <xi:include href="https://raw.githubusercontent.com/BetaMasaheft/Authority-Files/master/taxonomy.xml">
               <xi:fallback>
                  <t:p>Beta maṣāḥǝft taxonomy.</t:p>
               </xi:fallback>
            </xi:include>
let $calendarDesc: =<xi:include xmlns:xi="http://www.w3.org/2001/XInclude"  href="https://raw.githubusercontent.com/BetaMasaheft/Documentation/master/calendarDesc.xml">
            <xi:fallback>
               <p xmlns="http://www.tei-c.org/ns/1.0">Calendars definitions.</p>
            </xi:fallback>
         </xi:include>         
            
for $doc in $config:collection-rootMS/id('RIE188')//t:teiHeader            
let $addpref := update insert $prefDef into $doc//t:encodingDesc       
let $addtaxonomy := update insert $taxonomy into $doc//t:encodingDesc
let $addcalendar := update insert $calendarDesc into $doc//t:profileDesc
            return
           $doc