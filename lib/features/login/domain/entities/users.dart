import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Users extends Equatable {
  final String email;
  final String password;

  Users( {@required this.email, @required this.password});

  @override
  // TODO: implement props
  List<Object> get props => [email,password];
}
