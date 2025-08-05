# Documentation Tuttle in Betamasaheft

This document describes how to do the most usual admin tasks with the betamasaheft application and how to resolve common error cases


## Sync in commits on data repos
Betamasaheft uses Tuttle to synchronize changes. This will be automated with a webhook but can already be done by hand.

To deploy new commits in data, visit http://ml-s-betmas.ad.uni-hamburg.de:8081/exist/apps/tuttle/. The repos in green are up-to-date and OK. The repos in RED are out of sync and should be synchronized with the state on GitHub.
The repos in yellow are not under tuttle control. This should not happen.

The currently deployed commit can be seen in the repo.xml document of the corresponding collection in /db/apps/betmasdata/<collection>/repo.xml. The commit-id attribute on the root element shows the current state.

Synchronizing a data repo causes expansion to also run for any files changed in any of the commits that are synchronized in.

A repo under Tuttle control is assumed to not have any changes made to it. Especially not to files that also reside in the git repo that is bound to the collection. Changes in the new subcollection are OK because that collection is not available in the github repo.

## Error cases
Some things can go wrong while synchronizing a data repo. These will be reported by Tuttle and can be addressed.

### Sync already in progress
A sync can already be in progress. Tuttle requires an exclusive lock on the collection while synchronizing. Validate with Monex first whether nothing else is running any Tuttle synchronization. If nothing else is running, the API can be used to remove the lock file. 
Visit http://ml-s-betmas.ad.uni-hamburg.de:8081/exist/apps/tuttle/api.html
Find the POST to gitlock
Fill in the collection that is locked and call the endpoint

### Full upgrade is needed
This should never be needed, besides provisioning a new server or new repositories.When tuttle synchronizes a lot of files, a lot of files will need to be expanded. This will take a lot of time. We do not have to expand everything though because the expanded files are already on the server. 

Disable expansion by commenting out the callback(s) on /db/apps/tuttle/data/tuttle.xml. 
Perform a full upgrade
If expansion is needed: set the commit-id in the repo.xml to a commit that is guaranteed to already be expanded
Enable expansion by commenting out the callback(s) on /db/apps/tuttle/data/tuttle.xml. 
Perform an incremental sync
Verify the state is OK

