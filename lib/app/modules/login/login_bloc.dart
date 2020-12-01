import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_it/get_it.dart';
import 'package:keep_up/app/component/dialog/dialog_generic.dart';
import 'package:keep_up/app/models/user_entity.dart';
import 'package:keep_up/app/routes/constants_routes.dart';
import 'package:keep_up/app/utils/preferences/cd_preferences.dart';
import 'package:keep_up/app/utils/preferences/local_data_store.dart';
import 'package:keep_up/app/utils/string/string_file.dart';
import 'package:rxdart/rxdart.dart';

import 'model/users.dart';

class LoginBloc extends Disposable {
  var emailController = TextEditingController();

  var passController = TextEditingController();

  var isLoad = BehaviorSubject<bool>.seeded(false);

  var showPass = BehaviorSubject<bool>.seeded(true);

  var nameController = TextEditingController();

  var passConfirmController = TextEditingController();

  var showPassConfirm = BehaviorSubject<bool>.seeded(true);

  var dateNscController = TextEditingController();

  var alturaControler = TextEditingController();

  var sexoController = TextEditingController();

  Future<void> signup(BuildContext context) async {
    FirebaseAuth auth = GetIt.I.get<FirebaseAuth>();
    isLoad.sink.add(true);

    try {
      var result = await auth.createUserWithEmailAndPassword(
          email: emailController.text, password: passController.text);
      final user = result.user;
      await Users(uid: user.uid)
          .updateUserData(nameController.text, emailController.text);
      user.sendEmailVerification();
      isLoad.sink.add(false);
    } catch (e) {
      print(e.message);
      isLoad.sink.add(false);
      showGenericDialog(
          context: context,
          title: StringFile.atencao,
          description: "${e.message}",
          iconData: Icons.error_outline,
          positiveCallback: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          positiveText: StringFile.ok);
    }
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    isLoad.drain();
    showPass.drain();
    showPassConfirm.drain();
  }

  void getLogout() {
    FirebaseAuth auth = GetIt.I.get<FirebaseAuth>();
    auth.signOut().then((value) {
      storage.clear().then((value) {
        Modular.to.pushReplacementNamed(ConstantsRoutes.LOGIN);
      });
    });

  }

  void getLogin(BuildContext context) async {
    isLoad.sink.add(true);
    FirebaseAuth auth = GetIt.I.get<FirebaseAuth>();
    try {
      var result = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passController.text);
      final user = result.user;
      isLoad.sink.add(false);
      Modular.to.pushReplacementNamed(ConstantsRoutes.HOMEPAGE);
    } catch (e) {
      print(e.message);
      isLoad.sink.add(false);
      showGenericDialog(
          context: context,
          title: StringFile.atencao,
          description: "${e.message}",
          iconData: Icons.error_outline,
          positiveCallback: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          positiveText: StringFile.ok);
    }
  }
}
