import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  //final String uID;
  final String name;
  final String email;
  //final String password;

  UserEntity(
    {this.name,
    this.email, }
  );

  @override
  // TODO: implement props
  List<Object> get props => [name, email];
}
