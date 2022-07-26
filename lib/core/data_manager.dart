import 'dart:convert';
import 'dart:io' as io;
import 'dart:io';
import 'package:hi_tech/core/account_model.dart';
import 'package:path_provider/path_provider.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<io.File?> get _localFile async {
  final path = await _localPath;
  File('$path/Accounts.json').create(recursive: true);
  io.File accountData = io.File('$path/Accounts.json');
  return accountData;
}

Future addAccount(AccountModel accountModel) async => readAccounts().then((currentContent) async {
      final file = await _localFile;
      currentContent.addAll({accountModel.userID: accountModel.toJson()});
      file!.writeAsString(json.encode(currentContent));
      return;
    });

Future removeAccount(AccountModel accountModel) async => readAccounts().then((currentContent) async {
      final file = await _localFile;
      currentContent.removeWhere((key, value) => key == accountModel.userID);
      file!.writeAsString(json.encode(currentContent));
      return;
    });

Map<String, AccountModel> extractAccounts(Map<String, dynamic> data) {
  return data.map(
    (title, content) => MapEntry(
      title,
      AccountModel.fromJson(content),
    ),
  );
}

Future<Map<String, dynamic>> readAccounts() async {
  try {
    final file = await _localFile;
    var contents;
    if (file != null) {
      contents = await file.readAsString();
    }
    return contents != null ? jsonDecode(contents) : {};
  } catch (e) {
    print(e);
    return {};
  }
}
