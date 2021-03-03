import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Todo extends Equatable {
  
  final int id;
  final String title;
  final String task;

  Todo({@required this.id,@required this.title,@required this.task});

  @override
  List<Object> get props => [ id,title,task];
}