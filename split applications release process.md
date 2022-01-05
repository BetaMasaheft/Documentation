This repository contains a series of libraries and applications developed and run in [exist-db](http://exist-db.org/) The packages are maintained here with this notes on how to set up the research environment for transparency and version tracking purposes. Once the new version is ready and online, the code is updated here and the release note going with it explains what has changed. This is the code used by the app displaying the data of the project. All js dependencies typically stored under resources in each application are not copied in this repo.

# Bet Mas Research Environment Split applications release process

This documentation is intended for the Tech Lead of the Beta maṣāḥǝft project and details the entire setup of the data and applications, their relations to one another and practical implications and procedural steps. It was written when upgrading the research environment from version 4 to version 5.2, which implied a lot of splitting up of data and applications, refactoring etc. to meet needs of speed, increased indexing requirements and maintainability.
Before going into process and details, here is an overview of what we have here.

## Quick steps to restore local development set up.
- install most up-to-date exist-db (currently 5.3)
- update conf.xml with pooling to 200, nodebuffer to -1, default permissions 775, preserve-white-space yes
- back up server data
- restore from server backup into new local version (takes hours)
- run repair:repair
- upload from GitHub repository development apps
- reindex data collections
- run makeFormattedBibliography on BetMasData
- run makeExpand on BetMasData to repopulate expanded dataset
- restart changing stuff and seeing what happens



## The data and applications in the GitHub repositories
All data is maintained in the same organization with this applications. We try to link issues and commits, PRs etc. so that we can make our way back in the history of the application.

### The Beta Masaheft Organization
The [Beta Masaheft organization](https://github.com/BetaMasaheft) hosts a number of repositories related to the Beta Masaheft research environment.

Issues are only kept in this repository also when they relate to others. Exception is made for Bibliography, Guidelines, Dillmann and traces-related repositories which, belonging to different project are reported in their own repositories.

For any questions on use of the application, data entry, use of these repositories, please consider using the DISCUSSIONS.

Application repositories
- _BetMas_ : The repository where all the applications related to Beta maṣāḥǝft and the support libraries are stored
- _Dillmann_ : The exist-db app serving the Online Lexicon Linguae Aethiopicae at https://betamasheft.eu/Dillmann
- _guidelinesApp_ : The application that runs the website of the Guidelines, a separate project about the ways in which data is edited.
- _alpheios2fs_ : a simple library with a transformation from the json format exported by Alpheios Alignment tools to the TEI  feature structure model with the values defined by the TraCES project.

Data repositories
- Manuscripts : TEI records for individual Ethiopian and Eritrean Manuscripts
- Works : TEI records for texts of the Ethiopian Literature
- Authority files : TEI records for each of the keywords used in the descriptions of Manuscripts, Works, Person, Places, Studies, Narratives and other Authority files.
- Persons : TEI records for persons and ethnic groups relevant for Ethiopian Manuscript Studies
- Places : TEI records for places relevant for Ethiopian Manuscript Studies
- Institutions : TEI records for repositories where some Manuscripts have been or are stored. This will include many churches, but should not be confused with them, as that of a repository is a different abstract notion
- Narratives : TEI records describing units of text without  a fixed word sequence
- Studies : TEI records for secondary literature works related to Ethiopian Studies
- RDF : resources like ontologies and RDF datasets for the parallel RDF serialization of the TEI XML data
- Schema : the Beta Masaheft schema, a TEI customization used to validate all types of files above.
- Guidelines : the repository of the text of the guidelines, collaboratively edited and pushed to the _guidelinesApp_ together with the Schema to provide all needed guidance and training to contributors of Beta Masaheft and other projects willing to use the same models
- alpheiosannotations :  a repository to store alignment exported from the Alpheios Alignment tool as json. These are pushed to the alpheios2fs application
- traces : the TEI exports of the annotations done by the TraCES project with the GeTa tool by Cristina Vertan.
- DomLib : the export of the data from the mycore instance where the EthioSpaRe catalogue data was stored. This was used as a basis to produce the collection ES into Manuscripts
- coordinates : a set of coordinates for places in Ethiopia inehrited from the Encyclopaedia Aethiopica

Utility repositories
- Documentation : This repository, where all una tantum scripts, and especially the ISSUES are kept. All issues are listed here.
- bibliography : this repository contains a githubpages website which gives initial guidance on the management of the bibliography for colleages at the HLCEES.
- styles : a fork of the CSL Styles repository for the maintainance of the HLCEES styles
- makePDF : a repository with an oxygen project set up with guidance to produce a PDF output from a set of manuscript records and related resources using the style of Aethiopica.
- SyntaxeDuCodex : contains the ontology designed for the representatio of structural relationships within a manuscript.
- Editor



#### The webhooks

The data is stored in repositories in this group and is pushed to the live app via webhooks in each repo which point to the gitsyncREPONAME.xql files in the modules collection.

### GitHub repositories related to BetMas but not part of the organization.
- [Traces](https://github.com/TraCES-Lexicon) Contains the GeTa Tool by Cristina Vertan and the Morphological Parser for Geez.
- syriaca.org
- Biblia arabica
- [DHEth](https://github.com/PietroLiuzzo/DHEth) the supporting visualization for the book [Digital Approaches to Ethiopian and Eritrean Studies](https://doi.org/10.2307/j.ctvrnfr3q) which gives a lot of details about the decisions leading to some implementations choices made here.

### External applications used by the project  and integrated into our workflow
- Zotero
- Alpheios Annotation
- Transkribus

## Local application steps

Set up a new exist-db instance locally. Possibly, this should happen during a data freeze, to avoid that data is updated while the application  and the relative lists and authority files are being reset.
Keep eXide and monex open to check things.
I move data usually from the oXygen data source explorer, not from the file manager in eXide.

### Prepare reference data
The reference data includes bibliography, autority-files, the data from GitHub and the additional data stored in BM.

#### Store indexes configurations
Prepare the collections needed and the relative collection.xconf files into system/configuration/db. Copies of these files are kept in the GitHub Repository `BetMas` in the same collection organization in which they are in the db structure into exist-db.

- _EthioStudies_ indexes the TEI XML export from Zotero
- _lists_ indexes the authority lists and titles
- _BetMasData_ indexes the data mirrored from GitHub to speed up the expansion process
- _expanded_ indexes the expanded data for searches and views in the web application
- _DillmannData_ indexes the TEI Dictionary data from Dillmann
- _TracesData_ indexes the TEI Feature Structures from the TraCES project and from _alpheios2fs_

Configurations should be applied WITHIN EXIDE before uploading the data. Make a change and apply configuration when asked after clicking SAVE.
Make sure permissions are ok (rwxrwxr-x) on the colllection.xconf and on the target collections

#### Store reference data
Once configurations are applied, data can be added with a decent indexing time.

1. _fonts_ : the fonts used by the PDF exports.
2. _lists_ : The data here needs to come from the latest on the live application. This takes few minutes.
    1. Download it from the _server_ into the `BetMas` GitHub repository (export from oXygen data source explorer view)
    2. commit that to `BetMas`
    3. upload from GitHub to the new _local_ instance.
    4. open and format the lists, they will be untidy due to the xquery update operations adding and not formatting.
3. _EthioStudies_ : The data here is a collection-by-collection export in TEI from the Zotero library. This takes about half hour.
     1. Generate the files from Zotero, selecting `export tags` and `generate xml:id` from the dialogue
     2. store them into the `BetMas` GitHub repository,
     3. commit  to `BetMas`
     4. upload from there to the local instance.
     5. an export as RDF from Zotero can also be prepared at this stage, exporting from Zotero and storing to the `RDF` GitHub repository with other reference data for the triplestore
4. _BetMasData_ : The main project data. This can take up to few hours. You will always meet errors in the data which can be fixed.
    - This is a copy of the GitHub repositories, without the Git files. Because sometimes the syncing module fails and some other times major overall changes or additions of data are done without the webhook on, it is better to take this data freshly from GitHub.  For each repository a subdirectory should exist named in lower case. Import there all subcollections as necessary. If some of the file exist already, overwrite them, so that the data is exactely what is in GitHub. If more files are present than should, remove them. One may clean all and then populate freshly, so avoid the issues of overwriting in folders.
    - IHA files are added as subfolders (rarely changed) can be copy-pasted from server in the propoer location.
    - _corpora_ is added from the current data on the server (very rarely changed) can be copy-pasted from server into BetMasData.
    - _choniajki_ is added from the current data on the server (static) can be copy-pasted from server into BetMasData.


#### Compile derivate datasets.
Here you will use the _BetMasService_ library. This step is needed only locally.

1. compile bibliography.xml within _lists_  with `makeFormattedBibliography.xql` which calls `generateFormattedBibliography.xqm` and following the formatting and adjustment instructions into that file. This can take two hours more or less. It is advisable to run this instead of updating the existing bibliography (which is done by gitsync whenever a file is merged into a repository) because this will spot wrong pointers and return logs with the errors. If the bibliography.xml previously in use has been edited, then before replacing it with the new one, perhaps consider a filediff importing the changes from the new production into the edited bibliography file.
2. update `canonicaltaxonomy.xml`. With this the lists will be all at the latest possible update status. If you want to do this newly, open the latest taxonomy.xml into _authority-files_ and run canonicaltaxonomy.xslt, from the XSLT collection into _BetMasService_ on it this will prompt a new canonical taxonomy with expanded names, which may be fixed before use.
3. make sure to make the files readable so that they are also indexed for the transformations to take place as quickly as possible. use permissions.xql into the _BetMasService_ library.
4. populate `expanded` with `makeExpand.xql` which calls `expand.xqm` and stores files to the `expanded` collection with the right permissions. this will use the lists, the _EthioStudies_ library and the _BetMasData_ library. Make sure they are indexed or the performance will be horrible. Run authority-lists with profiling on in monex, to check.
    - check that split files which need to be in parts to come through from GitHub have been remerged taking into consideration Xinclude statements. This should be the default behaviour.
    - this takes quite some time (16.9.21 it took, only for manuscripts 7468.928 seconds, so a bit more than 2 hours). To run an the entire data including IHA it takes really a lot. I usually run the smaller collections (narratives, authority-files, Institutions, Studies) and then let the biggest go overnight. I skip corpora and the choniajki dataset, these do not need expansion. you can check that all has been transformed with `tryout.xql` which will simply count resources in the subcollections so that you can see where there is something missing. If numbers do not match, update permissions and try again. Eventually export the data and compare with oxygen diff directories to see what is missing.
5. update data in Fuseki
    - make sure a collection exists called /rdf into /db . This should already contain subcollections for each item type, without subfolders
    - make sure Fuseki is running on localhost:3030 (see below),
    - make sure the triplestore is configured correctly and the betamasaheft graph is active and contains
            - _betamasaheftnew2.owl_ the ontology
            - _snap.rdf_ the SNAP ontology
            - _saws.rdf_ the SAWS ontology
            - _lawd.rdf_ the LAWD ontology
            - _equivalences.rdf_ a set of additional owl:sameAs statements.
            [actually, the reasoner is giving issues in the query. some errors in the ontologies are present which multiply instances, so, it is commented out from the configuration at the moment]
    - run `makeRDF.xql` changing the collection path for each of the main collections.  This will store in the collection into existdb the data and also update Fuseki. This will also take sometime (transformed to RDF and stored in Fuseki 179 file(s) in 13.996 seconds.
transformed to RDF and stored in Fuseki 8947 file(s) in 603.324 seconds.
transformed to RDF and stored in Fuseki 18003 file(s) in 2768.371 seconds.
transformed to RDF and stored in Fuseki 6619 file(s) in 964.014 seconds.
transformed to RDF and stored in Fuseki 16548 file(s) in 2348.666 seconds.) and not all file will end up in the triplestore. You can avoid this if you have a dump from the previous version from Fuseki. There are several steps in the TEI , in the transformation to RDF, and from XML to turtle that will have to be tackled but are minor at the moment. the most reasonable way to deal with them at the moment is to see when they cause errors.
    - add also the _EthioStudies.rdf_ export into the graph.



#### Store related applications datasets
The following should be copied from the current live application, or left to stay where they are already if the db is not upgraded.
1. _DillmannData_
2. _TracesData_

### Store applications

The release needs the following applications to be installed. These are all packaged and stored in GitHub repositories and their xar are also in the _BetMas_ repository in the xars directory where some of the applications are maintained.

- w3.css needs to be stored in /db/shared-resources/resources/css
- font awesome package to be stored under resources in the _BetMasWeb_ application

- dependency applications from exist-db Repository
     - eXide
     - backup
     - usermanager
     - package manager
     - monex
     - cripto
     - fundocs
     - openapi
     - teipublisher

- _BetMas_ : this is the application which contains
    - the main controller redirecting requests
    - the modules receiving data from GitHub, updating into _BetMasData_, _lists_
    - the modules for the xslt and xquery transformations of data in _expanded_ and _RDF_
    - the modules for updating the Apache Jena Fuseki triplestore
    - the schema for validation of the incoming data
- _BetMasService_: this is a small package containing
  - some scripts calling modules used in _BetMas_ to be used when preparing  a release or if there is any need to restart from scratch the database. It contains the file preparing the bibliography.xml file and a makeExpand.xql file to take data from _lists_ and _BetMasData_ to produce all the content of _expanded_ which are used by _BetMasWeb_.
  - some modules to fix permissions of files and add users to groups. Use these if the permissions got out wrong when importing files.
  - an xql script to register RESTXq modules, which is sometimes necessary. Running it will recompile the registry of the RESTxq functions used in _BetMasWeb_ and _BetMasAPIs_.

  This should only be installed on the local server, the presence on the web server is irrelevant.
- _BetMasWeb_: This is the application offering the betamasaheft.eu website. The Beta Masaheft app works at the moment with two of the application building models available in exist-db most functions have been taken from examples already available.
  - views generated with the model template system, based on html templates
  - views generated as RESTXQ responses to requests
it contains all the javascript and css needed by the application in the browser and also a limited data entry interface for creating new records for logged editors.
- _BetMasAPI_
- _gez-en_
- _guidelines_
- _parser_
- _alpheiosannotations_

## test rooting via proxy
install nginx with brew on mac.
copy the configurations from the server and run nginx
````
brew services start nginx
````
This should allow to test that the calls are directed correctly.

However, I have never really been able to run nginx on mac without conflicts, so I have httpd set up on mac.

To update the configuration I do

````
cd /private/etc/apache2/extra
sudo nano httpd-vhosts.conf
````
and make sure things like the following are There

````
<VirtualHost *:80>
ProxyRequests off
ServerName bet.mas
ProxyPass / http://localhost:8080/exist/apps/BetMasWeb/
ProxyPassReverse / http://localhost:8080/exist/apps/BetMasWeb/
ProxyPassReverseCookieDomain localhost bet.mas
ProxyPassReverseCookiePath /exist /
RewriteEngine on
RewriteRule         ^/(.*)$     /$1   [PT]
</VirtualHost>
````

which means that if I go to bet.mas in the browser it will open that application.
to save the configuration run
```
apachectl configtest
```
and if it is OK
```
sudo apachectl graceful
```
which will reload the configuration.

## server application steps
In theory, you should be able to make a backup of the local database, restore that on the server and all should be good. In practice it is not necessarily true. So, do it step by step. Also, most datasets are going to be more up-to-date in the synced version live, so, often upgrading selectively is much faster.


## relevant applications on web server
nginx
systmctl services
iipimage server
exist  
fuseki
tomcat + collatex

### Fuseki and RDF datasets

Since the log4j2 CVE, our instance of the latest Fuseki runs as a standalone server and resides in /media/add together with the corresponding Apache Jena distribution.

This is started with fuseki.service and is enabled at reboot.

To upgrade to a new version or restore from backup, for every dataset:
- make sure a recent backup is available, store it locally
- save the configurations in an accessible location
- download and unpack the distribution
- chown them to the user fusekirunner
- start Fuseki (with systemctl start fuseki)
- stop Fuseki (with systemctl stop fuseki)
- copy the configurations for the databases in the fuseki distribution under configuration
- start Fuseki (with systemctl start fuseki)
- this will run on port 3030, and this port is proxied by /fuseki/ in the nginx sites-available configuration
- open the nginx configuration and uncomment the client_max_body_size to allow more than the default 1Mb upload.
- reload nginx configuration (sudo service nginx reload)
- use the fuseki interface to upload the compressed backups of the data


### Collatex

Collatex runs as a war file into Tomcat.
tomcat@9, supported by Ubuntu 18, is installed using brew.
starting tomcat (sudo bin/catalina start) will make available the collatex war at /collatex/

### Image server
the IIPI image server is installed with sudo apt-get and is proxyed and redirected in the nginx configuration


## Update long term storage (FDMR)
Datasets and applications should be stored periodically, especially in occasion of (hence, after a) a successful release.


## Monitoring
- Amplify NGINX : you need to follow [this instructions](https://www.nginx.com/blog/setting-up-nginx-amplify-in-10-minutes/) to see the server and monitor ingoing requests and other parameters. This will require changing an API key, linked to your account in the server. This is used to see how the server in general is doing.
- Monex : you need an admin account on exist-db, keep it open and see what happens. This is used to check how the DB (exist-db) is behaving.
- Google pages : this has been deactivated by commenting out the relevant lines in the html templates because results are unchanging and add up time to page loading. This was used to have an idea of the usage of the html views of the website.

# References

- Liuzzo, P. M. 2021. ‘Linked Open Data based on La syntaxe du codex for Manuscripts in Beta maṣāḥǝft’, in S. Bond, P. Dilley, and R. Horne, eds, Linked Ancient World Data: An Open Access Cookbook, ISAW Papers (New  York: 2021).
- Liuzzo, P. M., Solomon Gebreyes, and D. Reule 2020. ‘Beta maṣāḥǝft TEI-XML Data’, UHH Data Notes, 1 (2020) (DOI: http://dx.doi.org/10.25592/DANO-01-001).
- Liuzzo, P. M. 2019. Digital Approaches to Ethiopian and Eritrean Studies, Supplement to Aethiopica, 8 (2019) (DOI: http://dx.doi.org/10.2307/j.ctvrnfr3q).
- Liuzzo, P., D. Reule, E. Sokolinski, Solomon Gebreyes, D. Elagina, D. Nosnistin, E. Dal Sasso, and J. Gnisci Beta maṣāḥǝft Guidelines (2018) <http://betamasaheft.eu/Guidelines/>, accessed 30 April 2018 (DOI: http://dx.doi.org/10.25592/BetaMasaheft.Guidelines).
- Reule, D. 2018. ‘Beta maṣāḥǝft: Manuscripts of Ethiopia and Eritrea’, in A. Bausi, P. Buzi, P. M. Liuzzo, and E. Sokolinski, eds, COMSt Bulletin, 4/1 presented at the workshop Linking Manuscripts from the Coptic, Ethiopian, and Syriac Domain: Present and Future Synergy Strategies, Hamburg, 23 and 24 February 2018 (2018), 13–27  (DOI: http://dx.doi.org/10.25592/uhhfdm.247).
