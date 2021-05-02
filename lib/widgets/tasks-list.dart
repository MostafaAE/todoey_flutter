import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task-data.dart';
import 'package:todoey_flutter/widgets/task-tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return TaskTile(
            taskTitle: taskData.taskName(index),
            isChecked: taskData.isDone(index),
            checkboxCallBack: (bool checkBoxState) {
              taskData.toggleDone(index);
            },
            longPressCallBack: () {
              taskData.deleteTask(index);
            },
          );
        },
        itemCount: taskData.taskCount,
      );
    });
  }
}
