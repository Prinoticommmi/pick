import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostsRecord extends FirestoreRecord {
  PostsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "post_description" field.
  String? _postDescription;
  String get postDescription => _postDescription ?? '';
  bool hasPostDescription() => _postDescription != null;

  // "post_user" field.
  DocumentReference? _postUser;
  DocumentReference? get postUser => _postUser;
  bool hasPostUser() => _postUser != null;

  // "time_posted" field.
  DateTime? _timePosted;
  DateTime? get timePosted => _timePosted;
  bool hasTimePosted() => _timePosted != null;

  // "num_comments" field.
  int? _numComments;
  int get numComments => _numComments ?? 0;
  bool hasNumComments() => _numComments != null;

  // "num_votes" field.
  List<int>? _numVotes;
  List<int> get numVotes => _numVotes ?? const [];
  bool hasNumVotes() => _numVotes != null;

  // "post_photos" field.
  List<String>? _postPhotos;
  List<String> get postPhotos => _postPhotos ?? const [];
  bool hasPostPhotos() => _postPhotos != null;

  // "post_photos_blur_hash" field.
  List<String>? _postPhotosBlurHash;
  List<String> get postPhotosBlurHash => _postPhotosBlurHash ?? const [];
  bool hasPostPhotosBlurHash() => _postPhotosBlurHash != null;

  void _initializeFields() {
    _postDescription = snapshotData['post_description'] as String?;
    _postUser = snapshotData['post_user'] as DocumentReference?;
    _timePosted = snapshotData['time_posted'] as DateTime?;
    _numComments = castToType<int>(snapshotData['num_comments']);
    _numVotes = getDataList(snapshotData['num_votes']);
    _postPhotos = getDataList(snapshotData['post_photos']);
    _postPhotosBlurHash = getDataList(snapshotData['post_photos_blur_hash']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostsRecord.fromSnapshot(s));

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostsRecord.fromSnapshot(s));

  static PostsRecord fromSnapshot(DocumentSnapshot snapshot) => PostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostsRecordData({
  String? postDescription,
  DocumentReference? postUser,
  DateTime? timePosted,
  int? numComments,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'post_description': postDescription,
      'post_user': postUser,
      'time_posted': timePosted,
      'num_comments': numComments,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostsRecordDocumentEquality implements Equality<PostsRecord> {
  const PostsRecordDocumentEquality();

  @override
  bool equals(PostsRecord? e1, PostsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.postDescription == e2?.postDescription &&
        e1?.postUser == e2?.postUser &&
        e1?.timePosted == e2?.timePosted &&
        e1?.numComments == e2?.numComments &&
        listEquality.equals(e1?.numVotes, e2?.numVotes) &&
        listEquality.equals(e1?.postPhotos, e2?.postPhotos) &&
        listEquality.equals(e1?.postPhotosBlurHash, e2?.postPhotosBlurHash);
  }

  @override
  int hash(PostsRecord? e) => const ListEquality().hash([
        e?.postDescription,
        e?.postUser,
        e?.timePosted,
        e?.numComments,
        e?.numVotes,
        e?.postPhotos,
        e?.postPhotosBlurHash
      ]);

  @override
  bool isValidKey(Object? o) => o is PostsRecord;
}
