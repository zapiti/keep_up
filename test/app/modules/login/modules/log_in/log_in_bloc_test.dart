import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:keep_up/app/app_module.dart';
import 'package:keep_up/app/modules/login/modules/log_in/log_in_bloc.dart';
import 'package:keep_up/app/modules/login/modules/log_in/log_in_module.dart';

void main() {
  Modular.init(AppModule());
  Modular.bindModule(LogInModule());
  LogInBloc bloc;

  // setUp(() {
  //     bloc = LogInModule.to.get<LogInBloc>();
  // });

  // group('LogInBloc Test', () {
  //   test("First Test", () {
  //     expect(bloc, isInstanceOf<LogInBloc>());
  //   });
  // });
}
