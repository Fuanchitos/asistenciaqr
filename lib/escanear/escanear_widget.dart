import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'escanear_model.dart';
export 'escanear_model.dart';

class EscanearWidget extends StatefulWidget {
  const EscanearWidget({
    super.key,
    this.qrRef,
  });

  final AsistenciasRecord? qrRef;

  @override
  State<EscanearWidget> createState() => _EscanearWidgetState();
}

class _EscanearWidgetState extends State<EscanearWidget> {
  late EscanearModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EscanearModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<AsistenciasRecord>>(
      stream: queryAsistenciasRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<AsistenciasRecord> escanearAsistenciasRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final escanearAsistenciasRecord =
            escanearAsistenciasRecordList.isNotEmpty
                ? escanearAsistenciasRecordList.first
                : null;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: responsiveVisibility(
              context: context,
              tablet: false,
              tabletLandscape: false,
              desktop: false,
            )
                ? AppBar(
                    backgroundColor: FlutterFlowTheme.of(context).primaryText,
                    automaticallyImplyLeading: false,
                    leading: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        context.pushNamed('Menu');
                      },
                    ),
                    title: Text(
                      'Escanear',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Inter Tight',
                                color: Colors.white,
                                fontSize: 22.0,
                                letterSpacing: 0.0,
                              ),
                    ),
                    actions: [],
                    centerTitle: true,
                    elevation: 2.0,
                  )
                : null,
            body: SafeArea(
              top: true,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Container(
                        width: 331.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget!.qrRef?.eventoId,
                              'Asistencia',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Container(
                        width: 380.0,
                        height: 342.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(6.0),
                          child: BarcodeWidget(
                            data:
                                'https://asistenciaqr-sy01we.flutterflow.app/escanear?qrRef=${widget!.qrRef?.reference.id}',
                            barcode: Barcode.qrCode(),
                            width: 200.0,
                            height: 200.0,
                            color: FlutterFlowTheme.of(context).primaryText,
                            backgroundColor: Colors.transparent,
                            errorBuilder: (_context, _error) => SizedBox(
                              width: 200.0,
                              height: 200.0,
                            ),
                            drawText: true,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 316.0,
                      height: 71.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Visibility(
                        visible: _model.buton == true,
                        child: StreamBuilder<List<ConfirmadosRecord>>(
                          stream: queryConfirmadosRecord(
                            parent: widget!.qrRef?.reference,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<ConfirmadosRecord>
                                buttonConfirmadosRecordList = snapshot.data!;

                            return FFButtonWidget(
                              onPressed: () async {
                                await ConfirmadosRecord.createDoc(
                                        widget!.qrRef!.reference)
                                    .set(createConfirmadosRecordData(
                                  email: currentUserEmail,
                                  displayName: currentUserDisplayName,
                                  hora: getCurrentTimestamp,
                                  registrado: false,
                                  matricula: valueOrDefault(
                                      currentUserDocument?.matricula, ''),
                                ));
                                _model.buton = false;
                                safeSetState(() {});
                              },
                              text: 'Confirmar Asistencia',
                              options: FFButtonOptions(
                                height: 20.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFF3943EF),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter Tight',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: 316.0,
                      height: 202.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: StreamBuilder<List<ConfirmadosRecord>>(
                          stream: queryConfirmadosRecord(
                            parent: widget!.qrRef?.reference,
                            queryBuilder: (confirmadosRecord) =>
                                confirmadosRecord.orderBy('hora'),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<ConfirmadosRecord>
                                listViewConfirmadosRecordList = snapshot.data!;

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewConfirmadosRecordList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewConfirmadosRecord =
                                    listViewConfirmadosRecordList[
                                        listViewIndex];
                                return AuthUserStreamWidget(
                                  builder: (context) => SelectionArea(
                                      child: Text(
                                    '${listViewConfirmadosRecord.email}${listViewConfirmadosRecord.displayName}${dateTimeFormat("M/d h:mm a", listViewConfirmadosRecord.hora)}${valueOrDefault(currentUserDocument?.matricula, '')}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  )),
                                );
                              },
                            );
                          },
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
  }
}
