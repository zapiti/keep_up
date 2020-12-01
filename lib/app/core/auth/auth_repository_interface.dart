import 'package:keep_up/app/models/page/response_paginated.dart';

abstract class IAuthRepository {
  Future<ResponsePaginated> getLogin({String username, String password});
  Future<String> getToken();
  Future<ResponsePaginated>  getLogout();
}
