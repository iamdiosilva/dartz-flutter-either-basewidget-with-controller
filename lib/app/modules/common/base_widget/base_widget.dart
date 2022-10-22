import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

abstract class BaseWidget<T extends Store> extends StatelessWidget {
  BaseWidget({super.key});

  final Set<T> _dependencies = <T>{};

  T get store {
    if (_dependencies.isEmpty) {
      _dependencies.add(Modular.get<T>());
    }
    return _dependencies.first;
  }

  @override
  Widget build(BuildContext context);
}
