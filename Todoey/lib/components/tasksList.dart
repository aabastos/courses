import 'package:flutter/material.dart';
import 'package:todoey/components/taskTile.dart';
import 'package:todoey/models/task.dart';

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  List<Task> tasks = [
    Task(name: 'Tarefa 1'),
    Task(name: 'Tarefa 2'),
    Task(name: 'Tarefa 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          name: tasks[index].name,
          checked: tasks[index].isDone,
          checkEvent: (value) {
            setState(() {
              tasks[index].toggleDone();
            });
          },
        );
      },
      itemCount: tasks.length,
    );
  }
}
