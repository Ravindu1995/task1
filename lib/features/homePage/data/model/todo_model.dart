import 'package:TODO/features/homePage/domain/entities/todo.dart';
import 'package:flutter/cupertino.dart';

class TodoModel extends Todo {
  final int id;
  final String title;
  final String task;

  TodoModel({@required this.id,@required this.title,@required this.task});


        String getTaskTitle() {
          if (task.length > 20) {

            return task.substring(0, 20);
          } else {
            
            return task;
          }
        }

            String getTaskBodyPreview() {
              if (task.length > 20) {

                if (task.length > 120) {
                  return task.substring(20, 120);
                } else {

                  return task.substring(20);
                }
              } else {
                return '';
              }
            }

      String getTaskFullBody() {
        return task;
      }
}
