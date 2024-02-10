import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN CATEGORIES
Future<List<CategoriesRow>> performCategories(
  Database database,
) {
  const query = '''
select Description from Category
''';
  return _readQuery(database, query, (d) => CategoriesRow(d));
}

class CategoriesRow extends SqliteRow {
  CategoriesRow(super.data);

  String get category => data['category'] as String;
}

/// END CATEGORIES

/// BEGIN ACTIVECATEGORIES
Future<List<ActiveCategoriesRow>> performActiveCategories(
  Database database,
) {
  const query = '''
select Description from Category where active = 1
''';
  return _readQuery(database, query, (d) => ActiveCategoriesRow(d));
}

class ActiveCategoriesRow extends SqliteRow {
  ActiveCategoriesRow(super.data);

  String get category => data['category'] as String;
}

/// END ACTIVECATEGORIES
