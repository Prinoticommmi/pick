import '/backend/supabase/supabase.dart';
import '/components/profile_numerics/profile_numerics_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  Local state fields for this page.

  int followers = 0;

  int following = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for profileNumerics component.
  late ProfileNumericsModel profileNumericsModel;
  // Stores action output result for [Backend Call - Query Rows] action in Image widget.
  List<VotesRow>? vote;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    profileNumericsModel = createModel(context, () => ProfileNumericsModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    profileNumericsModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
