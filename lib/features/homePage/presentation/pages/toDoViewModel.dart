import 'package:TODO/core/usecases/usecase.dart';
import 'package:TODO/features/homePage/domain/entities/toDoList.dart';
import 'package:TODO/features/homePage/domain/usecases/deleteToDoUsecase.dart'
    as deletetodo;
import 'package:TODO/features/homePage/domain/usecases/deleteToDoUsecase.dart';
import 'package:TODO/features/homePage/domain/usecases/insertToDoUsecase.dart'
    as inserttodo;
import 'package:TODO/features/homePage/domain/usecases/stream.dart'
    as streamusecase;
import 'package:TODO/features/homePage/domain/usecases/toDoUsecase.dart';
import 'package:TODO/features/homePage/domain/usecases/updateToDoUsecase.dart'
    as updatetodo;
import 'package:TODO/features/signOut/domain/usecases/signOutUsecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

class ToDoViewModel extends StreamViewModel<List<ToDoList>> {
  final ToDoUsecase toDoUsecase;
  final inserttodo.InsertToDoUsecase insertToDoUsecase;
  final deletetodo.DeleteToDoUsecase deleteToDoUsecase;
  final updatetodo.UpdateToDoUsecase updateToDoUsecase;
  final streamusecase.StreamUse streamUse;
  final SignOutUsecase signOutUsecase;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController taskController = TextEditingController();
  final TextEditingController title1Controller = TextEditingController();
  final TextEditingController task1Controller = TextEditingController();
  final TextEditingController docIDController = TextEditingController();
  //this.deleteToDoUsecase,  this.updateToDoUsecase
  ToDoViewModel( {
    @required this.signOutUsecase,
    @required this.streamUse,
    @required this.deleteToDoUsecase,
    @required this.updateToDoUsecase,
    @required this.insertToDoUsecase,
    @required this.toDoUsecase,
  }) : assert(insertToDoUsecase != null, ' usecase cannot be null');

  @override
  void dispose() {
    title1Controller.dispose();
    task1Controller.dispose();
    super.dispose();
  }

  Future<void> insertTask() async {
    final res = await insertToDoUsecase(inserttodo.Params(
        title: titleController.text, task: taskController.text));
    res.fold((l) {
      Get.snackbar('Error', l.failureMessage);
    }, (r) {
      Get.snackbar('Success', 'added todo');
    });
  }

  List<ToDoList> allTodos = [];

  Future<void> getToDoList() async {
    final res = await toDoUsecase(NoParams());
    //print(todolist.length);
    res.fold((l) {}, (r) {
      allTodos = r;
      notifyListeners();
    });
  }

  // Stream<void> getListOfTodo() {
  //   final res = streamUse(NoParams());
  //   res.fold( allTodos[0] , (prev, element) => prev + element);
  //   notifyListeners();
  // }
  //fold<S>(S initialValue, S Function(S, List<ToDoList>) combine)

  Future<void> deleteTask(int index) async {
    final res = await deleteToDoUsecase(Params(docID: todos[index].docId));
    //print(todolist.length);
    res.fold((l) {
      Get.snackbar('Error', l.failureMessage);
    }, (r) {
      Get.snackbar('Success', 'Deleted todo');
    });
  }

  Future<void> updateTask(int index) async {
    final res = await updateToDoUsecase(updatetodo.Params(
        title: title1Controller.text, task: task1Controller.text));

    //  title1Controller : TextEditingValue(text: todos[index].title);
    //   task1Controller: TextEditingValue(text: todos[index].task);
    title1Controller.text = todos[index].title;
    task1Controller.text = todos[index].task;

    res.fold((l) {
      Get.snackbar('Error', l.failureMessage);
    }, (r) {
      Get.snackbar('Success', 'Updated Doc');
    });
  }

  List<ToDoList> get todos => data;
  @override
  Stream<List<ToDoList>> get stream => streamUse(NoParams());


  // Future<void> signOut() async {
  //          final res = await signOutUsecase();
  //       res.fold((l) {
  //         Get.snackbar('Error', l.failureMessage);
  //       }, (r) {
  //         Get.snackbar('Success', r);
  //       });
  // }
}
