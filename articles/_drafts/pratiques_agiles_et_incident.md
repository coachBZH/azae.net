---
title: Corrélation entre les pratiques agiles et l'activité de la production
authors:
  - Thomas Clavier
contributors:
  - Olivier Albiez
tags:
  - pratiques

---
# Contexte
Récement, des équipes que nous accompagnons dans leur changement vers l'agilité ont fait un bilan des apports de la transformations en cours. Autour de la table il y avait, les PO, quelques utilisateurs, les scrum master, des représentants de l'équipe de production (ops) et moi. Alors que les utilisateurs observaient tous les effets attendu : plus de valeur, une plus grande réactivité, moins cher, confiance et implication des équipes, la production été surprise de compter 27% d'incidents en moins. D'ou l'idée de corréler les types de demandes et d'incident avec les bonnes pratiques agiles pour voir si la baisse était bien la conséquence de la transformation.

# Taxonomie ITIL

Classer, trier les demandes et les incidents pour analyser et corriger les problèmes les plus importants en priorité est une des grandes forces d'ITIL. Pour les incidents, nous nous sommes focalisés sur les catégories des origines de ces incidents. Et nous avons pris toutes les demandes.

## Incidents

Les "root cause" sont classées dans les catégories suivante : Application, Matériel, Livraison, Processus, Erreur humaine, Autre et Inconnu. 
Nous avons volontairement exclus les 2 dernières catégories car elles ne regroupe que très peut d'incident. De même nous avons ignoré la catégorie Matériel qui semblait plus difficile à résoudre juste avec des pratiques. 

### Logiciel

Cette catégorie regroupe les incidents dont l'origine est supposé être l'application.

#### Spécification 
Regroupe les incidents qui mettent en évidence l'inadéquation entre le logiciel et le besoin. Rapprocher les utilisateurs et les développeurs et livrer beaucoup plus souvent sont deux levier simple pour adapter rapidement le logiciel aux besoins du client.

#### Analyse d'impact
Certaines modification de code générent des régressions ou des bug par effet domino, dans le cadre de chaine de traitement longue il n'est pas rare que l'effet domino soit observé sur une brique logiciel géré par une autre équipe. Pour réduire ce type d'incident, pratiquez le TDD, le BDD, et automatiser l'ensemble des tests.

#### Qualité de code 
Pour la production, une application qui s'arrête face au moindre petit problème c'est une application de mauvaise qualité. Pour palier à ces incidents, il est possible de prendre en compte les besoins non fonctionnel des ops dans le backlog en même temps que les besoins du PO, c'est une des bases de devops.

#### Testing
Quand un incident met en avant un bug applicatif, on peut supposer que la couverture de test n'est pas idéal.
Pour palier ça, il y a le TDD et le BDD, mais aussi "l'infra as code" et le bon découpage des besoins. En effet si l'infrastructure est géré comme du code alors il sera facile de reconstruire des environement de test à la volée. De même, le bon découpage des besoins facilitera grandement les tests.
On retrouve aussi ici les bugs corrigé en urgence, mais non corrigé dans une version suivante. Le trunk base et le déploiement continu permet de réduire au maximum ces problèmes.

#### Capacité
Cette catégorie parle d'elle même, rentrent ici les incidents lié à un problème de charge. Automatiser les tests de charge, mais aussi surveiller et corréler les métriques systèmes et applicatives pour voir venir le problème et augmenter les capacités juste avant que le problème d'arrive permettra de réduire ces incidents. L'infra as code et la collaboration entre dev et ops sont des composantes clés de cette catégorie.

### Livraison
#### Packaging
Automatisation des livraisons, trunc base

#### Déploiement
automatisation des livraisons, livraison en 1 clic, infra as code

#### Configuration

devops, automatisation des livraisons, infra as code

### Process
#### Documentation
procédure pas à jour

devops, identifier les besoins non fonctionnel et les ajouter dans le backlog


* Matériel : cette catégorie parle d'elle même.
* Process : Quand un process est mal défini, mal documenté ou mal suivi.
* Erreur humaine : les erreurs humaines non lié au process.
* Autre incidents
* Inconnu : l'origine n'a pas été trouvé

Notez que ces 3 dernières catégories ne regroupent que très peux d'incident.




## Demandes

Les demandes quand à elles, sont classé en 3 grandes catégories : 
* Les actions

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

# Résumé 

{: .table }
Catégorie  | Pratique
---------- | ----------
Logiciel:Spécification  | Colocaliser le PO avec l'équipe, livrer plus souvent, faire des démos à chaque fin d'itération
Logiciel:Analyse d'impact | TDD, BDD, automatisation de tous les tests

