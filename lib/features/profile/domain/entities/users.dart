import 'package:equatable/equatable.dart';

class User extends Equatable {
  //final String uID;
  final String name;
  final String email;
  //final String password;

  User(
    this.name,
    this.email, 
  );

  @override
  // TODO: implement props
  List<Object> get props => [  name, email];
}
