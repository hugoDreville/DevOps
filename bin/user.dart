import 'dart:io';

class User {
  static Future<int> createUser(nom) async {
    String cmd = "sudo adduser $nom ";
    Process p = await Process.start("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> addGroup(nom, groupe) async {
    String cmd = "sudo adduser $nom $groupe";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> afficherUser() async {
    String cmd = "  cut -d: -f1 /etc/passwd";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    print(p.stdout);
    print(p.stderr);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> afficherGroup() async {
    String cmd = "  cut -d: -f1 /etc/group";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    print(p.stdout);
    print(p.stderr);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> createGroup(nom, gid) async {
    String cmd = "sudo addgroup $nom -gid $gid";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> delGroup(nom) async {
    String cmd = "sudo delgroup $nom";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> userdel(nom) async {
    String cmd = "sudo userdel $nom";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> voirInfos(nom) async {
    String cmd = "sudo pure-pw show $nom";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    print(p.stdout);
    print(p.stderr);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> createUserVirtuel(nom, map, uid, gid) async {
    String cmd =
        "sudo pure-pw useradd $nom -u $uid -g $gid -d /home/$map/$nom -m";
    Process p = await Process.start("bash", ["-c", cmd]);
    await stdout.addStream(p.stdout);
    await stderr.addStream(p.stderr);
    p.stdin.addStream(stdin);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> modifierDownload(nom, i) async {
    String cmd = "sudo pure-pw usermod $nom -t $i -m";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> modifierUpload(nom, i) async {
    String cmd = "sudo pure-pw usermod $nom -T $i -m";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> modifierFichierMax(nom, i) async {
    String cmd = "sudo pure-pw usermod $nom -n $i -m";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> modifierTailleMax(nom, i) async {
    String cmd = "sudo pure-pw usermod $nom -N $i -m";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> modifierAutoriserClient(nom, ip) async {
    String cmd = "sudo pure-pw usermod $nom -i $ip -m";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> modifierRefuserClient(nom, ip) async {
    String cmd = "sudo pure-pw usermod $nom -I $ip -m";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> modifierAutorisationConnection(nom, ip) async {
    String cmd = "sudo pure-pw usermod $nom -r $ip -m";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> modifierRefuserConnection(nom, ip) async {
    String cmd = "sudo pure-pw usermod $nom -R $ip -m";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> modifierHoraire(nom, i) async {
    String cmd = "sudo pure-pw usermod $nom -z $i -m";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> modifierNombreSessions(nom, i) async {
    String cmd = "sudo pure-pw usermod $nom -y $i -m";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> supprimerUtilisateurVirtuel(nom) async {
    String cmd = "sudo pure-pw userdel $nom";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> modifierMotDePasse(nom) async {
    String cmd = "sudo pure-pw passwd $nom";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> lien() async {
    String cmd = "ln -s /etc/pure-ftpd/conf/PureDB 60puredb";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> voirUid(nom) async {
    String cmd = "id -u $nom";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    print(p.stdout);
    print(p.stderr);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> voirGid(nom) async {
    String cmd = "id -g $nom";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    print(p.stdout);
    print(p.stderr);
    var exitCode = await p.exitCode;
    return exitCode;
  }
}
