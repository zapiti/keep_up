import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:keep_up/app/app_module.dart';
import 'package:keep_up/app/modules/login/modules/register/register_bloc.dart';
import 'package:keep_up/app/modules/login/modules/register/register_module.dart';

void main() {
  Modular.init(AppModule());
  Modular.bindModule(RegisterModule());
  RegisterBloc bloc;

  // setUp(() {
  //     bloc = RegisterModule.to.get<RegisterBloc>();
  // });

  // group('RegisterBloc Test', () {
  //   test("First Test", () {
  //     expect(bloc, isInstanceOf<RegisterBloc>());
  //   });
  // });
}
