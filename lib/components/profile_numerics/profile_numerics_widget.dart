import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'profile_numerics_model.dart';
export 'profile_numerics_model.dart';

class ProfileNumericsWidget extends StatefulWidget {
  const ProfileNumericsWidget({
    super.key,
    this.name,
    this.follow,
    required this.parameter3,
    this.posts,
    this.followers,
    this.following,
    required this.parameter4,
  });

  final String? name;
  final bool? follow;
  final DocumentReference? parameter3;
  final int? posts;
  final int? followers;
  final int? following;
  final DocumentReference? parameter4;

  @override
  State<ProfileNumericsWidget> createState() => _ProfileNumericsWidgetState();
}

class _ProfileNumericsWidgetState extends State<ProfileNumericsWidget> {
  late ProfileNumericsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileNumericsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.followers = widget.followers!;
      });
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                child: Text(
                  widget.name!,
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).headlineSmall,
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  if (widget.follow!) {
                    // Follow
                    await widget.parameter4!.delete();
                    setState(() {
                      _model.followers = _model.followers + -1;
                    });
                    unawaited(
                      () async {
                        await widget.parameter3!.update({
                          ...mapToFirestore(
                            {
                              'followers': FieldValue.increment(-(1)),
                            },
                          ),
                        });
                      }(),
                    );
                    unawaited(
                      () async {
                        await currentUserReference!.update({
                          ...mapToFirestore(
                            {
                              'following': FieldValue.increment(-(1)),
                            },
                          ),
                        });
                      }(),
                    );
                    return;
                  } else {
                    // Unfollow

                    await FollowersRecord.collection
                        .doc()
                        .set(createFollowersRecordData(
                          follower: currentUserReference,
                          tmst: getCurrentTimestamp,
                          followed: widget.parameter3,
                        ));
                    setState(() {
                      _model.followers = _model.followers + 1;
                    });
                    unawaited(
                      () async {
                        await widget.parameter3!.update({
                          ...mapToFirestore(
                            {
                              'followers': FieldValue.increment(1),
                            },
                          ),
                        });
                      }(),
                    );
                    unawaited(
                      () async {
                        await currentUserReference!.update({
                          ...mapToFirestore(
                            {
                              'following': FieldValue.increment(1),
                            },
                          ),
                        });
                      }(),
                    );
                    return;
                  }
                },
                text: widget.follow! ? 'Unfoll.' : 'Foll.',
                options: FFButtonOptions(
                  padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                  elevation: 3.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  widget.posts!.toString(),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Text(
                  'Posts',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  _model.followers.toString(),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Text(
                  'Followers',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  valueOrDefault<String>(
                    widget.following?.toString(),
                    '0',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Text(
                  'Following',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
