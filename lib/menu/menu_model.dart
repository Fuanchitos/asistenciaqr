import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/mobile_components/m_menu/m_menu_widget.dart';
import '/pages/web_components/w_menu/w_menu_widget.dart';
import 'menu_widget.dart' show MenuWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MenuModel extends FlutterFlowModel<MenuWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for m_menu component.
  late MMenuModel mMenuModel;
  // Model for w_menu component.
  late WMenuModel wMenuModel;

  @override
  void initState(BuildContext context) {
    mMenuModel = createModel(context, () => MMenuModel());
    wMenuModel = createModel(context, () => WMenuModel());
  }

  @override
  void dispose() {
    mMenuModel.dispose();
    wMenuModel.dispose();
  }
}
