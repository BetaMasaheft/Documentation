This repository contains a series of libraries and applications devoloped and run in [exist-db](http://exist-db.org/) The packages are maintained here with this notes on how to set up the research environment for transparency and version tracking purposes. Once the new version is ready and online, the code is updated here and the release note going with it explains what has changed. This is the code used by the app displaying the data of the project. All js dependencies typically stored under resources in each application are not copied in this repo.

# Bet Mas Research Environment Split applications release process

This documentation is intended for the Tech Lead of the Beta Masaheft project and details the entire setup of the data and applications, their relations to one another and practical implications and procedural steps. It was written when upgrading the research environment from version 4 to version 5.2, which implied a lot of splitting up of data and applications, refactoring etc. to meet needs of speed, increased indexing requirements and maintainability.
Before going into process and details, here is an overview of what we have here.

## The data and applications in the GitHub repositories
All data is maintained in the same organization with this applications. We try to link issues and commits, PRs etc. so that we can make our way back in the history of the application.

### The Beta Masaheft Organization
The [Beta Masaheft organization](https://github.com/BetaMasaheft) hosts a number of repositories related to the Beta Masaheft research environment.

Application repositories
- BetMas . This repository
- Dillmann . The exist-db app serving the Online Lexicon Linguae Aethiopicae at https://betamasheft.eu/Dillmann
- guidelinesApp

data repositories
- Manuscripts
- Works
- Authority files
- Persons
- Places
- Institutions
- Narratives
- Studies
- RDF
- Schema
- Guidelines
- alpheiosannotations
- traces
- DomLib
- coordinates

utility repositories
- Documentation
- bibliography
- styles
- makePDF
- SyntaxeDuCodex
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
- Alpheios
-

## local application steps

Set up a new exist-db instance locally. Possibly, this should happen during a data freeze, to avoid that data is updated while the application  and the relative lists and authority files are being reset.
Keep eXide and monex open to check things.
I move data usually from the oXygen data source explorer, not from the file manager in eXide.

### Prepare reference data
The reference data includes bibliography, autority-files, the data from GitHub and the additional data stored in BM.

#### Store indexes configurations
Prepare the collections needed and the relative collection.xconf files into system/configuration/db. Copies of these files are kept in the GitHub Repository `BetMas`.

- _EthioStudies_
- _lists_
- _BetMasData_
- _expanded_
- _DillmannData_
- _TracesData_

Configurations should be applied WITHIN EXIDE. Make a change and apply configuration when asked after clicking SAVE.
Make sure permissions are ok (rwxrwxr-x) on the colllection.xconf and on the target collections

#### Store reference data
Once configurations are applied, data can be added with a decent indexing time.

1. _fonts_ : the fonts used by the PDF exports.
2. _lists_ : The data here needs to come from the latest on the live application. This takes few minutes.
    1. Download it from the _server_ into the `BetMas` GitHub repository (export from oXygen data source explorer view)
    2. commit that to `BetMas`
    3. upload from GitHub to the new _local_ instance.
    4. open and format the lists, they will be massy from the update operations.
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

1. compile bibliography.xml within _lists_  with `makeFormattedBibliography.xql` which calls `generateFormattedBibliography.xqm` and following the formatting and adjustment instructions into that file. This can take two hours more or less.
2. update `canonicaltaxonomy.xml`. With this the lists will be all at the latest possible update status.
3. make sure to make the files readable so that they are also indexed for the transformations to take place as quickly as possible. use permissions.xql into the _BetMasService_ library.
4. populate `expanded` with `makeExpand.xql` which calls `expand.xqm` and stores files to the `expanded` collection with the right permissions. this will use the lists, the _EthioStudies_ library and the _BetMasData_ library. Make sure they are indexed or the performance will be horrible. Run authority-lists with profiling on in monex, to check.
    - check that split files which need to be in parts to come through from GitHub have been remerged taking into consideration Xinclude statements. This should be the default behaviour.

#### Store related applications datasets

1. _DillmannData_
2. _TracesData_

### Store applications

The release needs the following applications to be installed. These are all packaged and stored in GitHub repositories.

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
- _BetMasAPIs_
- _BetMasPreview_
- _gez-en_
- _guidelines_
- _parser_
- _alpheiosannotations_

## server application steps
In theory, you should be able to make a backup of the local database, restore that on the server and all should be good. In practice it is not necessarily true. So, do it step by step.


## other applications on web server
nginx
systmctl services
exist  config.xml
tomcat
collatex

### Fuseki and RDF datasets

### collatex

### Image server



## update long term storage (FDMR)
### datasets
### applications

## DONE!
