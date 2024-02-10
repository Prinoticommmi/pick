import '../database.dart';

class VotesTable extends SupabaseTable<VotesRow> {
  @override
  String get tableName => 'votes';

  @override
  VotesRow createRow(Map<String, dynamic> data) => VotesRow(data);
}

class VotesRow extends SupabaseDataRow {
  VotesRow(super.data);

  @override
  SupabaseTable get table => VotesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get postUserGuid => getField<String>('post_user_guid')!;
  set postUserGuid(String value) => setField<String>('post_user_guid', value);

  String get postVoterGuid => getField<String>('post_voter_guid')!;
  set postVoterGuid(String value) => setField<String>('post_voter_guid', value);

  int get photoIndex => getField<int>('photo_index')!;
  set photoIndex(int value) => setField<int>('photo_index', value);

  String get photoUrl => getField<String>('photo_url')!;
  set photoUrl(String value) => setField<String>('photo_url', value);

  int? get idPost => getField<int>('id_post');
  set idPost(int? value) => setField<int>('id_post', value);
}
