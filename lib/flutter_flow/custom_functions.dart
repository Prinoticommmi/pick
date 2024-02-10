import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/auth/firebase_auth/auth_util.dart';

PostsRecord selectRandomPost(List<PostsRecord> postList) {
  return postList[math.Random().nextInt(postList.length)];
}

List<int> updateVotes(
  List<int> votes,
  int index,
) {
  votes[index] = votes[index] + 1;
  return votes;
}

int mostVotedPic(PostsRecord post) {
  List<int> voteList = post.numVotes;
  var maxIndex = 0;
  var maxValue = 0;

  for (var i = 0; i < voteList.length; i++) {
    if (voteList[i] > maxValue) {
      maxIndex = i;
      maxValue = voteList[i];
    }
  }

  return maxIndex;
}
