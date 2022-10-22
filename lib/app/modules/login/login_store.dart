import 'package:dartz/dartz.dart';
import 'package:dartz_flutter_either/app/exceptions/login_failure.dart';
import 'package:dartz_flutter_either/app/repository/i_login_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final ILoginRepository _repository;
  _LoginStoreBase(this._repository);

  @observable
  Option<LoginFailure> failure = none();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @observable
  bool loading = false;

  @action
  Future login() async {
    loading = true;
    failure = none();
    final loginResult =
        await _repository.login(emailController.text, passwordController.text);
    loginResult.fold((failureResult) {
      failure = optionOf(failureResult);
      loading = false;
    }, (successResult) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('access_token', successResult);
      loading = false;
      Modular.to.pushNamedAndRemoveUntil('/', (route) => false);
    });
  }
}
