# Configuration - Pure-ftpd
**Configuration - Pure-ftpd** est un logiciel de gestion pour le service [pure-ftpd](https://www.pureftpd.org/project/pure-ftpd/) developpé en [Dart](https://dart.dev/). Ce projet a pour but de faciliter l'utilisation du service pure-ftp et donc de faire gagner du temps aux utilisateurs. De plus, il est facile d'utilisation, donc une personne ayant très peu de connaissances ou maîtrisant juste les bases pourra également utiliser ce logiciel.

## Pré-requis

### Installation

* Mettre à jour les packages en appuyant sur l'icone **Get Packages** de la page pubspec.yaml.
* S'assurer que l'utilisateur courant soit **root** avec la commande suivante:
```bash
su -s
```

## Utilisation 

Quand on lance le programme, on arrive directement sur le menu principal qui ressemble à ceci:
```
+------------------------------------+
|          Menu - Principale         |
|                                    |
|    1 - installer / desinstaller    |
|    2 - utilisateur                 |
|    3 - utilisateur virtuel         |
|    4 - groupe                      |
|    5 - wrapper                     |
|    0 - retour                      |
+------------------------------------+
```
Le programme nous demande une saisie, la voici :
```
> Veuillez saisir une action (0-5)
```
Pour **naviguer dans les menus**, il suffit juste de **suivre les instructions**, dans le cas suivant, on nous demande de choisir entre les 6 propositions, à savoir 0,1,2,3,4,5 ou 0.
Si l'on vient à se tromper dans la saisie, ce n'est pas grave, un message nous indiquera que la saisie est mauvaise et nous redemandera de faire une saisie.
### Installer pure-ftpd
Avant de commencer à vouloir crée et/ou gerée des configurations pure-ftpd, il va falloir commencé par l'installé en choisissant l'option 1 du menu principal qui est `1- installer / desinstaller`.
On arrive donc dans le  `Menu - Installation`:
```
+------------------------------------+
|         Menu - Installation        |
|                                    |
|    1 - installer                   |
|    2 - desinstaller                |
|    3 - update                      |
|    4 - restart                     |
|    0 - retour                      |
+------------------------------------+
```
On y retrouve encore une fois plusieurs options disponiples : 
* 1 - permet d'**installer** le service pure-ftpd.
* 2 - permet de **désinstaller** le service pure-ftpd.
* 3 - permet de **mettre à jour** le serveur.
* 4 - permet de **redémarrer** le service pure-ftpd.

On peut donc installer pure-ftpd avec le choix n°1, à savoir qu'il est conseillé de faire un **update** juste avant(option 3).

### Gestion Utilisateurs et Groupes.
#### Les utilisateurs.
L'option 2 du menu pricipal nous amène au `Menu -utilisateur`.
```
+------------------------------------+
|          Menu -utilisateur         |
|                                    |
|    1 - créer un utilisateur        |
|    2 - supprimer un utilisateur    |
|    3 - voir le gid                 |
|    4 - voir le uid                 |
|    5 - ajouter à un groupe         |
|    6 - afficher les utilisateurs   |
|    0 - retour                      |
+------------------------------------+
```
On y retrouve les actions les plus **importantes** concernant les utilisateurs:
* **Gérer** les utilisateurs.
* Accéder à leurs **informations**.
* **Lister** les utilisateurs existants.

#### Les groupes.
il est aussi possible de **gérer les groupes**.
```
+------------------------------------+
|            Menu - Groupe           |
|                                    |
|    1 - créer un groupe             |
|    2 - supprimer un groupe         |
|    3 - afficher les groupes        |
|    0 - retour                      |
+------------------------------------+
```
dans le menu, on retrouve le strict minimum nécessaire à la bonne gestion des groupes.

### Gestion Utilisateurs virtuels
on a également un menu pour gérer nos utilisateurs virtuels, le voici:
```
+-----------------------------------------+
|       Menu - Utilisateur Virtuel        |
|                                         |
|    1 - créer un utilisateur virtuel     |
|    2 - modifier un utilisateur virtuel  |
|    3 - supprimer un utilisateur virtuel |
|    4 - voir les informations            |
|    5 - créer le lien symbolique         |
|    6 - modifier le mot de passe         |
|    0 - retour                           |
+-----------------------------------------+
```
* La création d'un utilisateur va nous demander sur quel utilisateur veut-on le **mapper** et son **uid/gid**, pour le connaître, il suffit d'aller dans le `Menu -utilisateur` vu juste avant et de choisir les options `3 - voir le gid` et `4 - voir le uid` pour accéder aux informations voulues. 
* La modification a pour elle seule un menu :
```
+--------------------------------------------------------------+
|           Menu - Modification Utilisateur Virtuel            |
|                                                              |
|    1 - limitation de la bande passante du téléchargement     |
|    2 - limitation de la bande passante de l'envoi            |
|    3 - quota en nombre de fichiers max                       |
|    4 - quota en taille maximale utilisable                   |
|    5 - autoriser un client ou une IP                        |
|    6 - interdire un client ou une IP                         |
|    7 - IP autorisé à se connecter                            |
|    8 - IP qui n'est pas autorisé à se connecte               |
|    9 - limitation horaire                                    |
|    10 -nombre de sessions simultanées autorisées            |
|    0 - retour                                                |
+--------------------------------------------------------------+
```
* Les commandes qui suivent sont faciles à comprendre et ne demandent aucune information particulière.

### Gestion du Wrapper
```
+------------------------------------+
|           Menu - Wrapper           |
|                                    |
|    1 - créer un fichier            |
|    2 - supprimer un fichier        |
|    3 - modifier un fichier         |
|    4 - afficher le contenu         |
|    0 - retour                      |
+------------------------------------+
```
Le menu du Wrapper ne possède pas beaucoup de choix, on doit inscrire nous même le nom des fichiers et son contenu, une **erreur** pourrait faire **bugger le programme**.
c'est pour cela qu'il n'est **pas conseillé** d'**utiliser** cette fonctionalité du programme si vous n'avez pas un **minimum de connaissances** là dessus.
Une mise à jour aura lieu prochainement ou la création de fichier dans le wrapper sera plus simple et guidée.

## Programme
Voici le diagramme de classe réalisé pour le programme:

![DevOps](https://user-images.githubusercontent.com/100281360/169568807-7614db2f-5ccc-48c5-a29d-01559e10fede.PNG)

Elle respecte le modèle **MVC**(modèle, vue, controleur)
on a plusieurs types de classes:
* Les intéractions homme/machine (IHMFtp, IHMUser).
* Le contrôleur(main).
* Les modèles (Ftp, User).
