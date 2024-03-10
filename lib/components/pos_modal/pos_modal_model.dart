import '/components/post_component/post_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'pos_modal_widget.dart' show PosModalWidget;
import 'package:flutter/material.dart';

class PosModalModel extends FlutterFlowModel<PosModalWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for postComponent component.
  late PostComponentModel postComponentModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    postComponentModel = createModel(context, () => PostComponentModel());
  }

  @override
  void dispose() {
    postComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
