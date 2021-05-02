import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  TaskTile(
      {this.taskTitle,
      this.isChecked,
      this.checkboxCallBack,
      this.longPressCallBack});

  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallBack;
  final Function longPressCallBack;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallBack,
      ),
      onLongPress: longPressCallBack,
    );
  }
}
