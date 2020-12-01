import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:keep_up/app/component/appbar/app_bar_custom.dart';
import 'package:keep_up/app/component/textfield/custom_grey_textfield.dart';
import 'package:keep_up/app/routes/constants_routes.dart';
import 'package:keep_up/app/utils/theme/app_theme_utils.dart';

import '../../login_bloc.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final bloc = Modular.get<LoginBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        children: <Widget>[
          AppBarCustom("Login"),
          Expanded(
              child: SingleChildScrollView(
            child: StreamBuilder(
                stream: bloc.isLoad,
                initialData: false,
                builder: (context, snapshot) {
                  var _isLoadRequest = snapshot.data;
                  return Column(
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                              right: 30, left: 30, top: 56, bottom: 20),
                          child: CustomGreyTextField(
                            enabled: !_isLoadRequest,
                            obscureText: snapshot.data,
                            labelText: "E-mail",
                            controller: bloc.emailController,
                            prefixIcon: Icon(
                              Icons.person,
                              size: 18,
                              color: AppThemeUtils.colorPrimary,
                            ),
                          )),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          child: StreamBuilder<bool>(
                              stream: bloc.showPass.stream,
                              initialData: false,
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                return CustomGreyTextField(
                                  enabled: !_isLoadRequest,
                                  obscureText: snapshot.data,
                                  labelText: "Senha",
                                  controller: bloc.passController,
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    size: 18,
                                    color: AppThemeUtils.colorPrimary,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      snapshot.data
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: AppThemeUtils.colorPrimaryDark,
                                    ),
                                    onPressed: () {
                                      bloc.showPass.sink.add(!snapshot.data);
                                    },
                                  ),
                                );
                              })),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          alignment: Alignment.centerRight,
                          child: FlatButton(
                              onPressed: () {
                                Modular.to.pushNamed(ConstantsRoutes.RECOVERYPASS);
                              },
                              child: Text(
                                "Esqueceu sua senha?",
                                style: AppThemeUtils.smallSize(),
                              ))),
                      Padding(
                        padding: EdgeInsets.only(top: 15, bottom: 15),
                        child: SizedBox(

                          child: RaisedButton(
                            padding: EdgeInsets.all(5),
                            color: AppThemeUtils.colorPrimary80,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Text(
                              "Entrar",
                              style: AppThemeUtils.normalSize(
                                  color: AppThemeUtils.whiteColor),
                            ),
                            onPressed: () {
                              bloc.getLogin(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ))
        ],
      ),
    );
  }
}
