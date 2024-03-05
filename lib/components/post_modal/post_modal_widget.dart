import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'post_modal_model.dart';
export 'post_modal_model.dart';

class PostModalWidget extends StatefulWidget {
  const PostModalWidget({
    super.key,
    required this.post,
  });

  final PostStruct? post;

  @override
  State<PostModalWidget> createState() => _PostModalWidgetState();
}

class _PostModalWidgetState extends State<PostModalWidget> {
  late PostModalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostModalModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container();
  }
}
