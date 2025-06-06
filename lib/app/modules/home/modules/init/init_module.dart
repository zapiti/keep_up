import 'init_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'init_page.dart';

class InitModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => InitBloc()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => InitPage()),
      ];

  static Inject get to => Inject<InitModule>.of();
}
