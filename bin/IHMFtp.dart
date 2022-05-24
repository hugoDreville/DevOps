import 'ftp.dart';
import 'user.dart';
import 'IHMUser.dart';
import 'dart:io';

class IHMFtp {
  static void titre() {
    print(
        "   _____ ____  _   _ ______ _____ _____      ______ _______ _____  ");
    print(
        "  / ____/ __ \\| \\ | |  ____|_   _/ ____|    |  ____|__   __|  __ \\ ");
    print(
        " | |   | |  | |  \\| | |__    | || |  __     | |__     | |  | |__) |");
    print(" | |   | |  | | . ` |  __|   | || | |_ |    |  __|    | |  |  ___/");
    print(" | |___| |__| | |\\  | |     _| || |__| |    | |       | |  | |");
    print(
        "  \\_____\\____/|_| \\_|_|    |_____\\_____|    |_|       |_|  |_| ");
    print("");
    print("");
  }

  static Future<void> menuPrincipale() async {
    int i = -1;
    while (i != 0) {
      print("+------------------------------------+");
      print("|          Menu - Principale         |");
      print("|                                    |");
      print("|    1 - installer / desinstaller    |");
      print("|    2 - utilisateur                 |");
      print("|    3 - utilisateur virtuel         |");
      print("|    4 - groupe                      |");
      print("|    5 - wrapper                     |");
      print("|    0 - retour                      |");
      print("+------------------------------------+");
      i = choixMenu(5);
      if (i == 1) {
        await menuInstall();
      } else if (i == 2) {
        await IHMUser.menuUti();
      } else if (i == 3) {
        await IHMUser.menuUtiVirtuel();
      } else if (i == 4) {
        await IHMUser.menuGroup();
      } else if (i == 5) {
        await menuWrapper();
      }
    }
    print("Retour menu précédent.");
    print("--------------------------------------------------");
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> menuInstall() async {
    int i = -1;
    while (i != 0) {
      print("+------------------------------------+");
      print("|         Menu - Installation        |");
      print("|                                    |");
      print("|    1 - installer                   |");
      print("|    2 - desinstaller                |");
      print("|    3 - update                      |");
      print("|    4 - restart                     |");
      print("|    0 - retour                      |");
      print("+------------------------------------+");
      i = choixMenu(4);
      if (i == 1) {
        resultat(await Ftp.installPureFtpd());
        await Future.delayed(Duration(seconds: 1));
      } else if (i == 2) {
        resultat(await Ftp.uninstallPureFtpd());
        await Future.delayed(Duration(seconds: 1));
      } else if (i == 3) {
        resultat(await Ftp.update());
        await Future.delayed(Duration(seconds: 1));
      } else if (i == 4) {
        resultat(await Ftp.restart());
        await Future.delayed(Duration(seconds: 1));
      }
    }
    print("Retour menu précédent.");
    print("--------------------------------------------------");
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> menuWrapper() async {
    int i = -1;
    while (i != 0) {
      print("+------------------------------------+");
      print("|           Menu - Wrapper           |");
      print("|                                    |");
      print("|    1 - creer un fichier            |");
      print("|    2 - supprimer un fichier        |");
      print("|    3 - modifier un fichier         |");
      print("|    4 - afficher le contenu         |");
      print("|    0 - retour                      |");
      print("+------------------------------------+");
      i = choixMenu(4);
      if (i == 1) {
        await addWrapper();
      } else if (i == 2) {
        await dellWrapper();
      } else if (i == 3) {
        await modifieWrapper();
      } else if (i == 4) {
        await afficheWrapper();
      }
    }
    print("Retour menu précédent.");
    print("--------------------------------------------------");
    await Future.delayed(Duration(seconds: 1));
  }

  // retourne un chiffre entre 0 et nbChoix pour les menus
  static int choixMenu(int nbChoix) {
    bool saisieValide = false;
    int i = -1;
    while (!saisieValide) {
      print("> Veuillez saisir une action (0-$nbChoix)");
      try {
        i = int.parse(stdin.readLineSync().toString());
        if (i >= 0 && i <= nbChoix) {
          saisieValide = true;
        } else {
          print("La saisie ne correspond à aucune action.");
        }
      } catch (e) {
        print("Erreur dans la saisie.");
      }
    }
    return i;
  }

  //permet de saisir un string
  static String saisieString(String sujet) {
    bool saisieValide = false;
    String s = "";
    while (!saisieValide) {
      print("> Veuillez saisir $sujet :");
      try {
        s = stdin.readLineSync().toString();
        saisieValide = true;
      } catch (e) {
        print("Erreur dans la saisie.");
      }
    }
    return s;
  }

  //permet de saisir un int
  static int saisieInt(String sujet) {
    bool saisieValide = false;
    int i = -1;
    while (!saisieValide) {
      print("> Veuillez saisir $sujet :");
      try {
        i = int.parse(stdin.readLineSync().toString());
        saisieValide = true;
      } catch (e) {
        print("Erreur dans la saisie.");
      }
    }
    return i;
  }

  static Future<void> addWrapper() async {
    String nom =
        IHMFtp.saisieString("le nom du fichier de configuration a créer");
    resultat(await Ftp.addWrapper(nom));
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> dellWrapper() async {
    String nom =
        IHMFtp.saisieString("le nom du fichier de configuration à supprimer");
    resultat(await Ftp.dellWrapper(nom));
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> afficheWrapper() async {
    String nom =
        IHMFtp.saisieString("le nom du fichier de configuration à afficher");
    resultat(await Ftp.afficheWrapper(nom));
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> modifieWrapper() async {
    String nom =
        IHMFtp.saisieString("le nom du fichier de configuration à modifier");
    String l = IHMFtp.saisieString("le nouveau contenu du fichier");
    resultat(await Ftp.modifieWrapper(nom, l));
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> resultat(res) async {
    if (res == 0) {
      print("\x1B[32m" + "commande executée avec succés!" + "\x1B[0m");
    } else {
      print("\x1B[31m" + "erreur dans la commande!" + "\x1B[0m");
    }
  }
}
