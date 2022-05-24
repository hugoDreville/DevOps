import 'dart:io';

class Ftp {
  static Future<int> installPureFtpd() async {
    String cmd = "sudo apt install pure-ftpd -y";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> uninstallPureFtpd() async {
    String cmd = "sudo apt purge pure-ftpd -y";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> update() async {
    String cmd = "sudo apt update";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> restart() async {
    String cmd = "sudo service pure-ftpd restart";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> addWrapper(nom) async {
    String cmd =
        'sudo touch /etc/pure-ftpd/conf/$nom | sudo chmod 755 /etc/pure-ftpd/conf/$nom';
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = p.exitCode;
    print(exitCode);
    return exitCode;
  }

  static Future<int> dellWrapper(nom) async {
    String cmd = "sudo rm /etc/pure-ftpd/conf/$nom";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> afficheWrapper(nom) async {
    String cmd = "sudo cat /etc/pure-ftpd/conf/$nom";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    print(p.stdout);
    print(p.stderr);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> modifieWrapper(nom, l) async {
    String cmd = 'sudo echo "$l" > /etc/pure-ftpd/conf/$nom';
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }
}
