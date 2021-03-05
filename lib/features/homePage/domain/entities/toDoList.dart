import 'package:equatable/equatable.dart';

class ToDoList extends Equatable {
  final String title;
  final String task;

  ToDoList(this.title, this.task);

  @override
  List<Object> get props => [title,task];
}