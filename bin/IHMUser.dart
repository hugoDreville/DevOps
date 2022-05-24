import 'IHMFtp.dart';

import 'user.dart';

class IHMUser {
  static Future<void> menuUti() async {
    int i = -1;
    while (i != 0) {
      print("+------------------------------------+");
      print("|          Menu -utilisateur         |");
      print("|                                    |");
      print("|    1 - creer un utilisateur        |");
      print("|    2 - supprimer un utilisateur    |");
      print("|    3 - voir le gid                 |");
      print("|    4 - voir le uid                 |");
      print("|    5 - ajouter a un groupe         |");
      print("|    6 - afficher les utilisateurs   |");
      print("|    0 - retour                      |");
      print("+------------------------------------+");
      i = IHMFtp.choixMenu(6);
      if (i == 1) {
        await createUser();
      } else if (i == 2) {
        await delUser();
      } else if (i == 3) {
        await voirGid();
      } else if (i == 4) {
        await voirUid();
      } else if (i == 5) {
        await ajouterGroupe();
      } else if (i == 6) {
        await afficherUser();
      }
    }
    print("Retour menu précédent.");
    print("--------------------------------------------------");
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> menuGroup() async {
    int i = -1;
    while (i != 0) {
      print("+------------------------------------+");
      print("|            Menu - Groupe           |");
      print("|                                    |");
      print("|    1 - creer un groupe             |");
      print("|    2 - supprimer un groupe         |");
      print("|    3 - afficher les groupes        |");
      print("|    0 - retour                      |");
      print("+------------------------------------+");
      i = IHMFtp.choixMenu(3);
      if (i == 1) {
        await createGroup();
      } else if (i == 2) {
        await delGroup();
      } else if (i == 3) {
        await afficherGroup();
      }
    }
    print("Retour menu précédent.");
    print("--------------------------------------------------");
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> menuUtiVirtuel() async {
    int i = -1;
    while (i != 0) {
      print("+-----------------------------------------+");
      print("|       Menu - Utilisateur Virtuel        |");
      print("|                                         |");
      print("|    1 - creer un utilisateur virtuel     |");
      print("|    2 - modifier un utilisateur virtuel  |");
      print("|    3 - supprimer un utilisateur virtuel |");
      print("|    4 - voir les informations            |");
      print("|    5 - créer le lien symbolique         |");
      print("|    6 - modifier le mot de passe         |");
      print("|    0 - retour                           |");
      print("+-----------------------------------------+");
      i = IHMFtp.choixMenu(6);
      if (i == 1) {
        await createUserVirtuel();
      } else if (i == 2) {
        await menuModif();
      } else if (i == 3) {
        await delUserVirtuel();
      } else if (i == 4) {
        await voirInfos();
      } else if (i == 5) {
        IHMFtp.resultat(await User.lien());
      } else if (i == 6) {
        await modifierMDP();
      }
    }
    print("Retour menu précédent.");
    print("--------------------------------------------------");
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> menuModif() async {
    int i = -1;
    while (i != 0) {
      print("+--------------------------------------------------------------+");
      print("|           Menu - Modification Utilisateur Virtuel            |");
      print("|                                                              |");
      print("|    1 - limitation de la bande passante du téléchargement     |");
      print("|    2 - limitation de la bande passante de l'envoi            |");
      print("|    3 - quota en nombre de fichiers max                       |");
      print("|    4 - quota en taille maximale utilisable                   |");
      print("|    5 -  autoriser un client ou une IP                        |");
      print("|    6 - interdire un client ou une IP                         |");
      print("|    7 - IP autorisé à se connecter                            |");
      print("|    8 - IP qui n'est pas autorisé à se connecte               |");
      print("|    9 - limitation horaire                                    |");
      print("|    10 - nombre de sessions simultanées autorisées            |");
      print("|    0 - retour                                                |");
      print("+--------------------------------------------------------------+");
      i = IHMFtp.choixMenu(10);
      if (i == 1) {
        await download();
      } else if (i == 2) {
        await upload();
      } else if (i == 3) {
        await fichier();
      } else if (i == 4) {
        await taille();
      } else if (i == 5) {
        await autoriserClient();
      } else if (i == 6) {
        await refuserClient();
      } else if (i == 7) {
        await autoriserConnection();
      } else if (i == 8) {
        await refuserConnection();
      } else if (i == 9) {
        await horaire();
      } else if (i == 10) {
        await sessions();
      }
    }
    print("Retour menu précédent.");
    print("--------------------------------------------------");
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> createUser() async {
    String nom = IHMFtp.saisieString("le nom");
    IHMFtp.resultat(await User.createUser(nom));
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> createUserVirtuel() async {
    String nom = IHMFtp.saisieString("le nom de l'utilisateur");
    String map =
        IHMFtp.saisieString("sur quel utilisateur vous voulez le mapper ");
    int uid = IHMFtp.saisieInt("l'iud");
    int gid = IHMFtp.saisieInt("le gid");
    IHMFtp.resultat(await User.createUserVirtuel(nom, map, uid, gid));
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> delUserVirtuel() async {
    String nom = IHMFtp.saisieString("le nom de l'utilisateur");
    IHMFtp.resultat(await User.supprimerUtilisateurVirtuel(nom));
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> voirInfos() async {
    String nom = IHMFtp.saisieString("le nom de l'utilisateur");
    IHMFtp.resultat(await User.voirInfos(nom));
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> modifierMDP() async {
    String nom = IHMFtp.saisieString("le nom de l'utilisateur");
    IHMFtp.resultat(await User.modifierMotDePasse(nom));
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> delUser() async {
    String nom = IHMFtp.saisieString("le nom");
    IHMFtp.resultat(await User.userdel(nom));
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> createGroup() async {
    String nom = IHMFtp.saisieString("le nom");
    String gid = IHMFtp.saisieString("le gid (1001 de base)");
    IHMFtp.resultat(await User.createGroup(nom, gid));
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> delGroup() async {
    String nom = IHMFtp.saisieString("le nom");
    IHMFtp.resultat(await User.delGroup(nom));
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> voirUid() async {
    String nom = IHMFtp.saisieString("l'utilisateur");
    IHMFtp.resultat(await User.voirUid(nom));
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> voirGid() async {
    String nom = IHMFtp.saisieString("l'utilisateur");
    IHMFtp.resultat(await User.voirGid(nom));
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> afficherUser() async {
    print("voici tout les utilisateurs existant:");
    IHMFtp.resultat(await User.afficherUser());
    await Future.delayed(Duration(seconds: 3));
  }

  static Future<void> ajouterGroupe() async {
    String nom = IHMFtp.saisieString("l'utilisateur");
    String groupe =
        IHMFtp.saisieString("le groupe auquelles vous souhaitez l'utilisateur");
    IHMFtp.resultat(await User.addGroup(nom, groupe));
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> afficherGroup() async {
    print("voici tout les groupes existant:");
    IHMFtp.resultat(await User.afficherGroup());
    await Future.delayed(Duration(seconds: 3));
  }

  static Future<void> download() async {
    String nom = IHMFtp.saisieString("l'utilisateur");
    String a = IHMFtp.saisieString(
        "la limitation de la bande passante du téléchargement voulue");
    IHMFtp.resultat(await User.modifierDownload(nom, a));
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> upload() async {
    String nom = IHMFtp.saisieString("l'utilisateur");
    String groupe = IHMFtp.saisieString(
        "la limitation de la bande passante de l'envoie voulue");
    IHMFtp.resultat(await User.modifierUpload(nom, groupe));
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> fichier() async {
    String nom = IHMFtp.saisieString("l'utilisateur");
    String groupe = IHMFtp.saisieString("le quota en nombre de fichiers max");
    IHMFtp.resultat(await User.modifierFichierMax(nom, groupe));
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> taille() async {
    String nom = IHMFtp.saisieString("l'utilisateur");
    String groupe =
        IHMFtp.saisieString("le quota en taille maximale utilisable");
    IHMFtp.resultat(await User.modifierTailleMax(nom, groupe));
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> autoriserClient() async {
    String nom = IHMFtp.saisieString("l'utilisateur");
    String groupe = IHMFtp.saisieString("le client ou l'ip");
    IHMFtp.resultat(await User.modifierAutoriserClient(nom, groupe));
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> refuserClient() async {
    String nom = IHMFtp.saisieString("l'utilisateur");
    String groupe = IHMFtp.saisieString("le client ou l'ip");
    IHMFtp.resultat(await User.modifierRefuserClient(nom, groupe));
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> autoriserConnection() async {
    String nom = IHMFtp.saisieString("l'utilisateur");
    String groupe = IHMFtp.saisieString("l'IP'");
    IHMFtp.resultat(await User.modifierAutorisationConnection(nom, groupe));
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> refuserConnection() async {
    String nom = IHMFtp.saisieString("l'utilisateur");
    String groupe = IHMFtp.saisieString("l'IP'");
    IHMFtp.resultat(await User.modifierRefuserConnection(nom, groupe));
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> horaire() async {
    String nom = IHMFtp.saisieString("l'utilisateur");
    String groupe = IHMFtp.saisieString(
        "la limitation horaire(ex: 8h30-17h00 = 0830-1700)");
    IHMFtp.resultat(await User.modifierHoraire(nom, groupe));
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> sessions() async {
    String nom = IHMFtp.saisieString("l'utilisateur");
    String groupe =
        IHMFtp.saisieString("le nombre de sessions simultanées autorisées");
    IHMFtp.resultat(await User.modifierNombreSessions(nom, groupe));
    await Future.delayed(Duration(seconds: 1));
  }
}
