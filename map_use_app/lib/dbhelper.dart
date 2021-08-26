import 'package:path/path.dart';
import './place.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  final int version = 1;
  Database db;
  List<Place> places = List<Place>();
  static final DbHelper _dbHelper = DbHelper._internal();
  DbHelper._internal();

  factory DbHelper() {
    return _dbHelper;
  }

  Future<Database> openDb() async {
    if (db == null) {
      db = await openDatabase(join(await getDatabasesPath(), 'mapp.db'),
          onCreate: (database, version) {
            database.execute(
                'CREATE TABLE places(id INTEGER PRIMARY KEY, name TEXT, lat DOUBLE, lon DOUBLE, image TEXT)');
          }, version: version);
    }
    return db;
  }

  Future insertMockData() async {
    db = await openDb();
    await db.execute('INSERT INTO places VALUES (4, "Polideportivo Centenario", 4.299804,  -74.815935, "")');
    await db.execute('INSERT INTO places VALUES (5, "Iglesia San Miguel", 4.2927134, -74.8074968, "")');
    await db.execute('INSERT INTO places VALUES (6, "PLaza de Mercado", 4.2919057, -74.8077999, "")');
    List places = await db.rawQuery('select * from places');
    print(places[0].toString());
  }

  Future<List<Place>> getPlaces() async {
    final List<Map<String, dynamic>> maps = await db.query('places');
    // Convert the List<Map<String, dynamic> into a List<Places>.
    this.places = List.generate(maps.length, (i) {
      return Place(
        maps[i]['id'],
        maps[i]['name'],
        maps[i]['lat'],
        maps[i]['lon'],
        maps[i]['image'],
      );
    });
    return places;
  }

  Future<int> insertPlace(Place place) async {
    // Get a reference to the database.

    int id = await this.db.insert(
      'places',
      place.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id;
  }
  Future<int> updatePlace(Place place) async {
    // Get a reference to the database.

    int id = await this.db.update(
      'places',
      place.toMap(),
    );
    return id;
  }

  Future<int> deletePlace(Place place) async {
    int result = await db.delete("places", where: "id = ?", whereArgs: [place.id]);
    return result;
  }

}