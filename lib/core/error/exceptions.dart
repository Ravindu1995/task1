class AuthException implements Exception {
  final String message;
  AuthException({
    this.message,
  });
}

class FailException implements Exception {
  final String message;
  FailException({
    this.message,
  });
}

