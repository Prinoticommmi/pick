import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _activeCategories =
          await secureStorage.getStringList('ff_activeCategories') ??
              _activeCategories;
    });
    await _safeInitAsync(() async {
      _categoryStatus = (await secureStorage.getStringList('ff_categoryStatus'))
              ?.map((x) {
                try {
                  return CategoryStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _categoryStatus;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  PostStruct _post = PostStruct.fromSerializableMap(
      jsonDecode('{"photos":"[]","votes":"[]"}'));
  PostStruct get post => _post;
  set post(PostStruct value) {
    _post = value;
  }

  void updatePostStruct(Function(PostStruct) updateFn) {
    updateFn(_post);
  }

  List<String> _activeCategories = ['Abbigliamento'];
  List<String> get activeCategories => _activeCategories;
  set activeCategories(List<String> value) {
    _activeCategories = value;
    secureStorage.setStringList('ff_activeCategories', value);
  }

  void deleteActiveCategories() {
    secureStorage.delete(key: 'ff_activeCategories');
  }

  void addToActiveCategories(String value) {
    _activeCategories.add(value);
    secureStorage.setStringList('ff_activeCategories', _activeCategories);
  }

  void removeFromActiveCategories(String value) {
    _activeCategories.remove(value);
    secureStorage.setStringList('ff_activeCategories', _activeCategories);
  }

  void removeAtIndexFromActiveCategories(int index) {
    _activeCategories.removeAt(index);
    secureStorage.setStringList('ff_activeCategories', _activeCategories);
  }

  void updateActiveCategoriesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _activeCategories[index] = updateFn(_activeCategories[index]);
    secureStorage.setStringList('ff_activeCategories', _activeCategories);
  }

  void insertAtIndexInActiveCategories(int index, String value) {
    _activeCategories.insert(index, value);
    secureStorage.setStringList('ff_activeCategories', _activeCategories);
  }

  List<CategoryStruct> _categoryStatus = [
    CategoryStruct.fromSerializableMap(
        jsonDecode('{"name":"Abbigliamento","active":"true"}')),
    CategoryStruct.fromSerializableMap(
        jsonDecode('{"name":"Occhiali","active":"true"}')),
    CategoryStruct.fromSerializableMap(
        jsonDecode('{"name":"Acconciatura","active":"true"}')),
    CategoryStruct.fromSerializableMap(
        jsonDecode('{"name":"Make-up","active":"true"}')),
    CategoryStruct.fromSerializableMap(
        jsonDecode('{"name":"Fotografia","active":"true"}')),
    CategoryStruct.fromSerializableMap(
        jsonDecode('{"name":"Tatuaggi","active":"true"}')),
    CategoryStruct.fromSerializableMap(
        jsonDecode('{"name":"Animali","active":"true"}')),
    CategoryStruct.fromSerializableMap(
        jsonDecode('{"name":"Luoghi","active":"true"}')),
    CategoryStruct.fromSerializableMap(
        jsonDecode('{"name":"Tutti","active":"true"}'))
  ];
  List<CategoryStruct> get categoryStatus => _categoryStatus;
  set categoryStatus(List<CategoryStruct> value) {
    _categoryStatus = value;
    secureStorage.setStringList(
        'ff_categoryStatus', value.map((x) => x.serialize()).toList());
  }

  void deleteCategoryStatus() {
    secureStorage.delete(key: 'ff_categoryStatus');
  }

  void addToCategoryStatus(CategoryStruct value) {
    _categoryStatus.add(value);
    secureStorage.setStringList('ff_categoryStatus',
        _categoryStatus.map((x) => x.serialize()).toList());
  }

  void removeFromCategoryStatus(CategoryStruct value) {
    _categoryStatus.remove(value);
    secureStorage.setStringList('ff_categoryStatus',
        _categoryStatus.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCategoryStatus(int index) {
    _categoryStatus.removeAt(index);
    secureStorage.setStringList('ff_categoryStatus',
        _categoryStatus.map((x) => x.serialize()).toList());
  }

  void updateCategoryStatusAtIndex(
    int index,
    CategoryStruct Function(CategoryStruct) updateFn,
  ) {
    _categoryStatus[index] = updateFn(_categoryStatus[index]);
    secureStorage.setStringList('ff_categoryStatus',
        _categoryStatus.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCategoryStatus(int index, CategoryStruct value) {
    _categoryStatus.insert(index, value);
    secureStorage.setStringList('ff_categoryStatus',
        _categoryStatus.map((x) => x.serialize()).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
