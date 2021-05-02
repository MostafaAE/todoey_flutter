import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/task-tile.dart';

import '../screens/tasks-screen.dart';

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          taskTitle: tasks[index].name,
          isChecked: tasks[index].isDone,
          checkboxCallBack: (bool checkBoxState) {
            setState(() {
              tasks[index].isDone = checkBoxState;
            });
          },
        );
      },
      itemCount: tasks.length,
    );
  }
}
