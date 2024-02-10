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

  // "User" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "Datetime_following" field.
  DateTime? _datetimeFollowing;
  DateTime? get datetimeFollowing => _datetimeFollowing;
  bool hasDatetimeFollowing() => _datetimeFollowing != null;

  // "Following" field.
  DocumentReference? _following;
  DocumentReference? get following => _following;
  bool hasFollowing() => _following != null;

  void _initializeFields() {
    _user = snapshotData['User'] as DocumentReference?;
    _datetimeFollowing = snapshotData['Datetime_following'] as DateTime?;
    _following = snapshotData['Following'] as DocumentReference?;
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
  DocumentReference? user,
  DateTime? datetimeFollowing,
  DocumentReference? following,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'User': user,
      'Datetime_following': datetimeFollowing,
      'Following': following,
    }.withoutNulls,
  );

  return firestoreData;
}

class FollowersRecordDocumentEquality implements Equality<FollowersRecord> {
  const FollowersRecordDocumentEquality();

  @override
  bool equals(FollowersRecord? e1, FollowersRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.datetimeFollowing == e2?.datetimeFollowing &&
        e1?.following == e2?.following;
  }

  @override
  int hash(FollowersRecord? e) =>
      const ListEquality().hash([e?.user, e?.datetimeFollowing, e?.following]);

  @override
  bool isValidKey(Object? o) => o is FollowersRecord;
}
