import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../exceptions/login_failure.dart';
import 'i_login_repository.dart';

class LoginRepository implements ILoginRepository {
  @override
  Future<Either<LoginFailure, String>> login(
      String email, String password) async {
    try {
      final response =
          await Dio().get('https://jsonplaceholder.typicode.com/users');
      final String user = response.data[0]['name'];
      print(user);
      return right(user);
    } on DioError catch (e) {
      return Left(LoginNotFoundFailure(e.toString()));
    } catch (e) {
      return Left(LoginServerErrorFailure(e.toString()));
    }
  }
}
