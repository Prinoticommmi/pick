// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostStruct extends FFFirebaseStruct {
  PostStruct({
    bool? isFetched,
    bool? isVoted,
    int? id,
    DocumentReference? userUid,
    String? username,
    String? userProfilePic,
    String? userProfilePicHash,
    List<String>? photos,
    String? description,
    List<int>? votes,
    int? nComments,
    String? category,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _isFetched = isFetched,
        _isVoted = isVoted,
        _id = id,
        _userUid = userUid,
        _username = username,
        _userProfilePic = userProfilePic,
        _userProfilePicHash = userProfilePicHash,
        _photos = photos,
        _description = description,
        _votes = votes,
        _nComments = nComments,
        _category = category,
        super(firestoreUtilData);

  // "is_fetched" field.
  bool? _isFetched;
  bool get isFetched => _isFetched ?? false;
  set isFetched(bool? val) => _isFetched = val;
  bool hasIsFetched() => _isFetched != null;

  // "is_voted" field.
  bool? _isVoted;
  bool get isVoted => _isVoted ?? false;
  set isVoted(bool? val) => _isVoted = val;
  bool hasIsVoted() => _isVoted != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "user_uid" field.
  DocumentReference? _userUid;
  DocumentReference? get userUid => _userUid;
  set userUid(DocumentReference? val) => _userUid = val;
  bool hasUserUid() => _userUid != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  set username(String? val) => _username = val;
  bool hasUsername() => _username != null;

  // "user_profile_pic" field.
  String? _userProfilePic;
  String get userProfilePic => _userProfilePic ?? '';
  set userProfilePic(String? val) => _userProfilePic = val;
  bool hasUserProfilePic() => _userProfilePic != null;

  // "user_profile_pic_hash" field.
  String? _userProfilePicHash;
  String get userProfilePicHash => _userProfilePicHash ?? '';
  set userProfilePicHash(String? val) => _userProfilePicHash = val;
  bool hasUserProfilePicHash() => _userProfilePicHash != null;

  // "photos" field.
  List<String>? _photos;
  List<String> get photos => _photos ?? const [];
  set photos(List<String>? val) => _photos = val;
  void updatePhotos(Function(List<String>) updateFn) =>
      updateFn(_photos ??= []);
  bool hasPhotos() => _photos != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "votes" field.
  List<int>? _votes;
  List<int> get votes => _votes ?? const [];
  set votes(List<int>? val) => _votes = val;
  void updateVotes(Function(List<int>) updateFn) => updateFn(_votes ??= []);
  bool hasVotes() => _votes != null;

  // "n_comments" field.
  int? _nComments;
  int get nComments => _nComments ?? 0;
  set nComments(int? val) => _nComments = val;
  void incrementNComments(int amount) => _nComments = nComments + amount;
  bool hasNComments() => _nComments != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;
  bool hasCategory() => _category != null;

  static PostStruct fromMap(Map<String, dynamic> data) => PostStruct(
        isFetched: data['is_fetched'] as bool?,
        isVoted: data['is_voted'] as bool?,
        id: castToType<int>(data['id']),
        userUid: data['user_uid'] as DocumentReference?,
        username: data['username'] as String?,
        userProfilePic: data['user_profile_pic'] as String?,
        userProfilePicHash: data['user_profile_pic_hash'] as String?,
        photos: getDataList(data['photos']),
        description: data['description'] as String?,
        votes: getDataList(data['votes']),
        nComments: castToType<int>(data['n_comments']),
        category: data['category'] as String?,
      );

  static PostStruct? maybeFromMap(dynamic data) =>
      data is Map ? PostStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'is_fetched': _isFetched,
        'is_voted': _isVoted,
        'id': _id,
        'user_uid': _userUid,
        'username': _username,
        'user_profile_pic': _userProfilePic,
        'user_profile_pic_hash': _userProfilePicHash,
        'photos': _photos,
        'description': _description,
        'votes': _votes,
        'n_comments': _nComments,
        'category': _category,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'is_fetched': serializeParam(
          _isFetched,
          ParamType.bool,
        ),
        'is_voted': serializeParam(
          _isVoted,
          ParamType.bool,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'user_uid': serializeParam(
          _userUid,
          ParamType.DocumentReference,
        ),
        'username': serializeParam(
          _username,
          ParamType.String,
        ),
        'user_profile_pic': serializeParam(
          _userProfilePic,
          ParamType.String,
        ),
        'user_profile_pic_hash': serializeParam(
          _userProfilePicHash,
          ParamType.String,
        ),
        'photos': serializeParam(
          _photos,
          ParamType.String,
          true,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'votes': serializeParam(
          _votes,
          ParamType.int,
          true,
        ),
        'n_comments': serializeParam(
          _nComments,
          ParamType.int,
        ),
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
      }.withoutNulls;

  static PostStruct fromSerializableMap(Map<String, dynamic> data) =>
      PostStruct(
        isFetched: deserializeParam(
          data['is_fetched'],
          ParamType.bool,
          false,
        ),
        isVoted: deserializeParam(
          data['is_voted'],
          ParamType.bool,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        userUid: deserializeParam(
          data['user_uid'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        username: deserializeParam(
          data['username'],
          ParamType.String,
          false,
        ),
        userProfilePic: deserializeParam(
          data['user_profile_pic'],
          ParamType.String,
          false,
        ),
        userProfilePicHash: deserializeParam(
          data['user_profile_pic_hash'],
          ParamType.String,
          false,
        ),
        photos: deserializeParam<String>(
          data['photos'],
          ParamType.String,
          true,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        votes: deserializeParam<int>(
          data['votes'],
          ParamType.int,
          true,
        ),
        nComments: deserializeParam(
          data['n_comments'],
          ParamType.int,
          false,
        ),
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PostStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PostStruct &&
        isFetched == other.isFetched &&
        isVoted == other.isVoted &&
        id == other.id &&
        userUid == other.userUid &&
        username == other.username &&
        userProfilePic == other.userProfilePic &&
        userProfilePicHash == other.userProfilePicHash &&
        listEquality.equals(photos, other.photos) &&
        description == other.description &&
        listEquality.equals(votes, other.votes) &&
        nComments == other.nComments &&
        category == other.category;
  }

  @override
  int get hashCode => const ListEquality().hash([
        isFetched,
        isVoted,
        id,
        userUid,
        username,
        userProfilePic,
        userProfilePicHash,
        photos,
        description,
        votes,
        nComments,
        category
      ]);
}

PostStruct createPostStruct({
  bool? isFetched,
  bool? isVoted,
  int? id,
  DocumentReference? userUid,
  String? username,
  String? userProfilePic,
  String? userProfilePicHash,
  String? description,
  int? nComments,
  String? category,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PostStruct(
      isFetched: isFetched,
      isVoted: isVoted,
      id: id,
      userUid: userUid,
      username: username,
      userProfilePic: userProfilePic,
      userProfilePicHash: userProfilePicHash,
      description: description,
      nComments: nComments,
      category: category,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PostStruct? updatePostStruct(
  PostStruct? post, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    post
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPostStructData(
  Map<String, dynamic> firestoreData,
  PostStruct? post,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (post == null) {
    return;
  }
  if (post.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && post.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final postData = getPostFirestoreData(post, forFieldValue);
  final nestedData = postData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = post.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPostFirestoreData(
  PostStruct? post, [
  bool forFieldValue = false,
]) {
  if (post == null) {
    return {};
  }
  final firestoreData = mapToFirestore(post.toMap());

  // Add any Firestore field values
  post.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPostListFirestoreData(
  List<PostStruct>? posts,
) =>
    posts?.map((e) => getPostFirestoreData(e, true)).toList() ?? [];
