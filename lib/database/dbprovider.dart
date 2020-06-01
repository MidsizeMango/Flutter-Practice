import 'package:flutter_practice/core/models/cart_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider dbProvider = DBProvider._();

  static Database _database;
  static const CART_DATA = "CartData";

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(
        join(await getDatabasesPath(), 'flutter_practice.db'),
        onCreate: (db, version) async {
      await db.execute("CREATE TABLE $CART_DATA("
          "cartId TEXT PRIMARY KEY,"
          "productId TEXT,"
          "productName TEXT,"
          "productImage TEXT,"
          "productCategory TEXT,"
          "productPrice TEXT,"
          "isEggless TEXT,"
          "extras TEXT,"
          "dateTime TEXT,"
          "quantity TEXT,"
          "itemCount INTEGER"
          ")");
    }, version: 1);
  }

  addProductInCart(Cart cartData) async {
    List<Map<String, dynamic>> resultList = await searchIfItemExistsInCart(cartData.productId);
    bool result = resultList.isEmpty;
    var res = (result) ? await insertItemInCart(cartData.toMap()) : await updateItemCount(resultList);
    return res;
  }

  insertItemInCart(Map<String, dynamic> cartData) async {
    final db = await database;
    cartData['itemCount'] = 1;
    var res = await db.insert(CART_DATA, cartData);
    return res;
  }

  updateItemCount(List<Map<String, dynamic>> cartData) async {
    final db = await database;
    Map<String, dynamic> newCartData = cartData.map((val) => Cart.fromMap(val)).toList()[0].toMap();
    String cartId = newCartData['cartId'];
    int newItemCount = newCartData['itemCount'] + 1;
    double price = newCartData['productPrice'];
    double newPrice = price + (price / newItemCount);

    var res = await db.execute(
      'UPDATE $CART_DATA SET itemCount = $newItemCount, productPrice=\'${newPrice.toString()}\' WHERE cartId = \'$cartId\''
    );
    return res;
  }

  getAllItemsInCart() async {
    final db = await database;
    var res = await db.query(CART_DATA);
    List<Cart> cartItems = res.isNotEmpty ? res.map((val) => Cart.fromMap(val)).toList() : null;
    return cartItems;
  }

  getTotalPrice() async {
    final db = await database;
    var res = await db.query(CART_DATA);
    List<Cart> cartItems = res.isNotEmpty ? res.map((val) => Cart.fromMap(val)).toList() : null;
    return cartItems;
  }

  Future<List<Map<String, dynamic>>> searchIfItemExistsInCart(productId) async {
    final db = await database;
    var res = await db.query(CART_DATA, where: 'productId=?', whereArgs: [productId]);
    return res;
  }

  deleteItemFromCart(cartId) async {
    final db = await database;
    await db.delete(CART_DATA, where: "cartId=?", whereArgs: [cartId]);
  }

  deleteAllItemsFromCart() async {
    final db = await database;
    await db.rawDelete("Delete * from $CART_DATA");
  }
}
