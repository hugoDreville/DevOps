import 'dart:io';

class Ftp {
  static Future<void> installPureFtpd() async {
    String cmd = "sudo apt install pure-ftpd -y";
    Process p = await Process.start("bash", ["-c", cmd]);
    await stdout.addStream(p.stdout);
    await stderr.addStream(p.stderr);
  }

  static Future<void> uninstallPureFtpd() async {
    String cmd = "sudo apt purge pure-ftpd -y";
    Process p = await Process.start("bash", ["-c", cmd]);
    await stdout.addStream(p.stdout);
    await stderr.addStream(p.stderr);
  }

  static Future<void> update() async {
    String cmd = "sudo apt update";
    Process p = await Process.start("bash", ["-c", cmd]);
    await stdout.addStream(p.stdout);
    await stderr.addStream(p.stderr);
  }

  static Future<void> restart() async {
    String cmd = "sudo service pure-ftpd restart";
    Process p = await Process.start("bash", ["-c", cmd]);
    await stdout.addStream(p.stdout);
    await stderr.addStream(p.stderr);
  }

  static Future<void> addWrapper(nom) async {
    String cmd =
        'sudo touch /etc/pure-ftpd/conf/$nom | sudo chmod 755 /etc/pure-ftpd/conf/$nom';
    ProcessResult q = await Process.run("bash", ["-c", cmd]);
  }

  static Future<void> dellWrapper(nom) async {
    String cmd = "sudo rm /etc/pure-ftpd/conf/$nom";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
  }

  static Future<void> afficheWrapper(nom) async {
    String cmd = "sudo cat /etc/pure-ftpd/conf/$nom";
    Process p = await Process.start("bash", ["-c", cmd]);
    await stdout.addStream(p.stdout);
    await stderr.addStream(p.stderr);
  }

  static Future<void> modifieWrapper(nom, l) async {
    String cmd = 'sudo echo "$l" > /etc/pure-ftpd/conf/$nom';
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
  }
}
