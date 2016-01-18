---
title: Réduire la charge de la production grace à l'agilité
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

Classer, trier les demandes et les incidents pour analyser et corriger les problèmes les plus importants en priorité est une des grandes forces d'ITIL. Voici l'arbre de classement des incidents et des demandes que nous avons étudié : 

* Incidents
  * Logiciel
  * Livraison
  * Processus
* Demandes
  * Application
  * Demande d'accès
  * Gestion de données

## Incidents

### Logiciel

Cette catégorie regroupe les incidents dont l'origine est supposé être l'application. Ce qui regroupe : 

* les incidents mettant en évidence l'inadéquation entre le logiciel et le besoin
* les incidents lié à une mauvaise annalyse d'impact interapplications : un changement dans l'application qui génère un bug dans une autre application
* les incidents au manque de robustesse de l'application : un changement dans l'environement (coupure réseau, disque plein, reboot d'un service distant, etc.) qui bloque ou stope l'application.
* les incidents mettant en avant des bugs ou des régressions
* les incidents lié à la fluctuation de la charge.


Améliorer la collaboration entre les utilisateurs, les développeurs et la production est le levier principal pour réduire ces incidents. Ce qui passe entre autre par : 

* Un Product Owner ou responsable produit correctement identifié dont le rôle est bien compris par tout le monde.
* Faire participer les utilisateurs, la production et les équipes aux ateliers d'affinage du backlog.
* Travailler le découpage des taches pour livrer plus vite de petits morceaux sur lesquelles l'utilisateur pourra donner très vite un avis
* BDD : travailler avec les utisateurs pour que l'expression des tests automatiques leur soit suffisemment claire.
* TDD : penser test avant de produire du code, pour obtenir une application testé automatiquement à chaque commit y compris les tests de charges et les tests de résistance aux modifications d'environements.
* Mettre en place une bonne métrologie capable de remonter rapidement les liens de cause à effet permetra d'une part de simplifier une partie de l'analyse d'impacte et d'autre part de voir le problème avant l'incident pour le corriger au plus vite. La métrologie perlet aussi d'anticiper les problèmes de charge.
* Le déploiement continu : livrer très vite de tout petits incréments de logiciel pour avoir un feedback rapide de vos utilisateurs
* "l'infra as code" vous permettra d'automatiser la création d'environements pour reproduire rapidement un bug ou faire face à une forte montée en charge.
* Pratiquer le "trunc base" ou partager le code le plus simplement possible pour voir au plus tôt les problèmes et éviter tous les problèmes de report entre versions.
* Automatiser les tests de charges 

### Livraison
Réduire les incidents de packagings et de déploiement c'est avant tout automatiser ce processus pour éviter les erreurs humaines. Le travail d'automatisation passera problablement par une collaboration devops, de "l'infra as code" et du "trunck base developpement"

Réduire les problèmes de configuration applicative est plus délicat, il faudra au moins surveiller que l'application est bien oppérationnel en suivant les gestes métiers, mais aussi promouvoir la collaboration devops et l'automatisation des livraisons.

### Processus

Dans cette catégorie nous trouverons tous les incidents mettant en cause les processus et les outils. Pour résumer, dans ITIL, une action répétitive doit au minimum être documenté dans une procédure que l'opérateur pourra suivre pas à pas avec un certains nombre d'outils. 
Rentre donc dans cette catégorie, tous les incidents mettant en cause la procédure, que ce soit parcequ'elle est absente ou pas à jour. L'origine du problème étant varié : la production n'est pas au courrant d'une nouvelle fonctionnalité, donc forcémenent non documenté ou parceque le responsable de la procédure n'a pas correctement fait son travail.
Si un outil utilisé par la production ne fait pas correctement le travail par manque de configuration ou manque de fonctionnalité, alors l'incident rentre aussi dans cette catégorie.

Une bonne collaboration devops permettra de réduire une bonne partie de ces incidents : 

* Inviter la production aux ateliers de construction du backlog et aux démonstrations du produit en fin d'itération
* Mettre en place des interupteurs applicatifs pour par exemple laisser la production désactiver une fonctionnalité très gourmande en ressource en cas de forte charge.
* Faire paticiper la production à la réflexion d'architecture, pour par exemple les prévenir au plus tôt de l'utilisation d'une ressource qui deviendra critique.

Les problèmes de supervisions rentre aussi dans cette catégorie, en effet la supervision est un outil. Travailler sur une métrologie partagé entre tous les acteurs du projet permettra de réduire une partie des incidents.

## Demandes

### Application

Lancement de fonction manuel à la demande des utilisateurs, mise à jour de paramètres applicatifs, installation manuel de composants, relivraison urgente, etc. Tous ces cas de figure rentre dans la catégorie "Demandes applicatives".

### Demandes d'accès

Toutes les créations, mise à jour ou suppréssion de données lié à la gestion des droits dans ou en dehors de l'application.


### Gestion de données

Toutes les demmandes pour jouer des requetes SQL, de la mise à jour de fichiers de données, des extractions, demandes de dumps, de synchro de base ou autre rentrent dans cette catégorie

### Solution
Parmis ces demandes certaines sont très fréquentes, favoriser la collaboration entre dev, ops et biz permettra de prendre en compte la création d'écran ou de solution pour automatiser et donner aux utilisateurs suffisement d'autonomie dans l'executions de ces demandes.



