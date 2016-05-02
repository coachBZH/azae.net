---
title: Réduire la charge de la production grace à l'agilité
authors:
  - Thomas Clavier
contributors:
  - Olivier Albiez
tags:
  - pratiques

---
## Contexte
Récement, des équipes que nous accompagnons dans leur changement vers l'agilité ont fait un bilan des apports de la transformations en cours. Autour de la table il y avait, les PO, quelques utilisateurs, les scrum master, des représentants de l'équipe de production (ops) et moi. Alors que les utilisateurs observaient tous les effets attendu : plus de valeur, une plus grande réactivité, moins cher, confiance et implication des équipes, la production été surprise de compter 27% d'incidents en moins. D'ou l'idée de corréler les types de demandes et d'incident avec les bonnes pratiques agiles pour voir si la baisse était bien la conséquence de la transformation.

## Taxonomie ITIL

Classer, trier les demandes et les incidents pour analyser et corriger les problèmes les plus importants en priorité est une des grandes forces d'ITIL. Voici l'arbre de classement des incidents et des demandes que nous avons utilisé : 

* Incidents
  * Logiciel
  * Livraison
  * Processus
* Demandes
  * Application
  * Demande d'accès
  * Gestion de données

### Incidents

#### Logiciel

Cette catégorie regroupe les incidents dont l'origine est supposé être l'application. Ce qui regroupe :

* les incidents mettant en évidence l'inadéquation entre le logiciel et le besoin
* les incidents lié à une mauvaise annalyse d'impact interapplications : un changement dans l'application génère un bug dans une autre application
* les incidents lié au manque de robustesse de l'application : un changement dans l'environement (coupure réseau, disque plein, reboot d'un service distant, etc.) qui bloque ou stope l'application.
* les incidents mettant en avant des bugs ou des régressions
* les incidents lié à la fluctuation de la charge.

#### Livraison

Dans cette catégorie, on retrouve l'ensemble des incidents de livraison : package incomplet ou mal construit, problème de configuration applicative, erreur dans une procédure de livraison, etc.

#### Processus

Dans cette catégorie, nous trouvons tous les incidents mettant en cause les processus et les outils. Brièvement, dans ITIL, une action répétitive doit au minimum être documenté dans une procédure que l'opérateur pourra suivre pas à pas avec un certains nombre d'outils. 
Tous les incidents mettant en cause la procédure, que ce soit parcequ'elle est absente ou pas à jour. Par exemple, une procédure qui ne fait pas référence à une nouvelle fonctionnalité rentre de facto dans cette catégorie.

Si un outil utilisé par la production ne fait pas correctement le travail par manque de configuration ou manque de fonctionnalité, alors l'incident rentre aussi dans cette catégorie. 
La supervision faisant parti des outils, une grande partie des problèmes de supervision (sonde en décalage avec le code applicatif, problème de configuration, etc.) rentrent dans cette catégorie.

### Demandes

En complément des incidents, la production est confronté à un certain nombre de demandes :

* des lancement de fonction, des mise à jour de paramètres applicatifs, installation de composants, relivraison urgente, etc. Tous ces cas de figure rentre dans la catégorie "Demandes applicatives".
* Toutes les créations, mise à jour ou suppréssion des droits qui ne peuvent pas être réalisé par les utilisateurs rentrent dans la catégorie "Gestion des accès"
* Enfin, toutes les demmandes de manipulation de données (execussion de requetes SQL, mise à jour de fichiers, extractions, demandes de dumps, de synchro de base, etc. ) rentrent dans la catégorie "Gestion des données"

## Bilan

### En cours de mise en place

Améliorer la collaboration entre les équipes et faire émerger un certain nombre de bonnes pratiques à permis de faire baisser le nombre d'incident, les voici :

* Un Product Owner ou responsable produit correctement identifié dont le rôle est bien compris par tout le monde.
* Travailler le découpage des taches pour livrer plus vite de petits morceaux sur lesquelles l'utilisateur peut donner très vite un avis.
* Travailler avec les utisateurs pour que l'expression des tests automatiques leur soit suffisemment claire (BDD).
* Penser test avant de produire du code (TDD), pour obtenir une application testé automatiquement à chaque commit.
* Livrer très vite, au moins une fois ar jour, de tout petits incréments de logiciel pour avoir un feedback rapide des utilisateurs, c'est le déploiement continu
* Gérer l'infrastructure comme du code pour automatiser la création d'environements par les développeurs ou pour faire face à une forte montée en charge.
* Pratiquer le "trunc base" pour voir au plus tôt les problèmes d'intégration et éviter autant que possible les problèmes de report entre versions.
* Automatiser les déploiements pour déployer plus vite afin d'aller chercher plus souvant le feedback des utilisateurs tout en évitant les erreurs humaine.

Toutes ces bonnes pratiques sont largement perfectible, elles ont été en parti mise en place par les équipes, elles résultent d'une volonté commune, utilisateurs, développeurs et production à vouloir améliorer en continu leur collaboration. 

### Reste à faire 
Ne nous arrêtons pas en si bon chemin, parmis les demandes certaines sont très fréquentes, favoriser la collaboration entre développeurs, production et utilisateurs (dev, ops et biz) permettra la mise en place de solution pour automatiser et donner aux utilisateurs suffisement d'autonomie dans l'executions de ces demandes.

* Faire participer les utilisateurs, la production et les équipes aux ateliers d'affinage du backlog.
* Penser test avant de produire du code, pour obtenir une application testé automatiquement à chaque commit y compris les tests de charges et les tests de résistance aux modifications d'environements.
* Mettre en place une bonne métrologie capable de remonter rapidement les liens de cause à effet permetant d'une part de simplifier une partie de l'analyse d'impacte et d'autre part de voir le problème avant l'incident pour le corriger au plus vite.
* Avoir des tests fonctionnel automatique applicable en production

Au final, les équipes de productions étaient convaincu qu'il était encore possible de réduire leur charge de travail de moitié, non pas pour réduire la taille de l'équipe, mais pour leur permettre de se focaliser sur des taches à bien plus forte valeur ajouté pour les utilisateurs.
