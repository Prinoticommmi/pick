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

Future<List<String>> updateCategoryStatus(
  String cat,
  List<CategoryStruct> appStateCatStatus,
) async {
  // Add your function code here!

  if (cat == 'Tutti') {
    for (CategoryStruct c in appStateCatStatus) {
      c.active = true;
    }
  } else {
    for (CategoryStruct c in appStateCatStatus) {
      if (c.name == cat) {
        c.active = (!c.active);
      }
    }
  }
  ;

  List<String> activeCats = [];

  for (CategoryStruct c in appStateCatStatus) {
    if (c.name != 'Tutti' && c.active) {
      activeCats.add(c.name);
    }
  }

  return activeCats;
}
