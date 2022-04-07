import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key key}) : super(key: key);

  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  TextEditingController edtNickNameController;
  TextEditingController edtPollPeriodController;
  TextEditingController edtServerLinkController;
  bool swPollModeValue;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    edtNickNameController = TextEditingController(text: FFAppState().NickName);
    edtPollPeriodController = TextEditingController(
        text: formatNumber(
      FFAppState().PollPeriod,
      formatType: FormatType.custom,
      format: '#0',
      locale: '',
    ));
    edtServerLinkController =
        TextEditingController(text: FFAppState().ServerLink);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Settings',
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: InkWell(
            onTap: () async {
              setState(
                  () => FFAppState().ServerLink = edtServerLinkController.text);
              setState(() => FFAppState().PollingMode = swPollModeValue);
              setState(() => FFAppState().PollPeriod =
                  int.parse(edtNickNameController.text));
            },
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                          child: TextFormField(
                            onChanged: (_) => EasyDebounce.debounce(
                              'edtServerLinkController',
                              Duration(milliseconds: 50),
                              () => setState(() {}),
                            ),
                            controller: edtServerLinkController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Nexus Server Link',
                              hintText: FFAppState().defaultServerLink,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              filled: true,
                              suffixIcon: edtServerLinkController
                                      .text.isNotEmpty
                                  ? InkWell(
                                      onTap: () => setState(
                                        () => edtServerLinkController.clear(),
                                      ),
                                      child: Icon(
                                        Icons.clear,
                                        color: Color(0xFF757575),
                                        size: 22,
                                      ),
                                    )
                                  : null,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Poppins',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Server Link missing or invalid';
                              }
                              if (val.length < 10) {
                                return 'Valid Server Link required';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                          child: SwitchListTile(
                            value: swPollModeValue ??= FFAppState().PollingMode,
                            onChanged: (newValue) =>
                                setState(() => swPollModeValue = newValue),
                            title: Text(
                              'Poll server continuously',
                              textAlign: TextAlign.end,
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                            tileColor: Color(0xFFF5F5F5),
                            dense: false,
                            controlAffinity: ListTileControlAffinity.trailing,
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                            child: TextFormField(
                              onChanged: (_) => EasyDebounce.debounce(
                                'edtPollPeriodController',
                                Duration(milliseconds: 50),
                                () => setState(() {}),
                              ),
                              controller: edtPollPeriodController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Poll Interval [Seconds]',
                                hintText: 'Numeric interval [sec] > 0',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: true,
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                              textAlign: TextAlign.end,
                              keyboardType: TextInputType.number,
                              validator: (val) {
                                if (val.isEmpty) {
                                  return 'Field is required';
                                }
                                if (val.length < 1) {
                                  return 'Interval must be greater then Null';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                          child: TextFormField(
                            onChanged: (_) => EasyDebounce.debounce(
                              'edtNickNameController',
                              Duration(milliseconds: 50),
                              () => setState(() {}),
                            ),
                            controller: edtNickNameController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Nick Name',
                              hintText: 'Enter your Nickname',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              filled: true,
                              suffixIcon: edtNickNameController.text.isNotEmpty
                                  ? InkWell(
                                      onTap: () => setState(
                                        () => edtNickNameController.clear(),
                                      ),
                                      child: Icon(
                                        Icons.clear,
                                        color: Color(0xFF757575),
                                        size: 22,
                                      ),
                                    )
                                  : null,
                            ),
                            style: FlutterFlowTheme.of(context).bodyText1,
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Nick Name missing or to short';
                              }
                              if (val.length < 3) {
                                return 'Nickname must be at least 3 Chars long';
                              }
                              return null;
                            },
                          ),
                        ),
                        if (functions.validateSettings(
                                edtServerLinkController.text,
                                int.parse(edtPollPeriodController.text),
                                edtNickNameController.text) ??
                            true)
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 30, 0, 20),
                            child: FFButtonWidget(
                              onPressed: () async {
                                if ((edtServerLinkController.text) == '') {
                                  setState(() => FFAppState().ServerLink =
                                      FFAppState().defaultServerLink);
                                } else {
                                  setState(() => FFAppState().ServerLink =
                                      edtServerLinkController.text);
                                }

                                setState(() =>
                                    FFAppState().PollingMode = swPollModeValue);
                                if ((edtPollPeriodController.text) == '') {
                                  setState(() => FFAppState().PollPeriod = 5);
                                } else {
                                  setState(() => FFAppState().PollPeriod =
                                      int.parse(edtPollPeriodController.text));
                                }

                                if ((edtNickNameController.text) == '') {
                                  setState(() => FFAppState().NickName =
                                      FFAppState().defaultNickName);
                                } else {
                                  setState(() => FFAppState().NickName =
                                      edtNickNameController.text);
                                }

                                await Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        NavBarPage(initialPage: 'HomePage'),
                                  ),
                                  (r) => false,
                                );
                              },
                              text: 'Save Settings',
                              options: FFButtonOptions(
                                width: 130,
                                height: 40,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 12,
                              ),
                            ),
                          ),
                        Divider(
                          thickness: 1,
                          indent: 20,
                          endIndent: 20,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Image.asset(
                          'assets/images/Logo_TriColor_WhiteBack_200407-SBR-01.png',
                          width: 50,
                          height: 75,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        'Nexus Messenger',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: Text(
                          'Version 1.3.0.3',
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context).bodyText2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
