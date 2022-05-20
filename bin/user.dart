import 'dart:io';

class User {
  static Future<void> createUser(nom) async {
    String cmd = "sudo adduser $nom ";
    Process p = await Process.start("bash", ["-c", cmd]);
    p.stdin.writeln("btsinfo");
    print("ok");
  }

  static Future<void> addGroup(nom, groupe) async {
    String cmd = "sudo adduser $nom $groupe";
    Process p = await Process.start("bash", ["-c", cmd]);
    await stdout.addStream(p.stdout);
    await stderr.addStream(p.stderr);
  }

  static Future<void> afficherUser() async {
    String cmd = "  cut -d: -f1 /etc/passwd";
    Process p = await Process.start("bash", ["-c", cmd]);
    await stdout.addStream(p.stdout);
    await stderr.addStream(p.stderr);
  }

  static Future<void> afficherGroup() async {
    String cmd = "  cut -d: -f1 /etc/group";
    Process p = await Process.start("bash", ["-c", cmd]);
    await stdout.addStream(p.stdout);
    await stderr.addStream(p.stderr);
  }

  static Future<void> createGroup(nom, gid) async {
    String cmd = "sudo addgroup $nom -gid $gid";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
  }

  static Future<void> delGroup(nom) async {
    String cmd = "sudo delgroup $nom";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
  }

  static Future<void> userdel(nom) async {
    String cmd = "sudo userdel $nom";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
  }

  static Future<void> voirInfos(nom) async {
    String cmd = "sudo pure-pw show $nom";
    Process p = await Process.start("bash", ["-c", cmd]);
    await stdout.addStream(p.stdout);
    await stderr.addStream(p.stderr);
  }

  static Future<void> createUserVirtuel(nom, map, uid, gid) async {
    String cmd =
        "sudo pure-pw useradd $nom -u $uid -g $gid -d /home/$map/$nom -m";
    Process p = await Process.start("bash", ["-c", cmd]);
    await stdout.addStream(p.stdout);
    await stderr.addStream(p.stderr);
    p.stdin.addStream(stdin);
  }

  static Future<void> modifierDownload(nom, i) async {
    String cmd = "sudo pure-pw usermod $nom -t $i -m";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
  }

  static Future<void> modifierUpload(nom, i) async {
    String cmd = "sudo pure-pw usermod $nom -T $i -m";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
  }

  static Future<void> modifierFichierMax(nom, i) async {
    String cmd = "sudo pure-pw usermod $nom -n $i -m";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
  }

  static Future<void> modifierTailleMax(nom, i) async {
    String cmd = "sudo pure-pw usermod $nom -N $i -m";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
  }

  static Future<void> modifierAutoriserClient(nom, ip) async {
    String cmd = "sudo pure-pw usermod $nom -i $ip -m";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
  }

  static Future<void> modifierRefuserClient(nom, ip) async {
    String cmd = "sudo pure-pw usermod $nom -I $ip -m";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
  }

  static Future<void> modifierAutorisationConnection(nom, ip) async {
    String cmd = "sudo pure-pw usermod $nom -r $ip -m";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
  }

  static Future<void> modifierRefuserConnection(nom, ip) async {
    String cmd = "sudo pure-pw usermod $nom -R $ip -m";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
  }

  static Future<void> modifierHoraire(nom, i) async {
    String cmd = "sudo pure-pw usermod $nom -z $i -m";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
  }

  static Future<void> modifierNombreSessions(nom, i) async {
    String cmd = "sudo pure-pw usermod $nom -y $i -m";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
  }

  static Future<void> supprimerUtilisateurVirtuel(nom) async {
    String cmd = "sudo pure-pw userdel $nom";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
  }

  static Future<void> modifierMotDePasse(nom) async {
    String cmd = "sudo pure-pw passwd $nom";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
  }

  static Future<void> lien() async {
    String cmd = "ln -s /etc/pure-ftpd/conf/PureDB 60puredb";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
  }

  static Future<void> droitRoot(nom) async {
    String cmd = "sudo chown root:root /home/$nom/";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
  }

  static Future<void> voirUid(nom) async {
    String cmd = "id -u $nom";
    Process p = await Process.start("bash", ["-c", cmd]);
    await stdout.addStream(p.stdout);
    await stderr.addStream(p.stderr);
  }

  static Future<void> voirGid(nom) async {
    String cmd = "id -g $nom";
    Process p = await Process.start("bash", ["-c", cmd]);
    await stdout.addStream(p.stdout);
    await stderr.addStream(p.stderr);
  }
}
