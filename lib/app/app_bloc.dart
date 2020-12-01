import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_it/get_it.dart';
import 'package:keep_up/app/utils/object/object_utils.dart';
import 'package:keep_up/app/utils/preferences/cd_preferences.dart';
import 'package:rxdart/rxdart.dart';

import 'models/current_user.dart';
import 'models/user_entity.dart';

class AppBloc extends Disposable {
  final currentUser = BehaviorSubject<CurrentUser>();

  static const POSITION = 'POSITION';
  static const SHOWHIDE = 'SHOWHIDE';

  var hideShowMoney = BehaviorSubject<bool>.seeded(true);
  var initialPosition = BehaviorSubject<int>.seeded(0);

  var dateSelected = BehaviorSubject<DateTime>.seeded(DateTime.now());

  setShowHide(bool showHide) {
    codePreferences.set(key: SHOWHIDE, value: showHide);
    hideShowMoney.sink.add(showHide);
  }

  iniData() {
    codePreferences.getBoolean(key: SHOWHIDE).then((item) {
      hideShowMoney.sink.add(item);
    });

    codePreferences.getString(key: POSITION).then((item) {
      initialPosition.sink.add(ObjectUtils.parseToInt(item) );
    });
  }



  setPosition(int pos) {
    codePreferences.set(key: POSITION, value: pos.toString());
    initialPosition.sink.add(pos);
  }


  CurrentUser getCurrentUserValue() {

    FirebaseAuth auth = GetIt.I.get<FirebaseAuth>();
    final  localUser = auth.currentUser;
    CurrentUser user;

    if (localUser != null) {
      user = CurrentUser();
      user.name = localUser.displayName;
      user.id = localUser.uid;
      currentUser.sink.add(user);
    }else{
      user = null;
    }

    return user;
  }

  @override
  void dispose() {
    currentUser.close();
    hideShowMoney.close();
    initialPosition.close();
    dateSelected.close();
  }

  Future<CurrentUser> getCurrentUserFutureValue() async {


    FirebaseAuth auth = GetIt.I.get<FirebaseAuth>();
    final  localUser = auth.currentUser;
    CurrentUser user;

      if (localUser != null) {
        user = CurrentUser();
        user.name = localUser.displayName;
        user.id = localUser.uid;
        currentUser.sink.add(user);
      }else{
        user = null;
      }

    return user;
  }
}
