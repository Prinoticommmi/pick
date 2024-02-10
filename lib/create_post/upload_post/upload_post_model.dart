import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'upload_post_widget.dart' show UploadPostWidget;
import 'package:flutter/material.dart';

class UploadPostModel extends FlutterFlowModel<UploadPostWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Question widget.
  FocusNode? questionFocusNode;
  TextEditingController? questionController;
  String? Function(BuildContext, String?)? questionControllerValidator;
  // State field(s) for Category widget.
  String? categoryValue;
  FormFieldController<String>? categoryValueController;
  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    questionFocusNode?.dispose();
    questionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
