import 'package:dartz_flutter_either/app/modules/common/base_widget/base_widget.dart';
import 'package:dartz_flutter_either/app/modules/login/login_store.dart';
import 'package:flutter/material.dart';

class LoginPage extends BaseWidget<LoginStore> {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('headline6'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: store.emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: store.passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => store.login(),
              child: const Text('Login'),
            ),
          ),
        ],
      ),
    );
  }
}
