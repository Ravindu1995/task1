import 'package:equatable/equatable.dart';

class ToDoList extends Equatable {
  final String docId;
  final String title;
  final String task;

  ToDoList(
    this.docId,
    this.title,
    this.task,
  );

  @override
  List<Object> get props => [docId,title,task];
}
