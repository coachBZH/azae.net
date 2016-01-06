---
---
# Contexte
Récement, des équipes de nous accompagnons dans leur changement vers l'agilité ont fait un bilan des apports de leur transformations en cours. Autour de la table il y avait, le PO, quelques utilisateurs, le scrum master, des représentants de l'équipe de production (ops) et moi. Alors que les utilisateurs observaient tous les effets attendu : moins de bug, une plus grande réactivité, moins cher, confiance et implication, les équipes de production ont été très surprisent de compter 27% d'incidents en moins. D'ou l'idée de corréler les types de demandes et d'incident avec les bonnes pratiques agiles pour voir si la baisse était bien la conséquence de la transformation.

# Taxonomie ITIL

Classer et trier les demandes et les incidents pour analyser et corriger les problèmes les plus importants en priorité est une grandes forces d'ITIL. Nous ne nous sommes attardé que sur les catégories des origines (root cause) des incidents et des demandes. 

## Origine
* Logiciel : quand l'origine du problème est un bug, un problème de configuration applicatif ou une régression.
* Matériel : cette catégorie parle d'elle même.
* Process : Quand un process est mal défini, mal documenté ou mal suivi.
* Erreur humaine : les erreurs humaines non lié au process.
* Autre incidents
* Inconnu : l'origine n'a pas été trouvé

Ces 3 dernières catégories ne regroupent que très peux d'incident, 

## Demandes

* Action
** Provisioning : User requires access to a service or part of a service, e.g. a security permission, a menu option, a token, a digital certificate, a client install, a desktop device, a phone, etc.
** Booking : Scheduled attendance at training, seminar, meeting, reservation of a resource, annual leave. 
** Ordering : Books, desks, catering, stationery, travel. 
** Change : as defined by change management, typically means change to a CI. Some organisations allow users to open RFCs directly, others have some form of prior request entity. 
** Work : tasks that falls outside change management. Run a report. Move a PC. Install a projector.
* Support
** Incident : an unplanned interruption to an IT service or reduction in the quality of an IT service. (Question: if an interruption or degradation of service is within the terms of the SLA, is it an Incident? ) 
** Fault : Failure or detected imminent failure of a CI, no service impact (yet). Only users within IT would be expected to report these, or an automated tool. If confirmed, it will spawn a Problem. (This was much debated recently. If you follow ITIL then an incident and a fault are the same thing.) 
** Help : Correcting data arising from user error (NOT from a Problem). Restoring a deleted file, untangling a mess... 
** Advice : How do I … ? Should I … ? Which is the best way to … ? 
* Input
** Proposal / Suggestion / Feedback
** Complaint

# Corrélation entre catégorie d'incident ITIL et bonne pratique agile

