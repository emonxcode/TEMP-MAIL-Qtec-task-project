// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// class SqfliteDatabaseHelper {
//   static final SqfliteDatabaseHelper _instance =
//       SqfliteDatabaseHelper.internal();
//   SqfliteDatabaseHelper.internal();
//   factory SqfliteDatabaseHelper() => _instance;
//   static const int version = 1;
//   static Database? _database;

//   Future<Database> get database async => _database ??= await initDB();

//   Future initDB() async {
//     String path = join(await getDatabasesPath(), "dokanee_db.db");
//     return await openDatabase(path, version: version, onOpen: (db) {},
//         onCreate: (Database db, int version) async {
//       var dbBatch = db.batch();
//       dbBatch.execute(createProductDataTable());
//       dbBatch.execute(createCategoryTable());
//       dbBatch.execute(createFailedJobsQueue());
//       await dbBatch.commit(noResult: true);
//     }, onUpgrade: (Database db, currentVersion, newVersion) async {
//       final upgradeCalls = {
//         2: (Database db, Batch dbBatch) async {
//           dbBatch.execute('DROP TABLE IF EXISTS products');
//           dbBatch.execute(createProductDataTable());
//           dbBatch.execute('DROP TABLE IF EXISTS categories');
//           dbBatch.execute(createCategoryTable());
//           dbBatch.execute('DROP TABLE IF EXISTS failed_jobs_queue');
//           dbBatch.execute(createFailedJobsQueue());
//         },
//       };
//       var dbBatch = db.batch();
//       upgradeCalls.forEach((vesion, call) async {
//         if (version > currentVersion) await call(db, dbBatch);
//       });
//       await dbBatch.commit(noResult: true);
//     });
//   }

//   /* ================================  Products  ==============================  */

//   String createProductDataTable() {
//     return "CREATE TABLE IF NOT EXISTS products ("
//         "id INTEGER,"
//         "name TEXT,"
//         "product_code TEXT,"
//         "bar_code TEXT,"
//         "unit_code TEXT,"
//         "unit_id INTEGER,"
//         "brand TEXT,"
//         "category_name TEXT,"
//         "category_id INTEGER,"
//         "purchase_price REAL,"
//         "selling_price REAL,"
//         "discount REAL,"
//         "tax REAL,"
//         "img TEXT,"
//         "order_qty REAL,"
//         "stock_qty REAL,"
//         "supplier_id INTEGER,"
//         "supplier_name TEXT,"
//         "supplier_mobile TEXT,"
//         "shop_id INTEGER,"
//         "expire_date TEXT,"
//         "status INTEGER,"
//         "created_at TEXT); ";
//   }

//   Future<int> insertProduct(Product product) async {
//     Database db = await database;
//     var result = await db.insert("products", product.toJson());
//     return result;
//   }

//   Future<List<Product>> getProductList() async {
//     Database db = await database;
//     List<Product> productList = <Product>[];
//     var productMapList = await db.query("products", orderBy: 'created_at');
//     for (int i = 0; i < productMapList.length; i++) {
//       productList.add(Product.fromJson(productMapList[i]));
//     }
//     return productList;
//   }

//   Future<int> deleteProductData() async {
//     var db = await database;
//     int result = await db.rawDelete('DELETE FROM products');
//     return result;
//   }

//   Future<int> deleteProductById(int? id) async {
//     var db = await database;
//     var ids = [id];
//     int result = await db.rawDelete('DELETE FROM products WHERE id=?', ids);
//     return result;
//   }

//   Future getRowCountProducts() async {
//     var db = await database;
//     var result =
//         await db.rawQuery('SELECT COUNT(*) AS row_count FROM products');

//     return result[0]['row_count'];
//   }
//   /* ================================  Category  ==============================  */

//   String createCategoryTable() {
//     return "CREATE TABLE IF NOT EXISTS categories ("
//         "id INTEGER,"
//         "name TEXT,"
//         "img TEXT,"
//         "status INTEGER,"
//         "created_at TEXT); ";
//   }

//   Future<int> insertCategory(CategoryModel category) async {
//     Database db = await database;
//     var result = await db.insert("categories", category.toJson());
//     return result;
//   }

//   Future<List<CategoryModel>> getCategories() async {
//     Database db = await database;
//     List<CategoryModel> productList = <CategoryModel>[];
//     var productMapList = await db.query("categories", orderBy: 'created_at');
//     for (int i = 0; i < productMapList.length; i++) {
//       productList.add(CategoryModel.fromJson(productMapList[i]));
//     }
//     return productList;
//   }

//   Future<int> deleteCategories() async {
//     var db = await database;
//     int result = await db.rawDelete('DELETE FROM categories');
//     return result;
//   }

//   Future<int> deleteCategoryById(int? id) async {
//     var db = await database;
//     var ids = [id];
//     int result = await db.rawDelete('DELETE FROM categories WHERE id=?', ids);
//     return result;
//   }

//   Future getRowCountCategory() async {
//     var db = await database;
//     var result =
//         await db.rawQuery('SELECT COUNT(*) AS row_count FROM categories');

//     return result[0]['row_count'];
//   }

//   /* ================================  Units  ==============================  */

//   String createUnitTable() {
//     return "CREATE TABLE IF NOT EXISTS units ("
//         "id INTEGER,"
//         "name TEXT,"
//         "img TEXT,"
//         "status INTEGER,"
//         "created_at TEXT); ";
//   }

//   Future<int> insertUnit(Unit product) async {
//     Database db = await database;
//     var result = await db.insert("units", product.toJson());
//     return result;
//   }

//   Future<List<Unit>> getUnits() async {
//     Database db = await database;
//     List<Unit> productList = <Unit>[];
//     var productMapList = await db.query("units", orderBy: 'created_at');
//     for (int i = 0; i < productMapList.length; i++) {
//       productList.add(Unit.fromJson(productMapList[i]));
//     }
//     return productList;
//   }

//   Future<int> deleteUnits() async {
//     var db = await database;
//     int result = await db.rawDelete('DELETE FROM units');
//     return result;
//   }

//   Future<int> deleteUnitById(int? id) async {
//     var db = await database;
//     var ids = [id];
//     int result = await db.rawDelete('DELETE FROM units WHERE id=?', ids);
//     return result;
//   }

//   /* ================================  Failed Jobs  ==============================  */

//   String createFailedJobsQueue() {
//     return "CREATE TABLE IF NOT EXISTS failed_jobs_queue ("
//         "id INTEGER PRIMARY KEY,"
//         "url TEXT,"
//         "data TEXT,"
//         "created_at TEXT); ";
//   }

//   Future<int> insertFailedJob(FailedJob job) async {
//     Database db = await database;
//     var result = await db.insert("failed_jobs_queue", job.toJson());
//     return result;
//   }

//   Future<List<CategoryModel>> getFailedJobs() async {
//     Database db = await database;
//     List<CategoryModel> productList = <CategoryModel>[];
//     var productMapList =
//         await db.query("failed_jobs_queue", orderBy: 'created_at');
//     for (int i = 0; i < productMapList.length; i++) {
//       productList.add(CategoryModel.fromJson(productMapList[i]));
//     }
//     return productList;
//   }

//   Future<int> deleteFailedJobs() async {
//     var db = await database;
//     int result = await db.rawDelete('DELETE FROM failed_jobs_queue');
//     return result;
//   }

//   Future<int> deleteFailedJobsById(int? id) async {
//     var db = await database;
//     var ids = [id];
//     int result =
//         await db.rawDelete('DELETE FROM failed_jobs_queue WHERE id=?', ids);
//     return result;
//   }

//   dbClose() {
//     _database?.close();
//   }
// }

// /// FailedJobs model
// class FailedJob {
//   int? id;
//   String? url;
//   String? data;
//   String? createdAt;

//   FailedJob({this.id, this.url, this.data, this.createdAt});

//   FailedJob.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     url = json['url'];
//     data = json['data'];
//     createdAt = json['created_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['url'] = url;
//     data['data'] = this.data;
//     data['created_at'] = createdAt;
//     return data;
//   }
// }
