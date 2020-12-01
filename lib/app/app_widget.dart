import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/util/color_util.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      navigatorKey: Modular.navigatorKey,
      title: 'Flutter Slidy',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      theme: CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: ColorUtil.primaryColor,
        barBackgroundColor: ColorUtil.primaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      supportedLocales: [
        Locale('pt', 'BR'),
      ],
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
