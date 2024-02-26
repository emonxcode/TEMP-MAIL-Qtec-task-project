import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:temp_mail/src/modules/inbox_messages/models/email.model.dart';

class SqfliteDatabaseHelper {
  static final SqfliteDatabaseHelper _instance =
      SqfliteDatabaseHelper.internal();
  SqfliteDatabaseHelper.internal();
  factory SqfliteDatabaseHelper() => _instance;
  static const int version = 1;
  static Database? _database;

  Future<Database> get database async => _database ??= await initDB();

  Future initDB() async {
    String path = join(await getDatabasesPath(), "qtec_bd.db");
    return await openDatabase(path, version: version, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      var dbBatch = db.batch();
      dbBatch.execute(createProductDataTable());
      await dbBatch.commit(noResult: true);
    }, onUpgrade: (Database db, currentVersion, newVersion) async {
      final upgradeCalls = {
        2: (Database db, Batch dbBatch) async {
          dbBatch.execute('DROP TABLE IF EXISTS messages');
          dbBatch.execute(createProductDataTable());
        },
      };
      var dbBatch = db.batch();
      upgradeCalls.forEach((vesion, call) async {
        if (version > currentVersion) await call(db, dbBatch);
      });
      await dbBatch.commit(noResult: true);
    });
  }

  /* ================================  messages  ==============================  */

  String createProductDataTable() {
    return "CREATE TABLE IF NOT EXISTS messages ("
        "id TEXT,"
        "from TEXT,"
        "subject TEXT,"
        "intro TEXT,"
        "name TEXT,"
        "createdAt TEXT); ";
  }

  Future<int> insertMessage(Email email) async {
    Database db = await database;
    var result = await db.insert("messages", email.toJson());
    return result;
  }

  Future<List<Email>> getAllMessages() async {
    Database db = await database;
    List<Email> messsageList = <Email>[];
    var messsageMapList = await db.query("messages", orderBy: 'createdAt');
    for (int i = 0; i < messsageMapList.length; i++) {
      messsageList.add(Email.fromJson(messsageMapList[i]));
    }
    return messsageList;
  }

  Future<int> deleteMessages() async {
    var db = await database;
    int result = await db.rawDelete('DELETE FROM messages');
    return result;
  }
}
