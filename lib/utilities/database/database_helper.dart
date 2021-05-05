import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  Database? _database;

  DataBaseHelper._();

  static final DataBaseHelper db = DataBaseHelper._();

  Future<Database?> get database async {
    if (_database != null && _database!.isOpen) {
      return _database;
    } else {
      _database = await connectDatabase();
    }
    return _database;
  }

  set setDatabase(Database db) {
    _database = db;
  }

  Future<Database?> connectDatabase() async {
    return await openDatabase("db_foods_bootcamp",
        version: 1, onOpen: _onOpenDB, onCreate: _onCreateDB);
  }

  void _onOpenDB(Database db) async {
    await db.execute("PRAGMA foreing_keys=ON");
  }

  void _onCreateDB(Database db, int versionDB) async {
    return db.execute(
        "CREATE TABLE IF NOT EXISTS food (id INTEGER PRIMARY KEY AUTOINCREMENT, idServer INTEGER, name Text, calories Real);");
  }
}
