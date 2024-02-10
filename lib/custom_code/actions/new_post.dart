// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math' as math;

Future<PostsRow?> newPost(
  String user,
  List<String> category,
) async {
  // Add your function code here!
  final supabase = SupaFlow.client;
  final data = await supabase
      .rpc('unvotedposts', params: {'auth_user': user, 'cat': category});
  if (data.length == 0) {
    debugPrint('Is Null');
    return null;
  }

  return PostsRow(data[math.Random().nextInt(data.length)]);
}
