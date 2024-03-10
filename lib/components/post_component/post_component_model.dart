import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/vote_count/vote_count_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'post_component_widget.dart' show PostComponentWidget;
import 'package:flutter/material.dart';

class PostComponentModel extends FlutterFlowModel<PostComponentWidget> {
  ///  Local state fields for this component.

  PostStruct? post;
  void updatePostStruct(Function(PostStruct) updateFn) =>
      updateFn(post ??= PostStruct());

  ///  State fields for stateful widgets in this component.

  // Model for voteCount component.
  late VoteCountModel voteCountModel1;
  // Model for voteCount component.
  late VoteCountModel voteCountModel2;
  // Model for voteCount component.
  late VoteCountModel voteCountModel3;
  // Model for voteCount component.
  late VoteCountModel voteCountModel4;

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
    voteCountModel1.dispose();
    voteCountModel2.dispose();
    voteCountModel3.dispose();
    voteCountModel4.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
