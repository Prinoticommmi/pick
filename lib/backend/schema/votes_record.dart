import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VotesRecord extends FirestoreRecord {
  VotesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "post" field.
  DocumentReference? _post;
  DocumentReference? get post => _post;
  bool hasPost() => _post != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "picture_index" field.
  int? _pictureIndex;
  int get pictureIndex => _pictureIndex ?? 0;
  bool hasPictureIndex() => _pictureIndex != null;

  // "datetime_added" field.
  DateTime? _datetimeAdded;
  DateTime? get datetimeAdded => _datetimeAdded;
  bool hasDatetimeAdded() => _datetimeAdded != null;

  void _initializeFields() {
    _post = snapshotData['post'] as DocumentReference?;
    _user = snapshotData['user'] as DocumentReference?;
    _pictureIndex = castToType<int>(snapshotData['picture_index']);
    _datetimeAdded = snapshotData['datetime_added'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('votes');

  static Stream<VotesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VotesRecord.fromSnapshot(s));

  static Future<VotesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VotesRecord.fromSnapshot(s));

  static VotesRecord fromSnapshot(DocumentSnapshot snapshot) => VotesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VotesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VotesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VotesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VotesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVotesRecordData({
  DocumentReference? post,
  DocumentReference? user,
  int? pictureIndex,
  DateTime? datetimeAdded,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'post': post,
      'user': user,
      'picture_index': pictureIndex,
      'datetime_added': datetimeAdded,
    }.withoutNulls,
  );

  return firestoreData;
}

class VotesRecordDocumentEquality implements Equality<VotesRecord> {
  const VotesRecordDocumentEquality();

  @override
  bool equals(VotesRecord? e1, VotesRecord? e2) {
    return e1?.post == e2?.post &&
        e1?.user == e2?.user &&
        e1?.pictureIndex == e2?.pictureIndex &&
        e1?.datetimeAdded == e2?.datetimeAdded;
  }

  @override
  int hash(VotesRecord? e) => const ListEquality()
      .hash([e?.post, e?.user, e?.pictureIndex, e?.datetimeAdded]);

  @override
  bool isValidKey(Object? o) => o is VotesRecord;
}
