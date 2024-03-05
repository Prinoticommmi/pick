// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoryStruct extends FFFirebaseStruct {
  CategoryStruct({
    String? name,
    bool? active,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _active = active,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  set active(bool? val) => _active = val;
  bool hasActive() => _active != null;

  static CategoryStruct fromMap(Map<String, dynamic> data) => CategoryStruct(
        name: data['name'] as String?,
        active: data['active'] as bool?,
      );

  static CategoryStruct? maybeFromMap(dynamic data) =>
      data is Map ? CategoryStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'active': _active,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'active': serializeParam(
          _active,
          ParamType.bool,
        ),
      }.withoutNulls;

  static CategoryStruct fromSerializableMap(Map<String, dynamic> data) =>
      CategoryStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        active: deserializeParam(
          data['active'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'CategoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CategoryStruct &&
        name == other.name &&
        active == other.active;
  }

  @override
  int get hashCode => const ListEquality().hash([name, active]);
}

CategoryStruct createCategoryStruct({
  String? name,
  bool? active,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CategoryStruct(
      name: name,
      active: active,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CategoryStruct? updateCategoryStruct(
  CategoryStruct? category, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    category
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCategoryStructData(
  Map<String, dynamic> firestoreData,
  CategoryStruct? category,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (category == null) {
    return;
  }
  if (category.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && category.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final categoryData = getCategoryFirestoreData(category, forFieldValue);
  final nestedData = categoryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = category.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCategoryFirestoreData(
  CategoryStruct? category, [
  bool forFieldValue = false,
]) {
  if (category == null) {
    return {};
  }
  final firestoreData = mapToFirestore(category.toMap());

  // Add any Firestore field values
  category.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCategoryListFirestoreData(
  List<CategoryStruct>? categorys,
) =>
    categorys?.map((e) => getCategoryFirestoreData(e, true)).toList() ?? [];
