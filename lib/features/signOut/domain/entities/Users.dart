import 'package:equatable/equatable.dart';


class Users extends Equatable {
  final String uid;
  //final String password;

  Users( this.uid);

  @override
  // TODO: implement props
  List<Object> get props => [uid];
}