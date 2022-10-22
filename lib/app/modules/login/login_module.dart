import 'package:dartz_flutter_either/app/modules/login/login_page.dart';
import 'package:dartz_flutter_either/app/modules/login/login_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../repository/login_repository.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginRepository()),
    Bind.lazySingleton((i) => LoginStore(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => LoginPage()),
  ];
}
