import 'dart:async';
import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:keep_up/app/configuration/app_configuration.dart';
import 'package:keep_up/app/core/auth/auth_repository_interface.dart';
import 'package:keep_up/app/core/request_core.dart';
import 'package:keep_up/app/models/page/response_paginated.dart';
import 'package:keep_up/app/models/user_entity.dart';
import 'package:keep_up/app/utils/preferences/cd_preferences.dart';

class AuthRepository implements IAuthRepository {
  static const SERVICELOGIN = "/api/login/doLogin";

  @override
  Future<ResponsePaginated> getLogin({String username, String password}) async {
    if (AppConfiguration.isMockDevTest) {
      return ResponsePaginated();
    } else {
      return ResponsePaginated();
    }
  }

  @override
  Future<String> getToken() async {
    var userKid =
        await codePreferences.getString(key: UserEntity.KID, ifNotExists: null);
    return userKid == "null" ? null : userKid;
  }

  @override
  Future<ResponsePaginated> getLogout() async {
    return ResponsePaginated();
  }
}
