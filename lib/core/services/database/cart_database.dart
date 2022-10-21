import 'package:flutter_firebase/constant.dart';
import 'package:flutter_firebase/model/cart_product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabase {
  CartDatabase._();
  static final CartDatabase db = CartDatabase._();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'CartProduct.db');
    return await openDatabase(path, version: 1, onCreate: onCreate);
  }

  Future<void> onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $tableCartProduct(
      $columnName TEXT NOT NULL,
      $columnImage TEXT NOT NULL,
      $columnPrice INTERGER NOT NULL,
      $columnQuantity INTERGER NOT NULL,
      $columnProductId TEXT NOT NULL
    )
''');
  }

  Future<void> insert(CartProductModel model) async {
    var dbClient = await database;
    await dbClient!.insert(tableCartProduct, model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<CartProductModel>> getAllProduct() async {
    var dbClient = await database;
    List<Map<String, dynamic>> maps = await dbClient!.query(tableCartProduct);
    List<CartProductModel> list = maps.isNotEmpty
        ? maps.map((product) => CartProductModel.fromJson(product)).toList()
        : [];
    return list;
  }

  Future<int> updateProduct(CartProductModel product) async {
    print(product.productId);
    var dbClient = await database;
    return await dbClient!.update(tableCartProduct, product.toJson(),
        where: "$columnProductId = ?", whereArgs: [product.productId]);
  }
}
