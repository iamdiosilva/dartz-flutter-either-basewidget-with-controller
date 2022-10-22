class LoginFailure implements Exception {}

class LoginServerErrorFailure extends LoginFailure {
  final String message;

  LoginServerErrorFailure(this.message);
}

class LoginNotFoundFailure extends LoginFailure {
  final String message;

  LoginNotFoundFailure(this.message);
}
