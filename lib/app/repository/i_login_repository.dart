import 'package:dartz/dartz.dart';

import '../exceptions/login_failure.dart';

abstract class ILoginRepository {
  Future<Either<LoginFailure, String>> login(String email, String password);
}
