import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/vote_count/vote_count_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:octo_image/octo_image.dart';
import 'post_component_model.dart';
export 'post_component_model.dart';

class PostComponentWidget extends StatefulWidget {
  const PostComponentWidget({
    super.key,
    required this.post,
  });

  final PostStruct? post;

  @override
  State<PostComponentWidget> createState() => _PostComponentWidgetState();
}

class _PostComponentWidgetState extends State<PostComponentWidget> {
  late PostComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.post = widget.post;
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
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    width: 100.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  child: FlutterFlowExpandedImageView(
                                    image: OctoImage(
                                      placeholderBuilder: (_) =>
                                          SizedBox.expand(
                                        child: Image(
                                          image: BlurHashImage(
                                              widget.post!.photosHash[0]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      image: NetworkImage(
                                        widget.post!.photos[0],
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                    allowRotation: false,
                                    tag: widget.post!.photos[0],
                                    useHeroAnimation: true,
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: widget.post!.photos[0],
                              transitionOnUserGestures: true,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: OctoImage(
                                  placeholderBuilder: (_) => SizedBox.expand(
                                    child: Image(
                                      image: BlurHashImage(
                                          widget.post!.photosHash[0]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  image: NetworkImage(
                                    widget.post!.photos[0],
                                  ),
                                  width: 300.0,
                                  height: 100.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (widget.post?.isVoted ?? true)
                          wrapWithModel(
                            model: _model.voteCountModel1,
                            updateCallback: () => setState(() {}),
                            child: VoteCountWidget(
                              picNumber: 0,
                              post: widget.post!,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 100.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  child: FlutterFlowExpandedImageView(
                                    image: OctoImage(
                                      placeholderBuilder: (_) =>
                                          SizedBox.expand(
                                        child: Image(
                                          image: BlurHashImage(
                                              widget.post!.photosHash[1]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      image: NetworkImage(
                                        widget.post!.photos[1],
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                    allowRotation: false,
                                    tag: widget.post!.photos[1],
                                    useHeroAnimation: true,
                                  ),
                                ),
                              );
                            },
                            onDoubleTap: () async {
                              await action_blocks.vote(
                                context,
                                index: 0,
                              );
                              setState(() {});
                            },
                            child: Hero(
                              tag: widget.post!.photos[1],
                              transitionOnUserGestures: true,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: OctoImage(
                                  placeholderBuilder: (_) => SizedBox.expand(
                                    child: Image(
                                      image: BlurHashImage(
                                          widget.post!.photosHash[1]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  image: NetworkImage(
                                    widget.post!.photos[1],
                                  ),
                                  width: 300.0,
                                  height: 100.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (widget.post?.isVoted ?? true)
                          wrapWithModel(
                            model: _model.voteCountModel2,
                            updateCallback: () => setState(() {}),
                            child: VoteCountWidget(
                              picNumber: 1,
                              post: widget.post!,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ]
                  .divide(const SizedBox(width: 8.0))
                  .addToStart(const SizedBox(width: 4.0))
                  .addToEnd(const SizedBox(width: 4.0)),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    width: 100.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  child: FlutterFlowExpandedImageView(
                                    image: OctoImage(
                                      placeholderBuilder: (_) =>
                                          SizedBox.expand(
                                        child: Image(
                                          image: BlurHashImage(
                                              widget.post!.photosHash[2]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      image: NetworkImage(
                                        widget.post!.photos[2],
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                    allowRotation: false,
                                    tag: widget.post!.photos[2],
                                    useHeroAnimation: true,
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: widget.post!.photos[2],
                              transitionOnUserGestures: true,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: OctoImage(
                                  placeholderBuilder: (_) => SizedBox.expand(
                                    child: Image(
                                      image: BlurHashImage(
                                          widget.post!.photosHash[2]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  image: NetworkImage(
                                    widget.post!.photos[2],
                                  ),
                                  width: 300.0,
                                  height: 100.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (widget.post?.isVoted ?? true)
                          wrapWithModel(
                            model: _model.voteCountModel3,
                            updateCallback: () => setState(() {}),
                            child: VoteCountWidget(
                              picNumber: 2,
                              post: widget.post!,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 100.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  child: FlutterFlowExpandedImageView(
                                    image: OctoImage(
                                      placeholderBuilder: (_) =>
                                          SizedBox.expand(
                                        child: Image(
                                          image: BlurHashImage(
                                              widget.post!.photosHash[3]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      image: NetworkImage(
                                        widget.post!.photos[3],
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                    allowRotation: false,
                                    tag: widget.post!.photos[3],
                                    useHeroAnimation: true,
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: widget.post!.photos[3],
                              transitionOnUserGestures: true,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: OctoImage(
                                  placeholderBuilder: (_) => SizedBox.expand(
                                    child: Image(
                                      image: BlurHashImage(
                                          widget.post!.photosHash[3]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  image: NetworkImage(
                                    widget.post!.photos[3],
                                  ),
                                  width: 300.0,
                                  height: 100.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (widget.post?.isVoted ?? true)
                          wrapWithModel(
                            model: _model.voteCountModel4,
                            updateCallback: () => setState(() {}),
                            child: VoteCountWidget(
                              picNumber: 3,
                              post: widget.post!,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ]
                  .divide(const SizedBox(width: 8.0))
                  .addToStart(const SizedBox(width: 4.0))
                  .addToEnd(const SizedBox(width: 4.0)),
            ),
          ),
        ]
            .divide(const SizedBox(height: 8.0))
            .addToStart(const SizedBox(height: 4.0))
            .addToEnd(const SizedBox(height: 4.0)),
      ),
    );
  }
}
