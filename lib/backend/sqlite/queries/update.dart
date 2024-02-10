import 'package:sqflite/sqflite.dart';

/// BEGIN ADDCATEGORY
Future performAddCategory(
  Database database, {
  int? id,
}) {
  final query = '''
update Category
set active = 1
where id = $id
''';
  return database.rawQuery(query);
}

/// END ADDCATEGORY

/// BEGIN REMOVECATEGORY
Future performRemoveCategory(
  Database database, {
  int? id,
}) {
  final query = '''
update Category
set active = 0
where id = $id
''';
  return database.rawQuery(query);
}

/// END REMOVECATEGORY

/// BEGIN SELECTALL
Future performSelectAll(
  Database database,
) {
  const query = '''
update Category 
set active = 1
''';
  return database.rawQuery(query);
}

/// END SELECTALL

/// BEGIN DESELECTALL
Future performDeselectAll(
  Database database,
) {
  const query = '''
update Category
set active = 0
''';
  return database.rawQuery(query);
}

/// END DESELECTALL
