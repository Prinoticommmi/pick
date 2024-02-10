import '/auth/firebase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';

Future vote(
  BuildContext context, {
  int? index,
}) async {
  if (FFAppState().post.isVoted) {
    return;
  }

  await PostsTable().update(
    data: {
      'votes': functions.updateVotes(FFAppState().post.votes.toList(), index!),
    },
    matchingRows: (rows) => rows.eq(
      'id',
      FFAppState().post.id,
    ),
  );
  await VotesTable().insert({
    'post_user_guid': FFAppState().post.id.toString(),
    'post_voter_guid': currentUserReference?.id,
    'photo_index': index,
    'photo_url': FFAppState().post.photos[index],
    'id_post': FFAppState().post.id,
  });
  FFAppState().updatePostStruct(
    (e) => e
      ..votes = functions
          .updateVotes(FFAppState().post.votes.toList(), index)
          .toList()
      ..isVoted = true,
  );
  return;
}
