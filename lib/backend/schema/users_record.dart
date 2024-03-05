import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "user_bio" field.
  String? _userBio;
  String get userBio => _userBio ?? '';
  bool hasUserBio() => _userBio != null;

  // "year_of_birth" field.
  String? _yearOfBirth;
  String get yearOfBirth => _yearOfBirth ?? '';
  bool hasYearOfBirth() => _yearOfBirth != null;

  // "photo_url_blur_hash" field.
  String? _photoUrlBlurHash;
  String get photoUrlBlurHash => _photoUrlBlurHash ?? '';
  bool hasPhotoUrlBlurHash() => _photoUrlBlurHash != null;

  // "following" field.
  int? _following;
  int get following => _following ?? 0;
  bool hasFollowing() => _following != null;

  // "followers" field.
  int? _followers;
  int get followers => _followers ?? 0;
  bool hasFollowers() => _followers != null;

  // "posts" field.
  int? _posts;
  int get posts => _posts ?? 0;
  bool hasPosts() => _posts != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _userBio = snapshotData['user_bio'] as String?;
    _yearOfBirth = snapshotData['year_of_birth'] as String?;
    _photoUrlBlurHash = snapshotData['photo_url_blur_hash'] as String?;
    _following = castToType<int>(snapshotData['following']);
    _followers = castToType<int>(snapshotData['followers']);
    _posts = castToType<int>(snapshotData['posts']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? userBio,
  String? yearOfBirth,
  String? photoUrlBlurHash,
  int? following,
  int? followers,
  int? posts,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'user_bio': userBio,
      'year_of_birth': yearOfBirth,
      'photo_url_blur_hash': photoUrlBlurHash,
      'following': following,
      'followers': followers,
      'posts': posts,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.userBio == e2?.userBio &&
        e1?.yearOfBirth == e2?.yearOfBirth &&
        e1?.photoUrlBlurHash == e2?.photoUrlBlurHash &&
        e1?.following == e2?.following &&
        e1?.followers == e2?.followers &&
        e1?.posts == e2?.posts;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.userBio,
        e?.yearOfBirth,
        e?.photoUrlBlurHash,
        e?.following,
        e?.followers,
        e?.posts
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
