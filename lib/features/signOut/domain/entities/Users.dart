import 'package:equatable/equatable.dart';


class Users extends Equatable {
  final String email;
  //final String password;

  Users( this.email);

  @override
  // TODO: implement props
  List<Object> get props => [email];
}