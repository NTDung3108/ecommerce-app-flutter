import 'package:ecommerce_app/models/product/product_card.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final _databaseName = 'Cart_db.db';
  static final _tasks_table = 'cart';
  static final _databaseVersion = 1;
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDB();
    return _database!;
  }

  _initDB() async {
    String path = join(await getDatabasesPath(), _databaseName);

    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE $_tasks_table('
        'id INTEGER PRIMARY KEY AUTOINCREMENT,'
        'uidProduct INTEGER,'
        'image TEXT,'
        'name TEXT,'
        'quantity INTEGER,'
        'price INTEGER,'
        'importPrice INTEGER)');
  }

  Future<int> insertCart(ProductCart cart) async {
    Database? db = await DBHelper._database;
    return await db!.insert(_tasks_table, {
      'uidProduct': cart.uidProduct,
      'image': cart.image,
      'name': cart.name,
      'quantity': cart.quantity,
      'price': cart.price,
      'importPrice': cart.importPrice,
    });
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database? db = await DBHelper._database;
    return await db!.query(_tasks_table);
  }

  Future<List<Map<String, dynamic>>> queryRows(int idProduct) async {
    Database? db = await DBHelper._database;
    return await db!.rawQuery('SELECT*FROM $_tasks_table WHERE uidProduct=$idProduct');
  }

  Future<int> delete(int id) async {
    Database? db = await DBHelper._database;
    return await db!.rawDelete('DELETE FROM $_tasks_table WHERE uidProduct = ?',[id]);
  }

  Future<int> deleteAllTasks() async {
    Database? db = await DBHelper._database;
    return await db!.delete(_tasks_table);
  }

  Future<int> update(int id, int quantity) async {
    return await _database!.rawUpdate('''
    UPDATE $_tasks_table
    SET quantity = ?, amount = ?
    WHERE uidProduct = ?
    ''', [quantity,  id]);
  }
}
