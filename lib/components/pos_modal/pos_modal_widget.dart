import '/backend/schema/structs/index.dart';
import '/components/post_component/post_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'pos_modal_model.dart';
export 'pos_modal_model.dart';

class PosModalWidget extends StatefulWidget {
  const PosModalWidget({
    super.key,
    required this.post,
  });

  final PostStruct? post;

  @override
  State<PosModalWidget> createState() => _PosModalWidgetState();
}

class _PosModalWidgetState extends State<PosModalWidget> {
  late PosModalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PosModalModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: const AlignmentDirectional(-1.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(6.0, 4.0, 0.0, 0.0),
              child: FlutterFlowIconButton(
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 24.0,
                ),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(6.0, 6.0, 6.0, 6.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(18.0),
                  shape: BoxShape.rectangle,
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(6.0, 6.0, 6.0, 6.0),
                  child: wrapWithModel(
                    model: _model.postComponentModel,
                    updateCallback: () => setState(() {}),
                    child: PostComponentWidget(
                      post: widget.post!,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
