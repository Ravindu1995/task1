import 'package:TODO/core/usecases/usecase.dart';
import 'package:TODO/features/homePage/domain/entities/toDoList.dart';
import 'package:TODO/features/homePage/domain/usecases/insertToDoUsecase.dart';
import 'package:TODO/features/homePage/domain/usecases/toDoUsecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

class ToDoViewModel extends BaseViewModel {
  final ToDoUsecase toDoUsecase;
  final InsertToDoUsecase insertToDoUsecase;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController taskController = TextEditingController();

  ToDoViewModel({@required this.insertToDoUsecase, @required this.toDoUsecase})
      : assert(insertToDoUsecase != null, ' usecase cannot be null');

  Future<void> insertTask() async {
    final res = await insertToDoUsecase(
        Params(title: titleController.text, task: taskController.text));
    res.fold((l) {
      Get.snackbar('Error', l.failureMessage);
    }, (r) {
      Get.snackbar('Success', 'added todo');
    });
  }
  List<ToDoList> allTodos = [];



   Future<void> getToDoList() async {
     final  res=   await toDoUsecase(NoParams());
      //print(todolist.length);
      res.fold((l) {}, (r) {
        allTodos = r;
        notifyListeners();
      });


      }

    
   
}
// }
