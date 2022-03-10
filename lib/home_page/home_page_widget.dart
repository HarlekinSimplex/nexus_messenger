import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../send_message/send_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((FFAppState().ServerLink) == '') {
        setState(
            () => FFAppState().ServerLink = FFAppState().defaultServerLink);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: NexsusServerGetCall.call(
        serverLink: FFAppState().ServerLink,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: Color(0xFFFF9933),
              ),
            ),
          );
        }
        final homePageNexsusServerGetResponse = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            automaticallyImplyLeading: false,
            title: Text(
              'Nexus Messenger',
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 22,
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 2,
          ),
          backgroundColor: Color(0xFFF5F5F5),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.bottomToTop,
                  duration: Duration(milliseconds: 300),
                  reverseDuration: Duration(milliseconds: 300),
                  child: SendMessageWidget(),
                ),
              );
            },
            backgroundColor: Color(0xFFFF9933),
            elevation: 8,
            child: Icon(
              Icons.add,
              color: FlutterFlowTheme.of(context).secondaryBackground,
              size: 30,
            ),
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Builder(
                builder: (context) {
                  final messages = getJsonField(
                        (homePageNexsusServerGetResponse?.jsonBody ?? ''),
                        r'''$''',
                      )?.toList() ??
                      [];
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: messages.length,
                    itemBuilder: (context, messagesIndex) {
                      final messagesItem = messages[messagesIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                offset: Offset(3, 3),
                              )
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      getJsonField(
                                        messagesItem,
                                        r'''$.from''',
                                      ).toString(),
                                      'Public Broadcast',
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 13,
                                        ),
                                  ),
                                  Text(
                                    getJsonField(
                                      messagesItem,
                                      r'''$.msg''',
                                    ).toString().maybeHandleOverflow(
                                          maxChars: 200,
                                          replacement: '…',
                                        ),
                                    style: FlutterFlowTheme.of(context)
                                        .title3
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 15,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 5),
                                    child: Text(
                                      getJsonField(
                                        messagesItem,
                                        r'''$.time''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 10,
                                          ),
                                    ),
                                  ),
                                ],
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
          ),
        );
      },
    );
  }
}
