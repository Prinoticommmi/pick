import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'vote_count_model.dart';
export 'vote_count_model.dart';

class VoteCountWidget extends StatefulWidget {
  const VoteCountWidget({
    super.key,
    int? picNumber,
    required this.post,
  }) : picNumber = picNumber ?? 0;

  final int picNumber;
  final PostStruct? post;

  @override
  State<VoteCountWidget> createState() => _VoteCountWidgetState();
}

class _VoteCountWidgetState extends State<VoteCountWidget> {
  late VoteCountModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VoteCountModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Stack(
        children: [
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Text(
              valueOrDefault<String>(
                (widget.post?.votes[widget.picNumber])?.toString(),
                '0',
              ),
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    fontFamily: 'Outfit',
                    fontSize: 42.0,
                    fontWeight: FontWeight.w900,
                  ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 0.0, 0.0),
              child: Text(
                valueOrDefault<String>(
                  (widget.post?.votes[widget.picNumber])?.toString(),
                  '5',
                ),
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      fontFamily: 'Outfit',
                      color: functions.mostVotedPic(widget.post!) ==
                              widget.picNumber
                          ? FlutterFlowTheme.of(context).success
                          : FlutterFlowTheme.of(context).accent2,
                      fontSize: 42.0,
                      fontWeight: FontWeight.w900,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
