import 'package:flutter/foundation.dart';

import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

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
    notifyListeners();
  }

  void toggleDone(int index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }
}
