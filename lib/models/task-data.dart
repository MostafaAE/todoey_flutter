import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  TaskData() {
    readData();
  }

  int get taskCount {
    return _tasks.length;
  }

  String taskName(int index) {
    return _tasks[index].name;
  }

  bool isDone(int index) {
    return _tasks[index].isDone;
  }

  void add(Task task) {
    _tasks.add(task);
    saveData();
    notifyListeners();
  }

  void toggleDone(int index) {
    _tasks[index].toggleDone();
    saveData();
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    saveData();
    notifyListeners();
  }

  void saveData() async {
    try {
      //finding correct local path
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      //a reference to the file location
      File file = File('$appDocPath/tasksData.txt');
      var sink = file.openWrite(mode: FileMode.write);
      for (var task in _tasks) sink.write('${task.name}\n${task.isDone}\n');
      sink.close();
    } catch (e) {
      print(e);
    }
  }

  void readData() async {
    try {
      //finding correct local path
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;

      //a reference to the file location
      File file = File('$appDocPath/tasksData.txt');
      bool exists = await file.exists();
      if (exists) {
        List<String> tasksData = await file.readAsLines();
        for (int i = 0; i < tasksData.length; i += 2)
          _tasks.add(
              Task(name: tasksData[i], isDone: (tasksData[i + 1] == 'true')));
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }
}
