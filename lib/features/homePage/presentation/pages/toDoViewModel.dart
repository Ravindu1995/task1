import 'package:TODO/core/usecases/usecase.dart';
import 'package:TODO/features/homePage/domain/entities/toDoList.dart';
import 'package:TODO/features/homePage/domain/usecases/deleteToDoUsecase.dart' as deletetodo;
import 'package:TODO/features/homePage/domain/usecases/deleteToDoUsecase.dart';
import 'package:TODO/features/homePage/domain/usecases/insertToDoUsecase.dart' as inserttodo;
import 'package:TODO/features/homePage/domain/usecases/toDoUsecase.dart';
import 'package:TODO/features/homePage/domain/usecases/updateToDoUsecase.dart' as updatetodo;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

class ToDoViewModel extends BaseViewModel {
  final ToDoUsecase toDoUsecase;
  final inserttodo. InsertToDoUsecase insertToDoUsecase;
  final deletetodo. DeleteToDoUsecase deleteToDoUsecase;
  final updatetodo. UpdateToDoUsecase updateToDoUsecase;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController taskController = TextEditingController();
  final TextEditingController docIDController = TextEditingController();
  //this.deleteToDoUsecase,  this.updateToDoUsecase
  ToDoViewModel({@required this.deleteToDoUsecase,@required this.updateToDoUsecase, 
      @required this.insertToDoUsecase,
      @required this.toDoUsecase,
      })
      : assert(insertToDoUsecase != null, ' usecase cannot be null');

  Future<void> insertTask() async {
    final res = await insertToDoUsecase(
        inserttodo.Params(title: titleController.text, task: taskController.text));
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

  Future<void> deleteTask() async {
      final res = await deleteToDoUsecase(Params(
        docID: docIDController.text
      ));
    //print(todolist.length);
    res.fold((l) {
      Get.snackbar('Error', l.failureMessage);
    }, (r) {
      Get.snackbar('Success', 'Deleted todo');
    });

  }

  // Future<void> updateTask() async {
  //   final res = await updateToDoUsecase(ToDoList(title: titleController.text, task: taskController.text));
  // }
}
// }
