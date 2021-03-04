import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure({this.failureMessage});
  final String failureMessage;
  @override
  List<Object> get props => [failureMessage];
}

class SignUpFailure extends Failure {}

class SignInFailure extends Failure {}

class ConnectionFailure extends Failure {}

class LogoutFailure extends Failure {}

class ServerFailure extends Failure {
  final String message;
  ServerFailure(this.message) : super(failureMessage: message);
}
class AuthFailure extends Failure {
  final String message;
  AuthFailure(this.message) : super(failureMessage: message);
}
