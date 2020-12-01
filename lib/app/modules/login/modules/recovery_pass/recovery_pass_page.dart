import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_it/get_it.dart';
import 'package:keep_up/app/component/appbar/app_bar_custom.dart';
import 'package:keep_up/app/component/dialog/dialog_generic.dart';
import 'package:keep_up/app/component/load/load_elements.dart';
import 'package:keep_up/app/component/textfield/custom_grey_textfield.dart';
import 'package:keep_up/app/core/auth/auth_repository_interface.dart';
import 'package:keep_up/app/utils/string/string_file.dart';
import 'package:keep_up/app/utils/theme/app_theme_utils.dart';

import '../../login_bloc.dart';

class RecoveryPassPage extends StatefulWidget {
  final String title;

  const RecoveryPassPage({Key key, this.title = "RecoveryPass"})
      : super(key: key);

  @override
  _RecoveryPassPageState createState() => _RecoveryPassPageState();
}

class _RecoveryPassPageState extends State<RecoveryPassPage> {
  var bloc = Modular.get<LoginBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: bloc.isLoad,
            initialData: false,
            builder: (context, snapshot) {
              var _isLoadRequest = snapshot.data;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AppBarCustom("Recuperar senha"),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Column(
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                              right: 30, left: 30, top: 56, bottom: 20),
                          child: CustomGreyTextField(
                            controller: bloc.emailController,
                            enabled: !_isLoadRequest,
                            prefixIcon: Icon(
                              Icons.person,
                              size: 18,
                              color: AppThemeUtils.colorPrimary,
                            ),
                            labelText: 'Email',
                            //   focusedBorder: UnderlineInputBorder(
                            //     borderSide: BorderSide(color: Colors.green)),

                            keyboardType: TextInputType.emailAddress,
                          )),
                      _isLoadRequest
                          ? loadElements(context)
                          : Padding(
                              padding: EdgeInsets.only(top: 15, bottom: 15),
                              child: SizedBox(
                                child: RaisedButton(
                                  padding: EdgeInsets.all(5),
                                  color: AppThemeUtils.colorPrimary80,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Text(
                                    "Resetar senha",
                                    style: AppThemeUtils.normalSize(
                                        color: AppThemeUtils.whiteColor),
                                  ),
                                  onPressed: _sendForgotPassWordLink,
                                ),
                              ),
                            ),
                    ],
                  )

                          // Container(
                          //   height: 45.0,
                          //   child: Material(
                          //     borderRadius: BorderRadius.circular(22.0),
                          //     shadowColor: Colors.tealAccent,
                          //     color: Colors.teal,
                          //     elevation: 7.0,
                          //     child: GestureDetector(
                          //       onTap: ,
                          //       child: Center(
                          //         child: Text(
                          //           'Resetar senha',
                          //           style: TextStyle(
                          //             color: Colors.white,
                          //             fontWeight: FontWeight.bold,
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),

                          ))
                ],
              );
            }));
  }

  Future<void> _sendForgotPassWordLink() async {
    bloc.isLoad.sink.add(true);
    FirebaseAuth auth = GetIt.I.get<FirebaseAuth>();
    if ((await doesEmailAlreadyExist(bloc.emailController.text)) == false) {
      bloc.isLoad.sink.add(false);
      _showDialogErr('Email inválido');
    } else {
      auth.sendPasswordResetEmail(email: bloc.emailController.text)
          .then((result) {
        bloc.isLoad.sink.add(false);
        _showDialog();
      }).catchError((error) {
        print(error.message);
        bloc.isLoad.sink.add(false);
        _showDialogErr(error.message);
      });
    }
  }

  void _showDialogErr(e) {
    showGenericDialog(
        context: context,
        title: StringFile.atencao,
        description: "${e}",
        iconData: Icons.error_outline,
        positiveCallback: () {
          FocusScope.of(context).requestFocus(FocusNode());
          Modular.to.pop();
        },
        positiveText: StringFile.ok);
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return Padding(
    //       padding: EdgeInsets.fromLTRB(5, 50, 5, 10),
    //       child: AlertDialog(
    //         elevation: 24.0,
    //         backgroundColor: Colors.teal,
    //         content: Text(
    //           e,
    //           style: TextStyle(
    //             color: Colors.white,
    //           ),
    //         ),
    //         actions: <Widget>[
    //           FlatButton(
    //             child: Text(
    //               "Fechar",
    //               style: TextStyle(
    //                 color: Colors.white,
    //               ),
    //             ),
    //             onPressed: () {
    //               Navigator.of(context).pop();
    //              Modular.to.pop();
    //             },
    //           ),
    //         ],
    //       ),
    //     );
    //   },
    // );
  }

  void _showDialog() {
    showGenericDialog(
        context: context,
        title: "Sucesso",
        description: "Email para resetar a senha enviado com sucesso!",
        iconData: Icons.check_circle,
        positiveCallback: () {
          FocusScope.of(context).requestFocus(FocusNode());
          Modular.to.pop();
        },
        positiveText: StringFile.ok);
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return Padding(
    //       padding: EdgeInsets.fromLTRB(5, 50, 5, 10),
    //       child: AlertDialog(
    //         elevation: 24.0,
    //         backgroundColor: Colors.teal,
    //         content: Text(
    //           'Email para resetar a senha enviado com sucesso!',
    //           style: TextStyle(
    //             color: Colors.white,
    //           ),
    //         ),
    //         actions: <Widget>[
    //           FlatButton(
    //             child: Text(
    //               "Fechar",
    //               style: TextStyle(
    //                 color: Colors.white,
    //               ),
    //             ),
    //             onPressed: () {
    //               Navigator.of(context).pop();
    //             },
    //           ),
    //         ],
    //       ),
    //     );
    //   },
    // );
  }

  Widget _circularProgressIndicator() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Center(
        child: SizedBox(
            width: 50,
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation(Colors.teal),
              strokeWidth: 3.0,
            )),
      ),
    );
  }

  Future<bool> doesEmailAlreadyExist(String _email) async {
    FirebaseFirestore db = GetIt.I.get<FirebaseFirestore>();
    final QuerySnapshot result = await db.collection('users').get();
    final List<DocumentSnapshot> documents = result.docs;
    int len = result.docs.length;
    for (int i = 0; i < len; i++) {
      print(documents[i].data()['email']);
      if (documents[i].data()['email'] == bloc.emailController.text) {
        return true;
      }
    }
    return false;
  }
}
