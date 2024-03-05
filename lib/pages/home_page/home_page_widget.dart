import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().post.isFetched) {
        return;
      }

      _model.newPost = await actions.newPost(
        currentUserReference!.id,
        FFAppState().activeCategories.toList(),
      );
      if (_model.newPost == null) {
        setState(() {
          FFAppState().post = PostStruct.fromSerializableMap(
              jsonDecode('{"photos":"[]","votes":"[]"}'));
        });
        return;
      } else {
        _model.postUserRef = await actions.getUserDocRefFromString(
          _model.newPost!.userGuid,
        );
        _model.postUser =
            await UsersRecord.getDocumentOnce(_model.postUserRef!);
        setState(() {
          FFAppState().updatePostStruct(
            (e) => e
              ..isFetched = true
              ..id = _model.newPost?.id
              ..photos = _model.newPost!.photos.toList()
              ..category = _model.newPost?.category
              ..description = _model.newPost?.description
              ..votes = _model.newPost!.votes.toList()
              ..nComments = _model.newPost?.nComments
              ..userUid = _model.postUserRef
              ..username = _model.postUser?.displayName
              ..userProfilePic = _model.postUser?.photoUrl
              ..userProfilePicHash = _model.postUser?.photoUrlBlurHash,
          );
        });
        return;
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: false,
            title: Text(
              'Pick',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Outfit',
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
            ),
            actions: const [],
            centerTitle: false,
            elevation: 2.0,
          ),
          body: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondary,
                  ),
                  child: Builder(
                    builder: (context) {
                      final cat = functions.categoryList().toList();
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        itemCount: cat.length,
                        itemBuilder: (context, catIndex) {
                          final catItem = cat[catIndex];
                          return Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.catList =
                                    await actions.updateCategoryStatus(
                                  catItem,
                                  FFAppState().categoryStatus.toList(),
                                );
                                setState(() {
                                  FFAppState().activeCategories =
                                      _model.catList!.toList().cast<String>();
                                });

                                setState(() {});
                              },
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: functions.getCategoryStatus(catItem,
                                        FFAppState().categoryStatus.toList())
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                elevation: 4.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      6.0, 6.0, 6.0, 10.0),
                                  child: Text(
                                    catItem,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Builder(
                      builder: (context) {
                        if (FFAppState().post.isFetched) {
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.postUserRefProfile =
                                            await actions
                                                .getUserDocRefFromString(
                                          FFAppState().post.userUid!.id,
                                        );

                                        context.pushNamed(
                                          'Profile',
                                          queryParameters: {
                                            'userProfile': serializeParam(
                                              _model.postUserRefProfile,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );

                                        setState(() {});
                                      },
                                      child: Container(
                                        width: 100.0,
                                        height: 70.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              FFAppState().post.description,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(6.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                                child: OctoImage(
                                                  placeholderBuilder:
                                                      OctoPlaceholder.blurHash(
                                                    valueOrDefault<String>(
                                                      FFAppState()
                                                          .post
                                                          .userProfilePicHash,
                                                      'jdoceaoijcroecjerj',
                                                    ),
                                                  ),
                                                  image: NetworkImage(
                                                    valueOrDefault<String>(
                                                      FFAppState()
                                                          .post
                                                          .userProfilePic,
                                                      'https://picsum.photos/seed/752/600',
                                                    ),
                                                  ),
                                                  width: 60.0,
                                                  height: 60.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                width: 100.0,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        1.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          await Navigator.push(
                                                            context,
                                                            PageTransition(
                                                              type:
                                                                  PageTransitionType
                                                                      .fade,
                                                              child:
                                                                  FlutterFlowExpandedImageView(
                                                                image: Image
                                                                    .network(
                                                                  FFAppState()
                                                                      .post
                                                                      .photos[0],
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                                allowRotation:
                                                                    false,
                                                                tag: FFAppState()
                                                                    .post
                                                                    .photos[0],
                                                                useHeroAnimation:
                                                                    true,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        onDoubleTap: () async {
                                                          await action_blocks
                                                              .vote(
                                                            context,
                                                            index: 0,
                                                          );
                                                          setState(() {});
                                                        },
                                                        child: Hero(
                                                          tag: FFAppState()
                                                              .post
                                                              .photos[0],
                                                          transitionOnUserGestures:
                                                              true,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child:
                                                                Image.network(
                                                              FFAppState()
                                                                  .post
                                                                  .photos[0],
                                                              width: 300.0,
                                                              height: 100.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    if (FFAppState()
                                                        .post
                                                        .isVoted)
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                              const BoxDecoration(),
                                                          child: Visibility(
                                                            visible:
                                                                FFAppState()
                                                                    .post
                                                                    .isVoted,
                                                            child: Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Text(
                                                                FFAppState()
                                                                    .post
                                                                    .votes[0]
                                                                    .toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                width: 100.0,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        1.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          await Navigator.push(
                                                            context,
                                                            PageTransition(
                                                              type:
                                                                  PageTransitionType
                                                                      .fade,
                                                              child:
                                                                  FlutterFlowExpandedImageView(
                                                                image: Image
                                                                    .network(
                                                                  FFAppState()
                                                                      .post
                                                                      .photos[1],
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                                allowRotation:
                                                                    false,
                                                                tag: FFAppState()
                                                                    .post
                                                                    .photos[1],
                                                                useHeroAnimation:
                                                                    true,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        onDoubleTap: () async {
                                                          await action_blocks
                                                              .vote(
                                                            context,
                                                            index: 1,
                                                          );
                                                          setState(() {});
                                                        },
                                                        child: Hero(
                                                          tag: FFAppState()
                                                              .post
                                                              .photos[1],
                                                          transitionOnUserGestures:
                                                              true,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child:
                                                                Image.network(
                                                              FFAppState()
                                                                  .post
                                                                  .photos[1],
                                                              width: 300.0,
                                                              height: 200.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    if (FFAppState()
                                                        .post
                                                        .isVoted)
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                              const BoxDecoration(),
                                                          child: Visibility(
                                                            visible:
                                                                FFAppState()
                                                                    .post
                                                                    .isVoted,
                                                            child: Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Text(
                                                                FFAppState()
                                                                    .post
                                                                    .votes[1]
                                                                    .toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ),
                                                          ),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                width: 100.0,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        1.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Stack(
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await Navigator.push(
                                                          context,
                                                          PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child:
                                                                FlutterFlowExpandedImageView(
                                                              image:
                                                                  Image.network(
                                                                FFAppState()
                                                                    .post
                                                                    .photos[2],
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                              allowRotation:
                                                                  false,
                                                              tag: FFAppState()
                                                                  .post
                                                                  .photos[2],
                                                              useHeroAnimation:
                                                                  true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      onDoubleTap: () async {
                                                        await action_blocks
                                                            .vote(
                                                          context,
                                                          index: 2,
                                                        );
                                                        setState(() {});
                                                      },
                                                      child: Hero(
                                                        tag: FFAppState()
                                                            .post
                                                            .photos[2],
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            FFAppState()
                                                                .post
                                                                .photos[2],
                                                            width: 300.0,
                                                            height: 200.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    if (FFAppState()
                                                        .post
                                                        .isVoted)
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                              const BoxDecoration(),
                                                          child: Visibility(
                                                            visible:
                                                                FFAppState()
                                                                    .post
                                                                    .isVoted,
                                                            child: Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Text(
                                                                FFAppState()
                                                                    .post
                                                                    .votes[2]
                                                                    .toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                width: 100.0,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        1.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Stack(
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await Navigator.push(
                                                          context,
                                                          PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child:
                                                                FlutterFlowExpandedImageView(
                                                              image:
                                                                  Image.network(
                                                                FFAppState()
                                                                    .post
                                                                    .photos[3],
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                              allowRotation:
                                                                  false,
                                                              tag: FFAppState()
                                                                  .post
                                                                  .photos[3],
                                                              useHeroAnimation:
                                                                  true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      onDoubleTap: () async {
                                                        await action_blocks
                                                            .vote(
                                                          context,
                                                          index: 3,
                                                        );
                                                        setState(() {});
                                                      },
                                                      child: Hero(
                                                        tag: FFAppState()
                                                            .post
                                                            .photos[3],
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            FFAppState()
                                                                .post
                                                                .photos[3],
                                                            width: 300.0,
                                                            height: 200.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    if (FFAppState()
                                                        .post
                                                        .isVoted)
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                              const BoxDecoration(),
                                                          child: Visibility(
                                                            visible:
                                                                FFAppState()
                                                                    .post
                                                                    .isVoted,
                                                            child: Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Text(
                                                                FFAppState()
                                                                    .post
                                                                    .votes[3]
                                                                    .toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ),
                                                          ),
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
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 24.0),
                              child: Text(
                                'Nessun dato presente per la categoria selezionata ',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 16.0,
                                    ),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).tertiary,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 6.0, 5.0, 6.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              var shouldSetState = false;
                              _model.newPostBtn = await actions.newPost(
                                currentUserReference!.id,
                                FFAppState().activeCategories.toList(),
                              );
                              shouldSetState = true;
                              if (_model.newPostBtn == null) {
                                setState(() {
                                  FFAppState().post =
                                      PostStruct.fromSerializableMap(jsonDecode(
                                          '{"photos":"[]","votes":"[]"}'));
                                });
                                if (shouldSetState) setState(() {});
                                return;
                              } else {
                                _model.postUserRefBtn =
                                    await actions.getUserDocRefFromString(
                                  _model.newPostBtn!.userGuid,
                                );
                                shouldSetState = true;
                                _model.postUserBtn =
                                    await UsersRecord.getDocumentOnce(
                                        _model.postUserRefBtn!);
                                shouldSetState = true;
                                setState(() {
                                  FFAppState().updatePostStruct(
                                    (e) => e
                                      ..isFetched = true
                                      ..id = _model.newPostBtn?.id
                                      ..photos =
                                          _model.newPostBtn!.photos.toList()
                                      ..category = _model.newPostBtn?.category
                                      ..description =
                                          _model.newPostBtn?.description
                                      ..votes =
                                          _model.newPostBtn!.votes.toList()
                                      ..nComments = _model.newPostBtn?.nComments
                                      ..userUid = _model.postUserBtn?.reference
                                      ..username =
                                          _model.postUserBtn?.displayName
                                      ..userProfilePic =
                                          _model.postUserBtn?.photoUrl
                                      ..userProfilePicHash =
                                          _model.postUserBtn?.photoUrlBlurHash
                                      ..isVoted = false,
                                  );
                                });
                                if (shouldSetState) setState(() {});
                                return;
                              }

                              if (shouldSetState) setState(() {});
                            },
                            text: 'salta',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
