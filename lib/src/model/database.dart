import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DBConnection {
  DBConnection._privateConstructor();

  static final DBConnection instance = DBConnection._privateConstructor();
  static Database? _dbConnection;

  get dbConnection async {
    if (_dbConnection != null) return _dbConnection;

    return await _initDbConnection();
  }

  _initDbConnection() async {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    
    return await openDatabase(
      await getDbPath(),
      version: 1,
      onCreate: _onCreate,
    );
  }
  
  _onCreate(db, version) async {
    await db.execute(_tutor);
    // await db.execute(_specie);
    // await db.execute(_pet);
    // await db.execute(_tutorPet);
    // await db.execute(_client);
    // await db.execute(_service);
    // await db.execute(_os);
    // await db.execute(_paymentTypes);
    // await db.execute(_osService);
    // await db.execute(_package);
  }

  String get _tutor => '''
    CREATE TABLE tutor (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      email TEXT,
      phone TEXT,
      phone_alternative TEXT,
      address TEXT,
      birth_date DATE,
      cpf TEXT
    );
  ''';

  // String get _specie => '''
  //   CREATE TABLE specie (
  //     id INTEGER PRIMARY KEY AUTOINCREMENT,
  //     name TEXT
  //   );
  // ''';

  // String get _pet => '''
  //   CREATE TABLE pet (
  //     id INTEGER PRIMARY KEY AUTOINCREMENT,
  //     name TEXT NOT NULL,
  //     birth_date DATE,
  //     specie_id INTEGER,
  //     FOREIGN KEY (specie_id) REFERENCES specie (id)
  //   );
  // ''';

  // String get _tutorPet => '''
  //   CREATE TABLE tutor_pet (
  //     id INTEGER PRIMARY KEY AUTOINCREMENT,
  //     tutor_id INTEGER NOT NULL,
  //     pet_id INTEGER NOT NULL,
  //     FOREIGN KEY (tutor_id) REFERENCES tutor (id),
  //     FOREIGN KEY (pet_id) REFERENCES pet (id)
  //   );
  // ''';

  // String get _client => '''
  //   CREATE TABLE client (
  //     id INTEGER PRIMARY KEY AUTOINCREMENT,
  //     name TEXT NOT NULL,
  //     email TEXT,
  //     phone TEXT,
  //     phone_alternative TEXT,
  //     address TEXT
  //   );
  // ''';

  // String get _service => '''
  //   CREATE TABLE service (
  //     id INTEGER PRIMARY KEY AUTOINCREMENT,
  //     name TEXT NOT NULL,
  //     price REAL,
  //     description TEXT,
  //     duration INTEGER
  //   );
  // ''';

  // String get _os => '''
  //   CREATE TABLE os (
  //     id INTEGER PRIMARY KEY AUTOINCREMENT,
  //     client_id INTEGER NOT NULL,
  //     pet_id INTEGER NOT NULL,
  //     open_date DATE NOT NULL,
  //     close_date DATE,
  //     status TEXT,
  //     time INTEGER,
  //     payment_type_id INTEGER,
  //     FOREIGN KEY (client_id) REFERENCES client (id),
  //     FOREIGN KEY (pet_id) REFERENCES pet (id)
  //   );
  // ''';

  // String get _paymentTypes => '''
  //   CREATE TABLE payment_types (
  //     id INTEGER PRIMARY KEY AUTOINCREMENT,
  //     name TEXT NOT NULL

  //   );
  // ''';

  // String get _osService => '''
  //   CREATE TABLE os_service (
  //     id INTEGER PRIMARY KEY AUTOINCREMENT,
  //     os_id INTEGER NOT NULL,
  //     service_id INTEGER NOT NULL,
  //     FOREIGN KEY (os_id) REFERENCES os (id),
  //     FOREIGN KEY (service_id) REFERENCES service (id)
  //   );
  // ''';

  // String get _package => '''
  //   CREATE TABLE package (
  //     id INTEGER PRIMARY KEY AUTOINCREMENT,
  //     name TEXT NOT NULL,
  //     price REAL,
  //     description TEXT
  //   );
  // ''';

  getDbPath() async {
    const String dbName = 'whale_pet.sqlite';
    String dbPath = join(Directory(Platform.resolvedExecutable).parent.path, dbName);  
    return dbPath;
  }
}