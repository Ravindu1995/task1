import 'package:TODO/features/homePage/domain/usecases/toDoUsecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class ToDoViewModel extends BaseViewModel {
  final ToDoUsecase toDoUsecase;

  ToDoViewModel({@required this.toDoUsecase})
      : assert(toDoUsecase != null, ' usecase cannot be null');
}
