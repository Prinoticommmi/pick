import '../database.dart';

class PostsTable extends SupabaseTable<PostsRow> {
  @override
  String get tableName => 'posts';

  @override
  PostsRow createRow(Map<String, dynamic> data) => PostsRow(data);
}

class PostsRow extends SupabaseDataRow {
  PostsRow(super.data);

  @override
  SupabaseTable get table => PostsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get userGuid => getField<String>('user_guid')!;
  set userGuid(String value) => setField<String>('user_guid', value);

  int? get nComments => getField<int>('n_comments');
  set nComments(int? value) => setField<int>('n_comments', value);

  List<int> get votes => getListField<int>('votes');
  set votes(List<int>? value) => setListField<int>('votes', value);

  List<String> get photos => getListField<String>('photos');
  set photos(List<String> value) => setListField<String>('photos', value);

  List<String> get photosBlurHash => getListField<String>('photos_blur_hash');
  set photosBlurHash(List<String> value) =>
      setListField<String>('photos_blur_hash', value);

  String get category => getField<String>('category')!;
  set category(String value) => setField<String>('category', value);

  String get description => getField<String>('description')!;
  set description(String value) => setField<String>('description', value);
}
