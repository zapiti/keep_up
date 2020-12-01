import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:keep_up/app/app_bloc.dart';
import 'package:keep_up/app/utils/theme/app_theme_utils.dart';

class ShowHideButtom extends StatefulWidget {

  double size;
  Color color;

  ShowHideButtom({ this.size, this.color});

  @override
  _ShowHideButtomState createState() => _ShowHideButtomState();
}

class _ShowHideButtomState extends State<ShowHideButtom> {
  var appBloc = Modular.get<AppBloc>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      initialData: true,
      stream: appBloc.hideShowMoney,
      builder: (context, snapshot) => IconButton(
          onPressed: () {
            appBloc.setShowHide(!  (snapshot.data ?? true));
          },
          icon: Icon(
            (snapshot.data ?? true)
                ? MaterialCommunityIcons.eye_off_outline
                : MaterialCommunityIcons.eye_outline,
            color: widget.color ??AppThemeUtils.colorPrimary,
            size: widget.size ?? 30,
          )),
    );
  }
}
