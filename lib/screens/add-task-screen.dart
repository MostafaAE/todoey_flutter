import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task-data.dart';
import 'package:todoey_flutter/models/task.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen();

  String taskTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 40,
              ),
            ),
            TextField(
              onChanged: (newValue) {
                taskTitle = newValue;
              },
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Enter task title',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.lightBlueAccent,
                    width: 5,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.lightBlueAccent,
                    width: 5,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextButton(
              child: Text(
                'Add',
                style: TextStyle(
                  fontSize: 26,
                ),
              ),
              onPressed: () {
                if (taskTitle != null) {
                  final task = Task(name: taskTitle);
                  Provider.of<TaskData>(context, listen: false).add(task);
                  Navigator.pop(context);
                }
              },
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.lightBlueAccent,
                padding: EdgeInsets.all(15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
