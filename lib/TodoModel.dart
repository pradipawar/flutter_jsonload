import 'package:flutter/cupertino.dart';

import 'TaskModel.dart';


class TodoModel extends ChangeNotifier{
  List<TaskModel> taskList = []; //contians all the task

  addTaskInList(){
    TaskModel taskModel = TaskModel("Name ${taskList.length}", "Location ${taskList.length}");
    taskList.add(taskModel);

    notifyListeners();
    //code to do
  }

}