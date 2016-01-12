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
Regroupe les incidents qui mettent en évidence l'inadéquation entre le logiciel et le besoin. 

Améliorer la collaboration entre les utilisateurs et les développeurs est un levier simple pour adapter rapidement le logiciel aux besoins du client. Ce qui passe par de nombreux outils ou pratique : 

* Un Productowner correctement identifié dont le rôle est bien compris par tout le monde.
* Faire participer les utilisateurs et les équipes à des ateliers d'affinage du backlog commun.
* Travailler le découpage des taches pour livrer plus vite de petits morceaux sur les quelles l'utilisateur pourra donner très vite un avis
* BDD : travailler avec l'utisateur pour que l'expression des tests automatiques lui soit suffisemment claire.

#### Analyse d'impact
Certaines modification de code générent des régressions ou des bug par effet domino, dans le cadre de systèmes complexes l'effet domino est observable sur une brique logiciel géré par une autre équipe, voir même sur un progiciel. 

Pour réduire ce type d'incident, pratiquez le TDD, le BDD, et automatiser l'ensemble des tests, est une bonne base de départ, mais tous les incidents ne pourront pas être supprimé, il est en effet impossible de penser à tous les cas de tests possible. Une bonne métrologie capable de remonter rapidement les liens de cause à effet permetrons d'une part de réduire ce type d'incident en simplifiant une partie de l'analyse d'impacte, et d'autre part de voir le problème avant l'incident pour le corriger au plus vite. Ce qui implique de pouvoir livrer très vite.

#### Qualité de code 
Pour la production, une application qui s'arrête face au moindre changement d'environement (coupure réseau, disque plein, reboot d'un service avant un autre, etc.) c'est une application de mauvaise qualité. 

Pour palier à ces incidents, il est primordiale de prendre en compte les besoins non fonctionnel des ops dans le backlog en même temps que les besoins du PO, c'est une des bases de devops. Donc invitez vos ops à vos ateliers d'affinage du backlog, et développez ces besoins comme les autres, avec des tests automatisés, du code propre et finement découpé.

#### Testing
Quand un incident met en avant un bug applicatif, on peut supposer que la couverture de test n'est pas idéal.

Pour palier ça, il y a bien évidement le TDD et le BDD, mais aussi "l'infra as code" et le bon découpage des besoins. En effet si l'infrastructure est géré comme du code alors il sera facile de reconstruire des environement de test à la volée. De même, le bon découpage des besoins facilitera grandement les tests.

On retrouve aussi ici les bugs corrigés en urgence, mais non correctement reportés dans une version suivante. Le trunk base et le déploiement continu permet de réduire au maximum ces problèmes. En effet n'utiliser qu'une seule base de code dans une seule version, permet de réduire de supprimer le problème.

#### Capacité
Cette catégorie parle d'elle même, rentrent ici les incidents lié à un problème de charge. Automatiser les tests de charge, mais aussi surveiller et corréler les métriques systèmes et applicatives pour voir venir les problèmes et augmenter les capacités avant que le problème d'arrive permettra de réduire ces incidents. L'infra as code, la métrologie et la collaboration entre dev et ops sont des composantes clés pour la réduction de ce type d'incidents.

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
Catégorie  | Pratique   | Description
---------- | ---------- | -----------
Logiciel:Spécification  | Colocaliser le PO avec l'équipe, livrer plus souvent, faire des démos à chaque fin d'itération | Ce type d'incident apparait quand le besoin est mal identifié
Logiciel:Analyse d'impact | TDD, BDD, automatisation de tous les tests | De type d'incident apparait quand l'application génère un impact sur une autre application
Logiciel:Qualité du code | | Problème de fuite mémoire, problème de robustesse, de résiliance
Logiciel:Testing | | Mauvaise couverture de test besoin bien identifié
