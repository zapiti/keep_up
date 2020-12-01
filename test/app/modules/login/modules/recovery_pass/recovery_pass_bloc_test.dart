import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:keep_up/app/app_module.dart';
import 'package:keep_up/app/modules/login/modules/recovery_pass/recovery_pass_bloc.dart';
import 'package:keep_up/app/modules/login/modules/recovery_pass/recovery_pass_module.dart';

void main() {
  Modular.init(AppModule());
  Modular.bindModule(RecoveryPassModule());
  RecoveryPassBloc bloc;

  // setUp(() {
  //     bloc = RecoveryPassModule.to.get<RecoveryPassBloc>();
  // });

  // group('RecoveryPassBloc Test', () {
  //   test("First Test", () {
  //     expect(bloc, isInstanceOf<RecoveryPassBloc>());
  //   });
  // });
}
