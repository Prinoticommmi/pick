import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/components/vote_count/vote_count_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  String? aa;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - newPost] action in HomePage widget.
  PostsRow? newPost;
  // Stores action output result for [Custom Action - getUserDocRefFromString] action in HomePage widget.
  DocumentReference? postUserRef;
  // Stores action output result for [Backend Call - Read Document] action in HomePage widget.
  UsersRecord? postUser;
  // Stores action output result for [Custom Action - updateCategoryStatus] action in Card widget.
  List<String>? catList;
  // Stores action output result for [Custom Action - getUserDocRefFromString] action in Container widget.
  DocumentReference? postUserRefProfile;
  // Model for voteCount component.
  late VoteCountModel voteCountModel1;
  // Model for voteCount component.
  late VoteCountModel voteCountModel2;
  // Model for voteCount component.
  late VoteCountModel voteCountModel3;
  // Model for voteCount component.
  late VoteCountModel voteCountModel4;
  // Stores action output result for [Custom Action - newPost] action in Button widget.
  PostsRow? newPostBtn;
  // Stores action output result for [Custom Action - getUserDocRefFromString] action in Button widget.
  DocumentReference? postUserRefBtn;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? postUserBtn;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    voteCountModel1 = createModel(context, () => VoteCountModel());
    voteCountModel2 = createModel(context, () => VoteCountModel());
    voteCountModel3 = createModel(context, () => VoteCountModel());
    voteCountModel4 = createModel(context, () => VoteCountModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    voteCountModel1.dispose();
    voteCountModel2.dispose();
    voteCountModel3.dispose();
    voteCountModel4.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
