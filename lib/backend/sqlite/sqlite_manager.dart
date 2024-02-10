import 'package:flutter/foundation.dart';

import '/backend/sqlite/init.dart';
import 'queries/read.dart';
import 'queries/update.dart';

import 'package:sqflite/sqflite.dart';
export 'queries/read.dart';
export 'queries/update.dart';

class SQLiteManager {
  SQLiteManager._();

  static SQLiteManager? _instance;
  static SQLiteManager get instance => _instance ??= SQLiteManager._();

  static late Database _database;
  Database get database => _database;

  static Future initialize() async {
    if (kIsWeb) {
      return;
    }
    _database = await initializeDatabaseFromDbFile(
      'pick',
      'PICK.db',
    );
  }

  /// START READ QUERY CALLS

  Future<List<CategoriesRow>> categories() => performCategories(
        _database,
      );

  Future<List<ActiveCategoriesRow>> activeCategories() =>
      performActiveCategories(
        _database,
      );

  /// END READ QUERY CALLS

  /// START UPDATE QUERY CALLS

  Future addCategory({
    int? id,
  }) =>
      performAddCategory(
        _database,
        id: id,
      );

  Future removeCategory({
    int? id,
  }) =>
      performRemoveCategory(
        _database,
        id: id,
      );

  Future selectAll() => performSelectAll(
        _database,
      );

  Future deselectAll() => performDeselectAll(
        _database,
      );

  /// END UPDATE QUERY CALLS
}
