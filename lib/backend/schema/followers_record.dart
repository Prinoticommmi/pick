import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class FollowersRecord extends FirestoreRecord {
  FollowersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "follower" field.
  DocumentReference? _follower;
  DocumentReference? get follower => _follower;
  bool hasFollower() => _follower != null;

  // "tmst" field.
  DateTime? _tmst;
  DateTime? get tmst => _tmst;
  bool hasTmst() => _tmst != null;

  // "followed" field.
  DocumentReference? _followed;
  DocumentReference? get followed => _followed;
  bool hasFollowed() => _followed != null;

  void _initializeFields() {
    _follower = snapshotData['follower'] as DocumentReference?;
    _tmst = snapshotData['tmst'] as DateTime?;
    _followed = snapshotData['followed'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('followers');

  static Stream<FollowersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FollowersRecord.fromSnapshot(s));

  static Future<FollowersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FollowersRecord.fromSnapshot(s));

  static FollowersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FollowersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FollowersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FollowersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FollowersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FollowersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFollowersRecordData({
  DocumentReference? follower,
  DateTime? tmst,
  DocumentReference? followed,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'follower': follower,
      'tmst': tmst,
      'followed': followed,
    }.withoutNulls,
  );

  return firestoreData;
}

class FollowersRecordDocumentEquality implements Equality<FollowersRecord> {
  const FollowersRecordDocumentEquality();

  @override
  bool equals(FollowersRecord? e1, FollowersRecord? e2) {
    return e1?.follower == e2?.follower &&
        e1?.tmst == e2?.tmst &&
        e1?.followed == e2?.followed;
  }

  @override
  int hash(FollowersRecord? e) =>
      const ListEquality().hash([e?.follower, e?.tmst, e?.followed]);

  @override
  bool isValidKey(Object? o) => o is FollowersRecord;
}
