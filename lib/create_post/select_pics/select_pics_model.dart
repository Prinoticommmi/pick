import '/flutter_flow/flutter_flow_util.dart';
import 'select_pics_widget.dart' show SelectPicsWidget;
import 'package:flutter/material.dart';

class SelectPicsModel extends FlutterFlowModel<SelectPicsWidget> {
  ///  Local state fields for this page.

  List<FFUploadedFile> uploadedPics = [];
  void addToUploadedPics(FFUploadedFile item) => uploadedPics.add(item);
  void removeFromUploadedPics(FFUploadedFile item) => uploadedPics.remove(item);
  void removeAtIndexFromUploadedPics(int index) => uploadedPics.removeAt(index);
  void insertAtIndexInUploadedPics(int index, FFUploadedFile item) =>
      uploadedPics.insert(index, item);
  void updateUploadedPicsAtIndex(
          int index, Function(FFUploadedFile) updateFn) =>
      uploadedPics[index] = updateFn(uploadedPics[index]);

  bool picUploaded = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  Future photoOrder(BuildContext context) async {}

  /// Additional helper methods are added here.
}
