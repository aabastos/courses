import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String name;
  final bool checked;
  final Function checkEvent;

  TaskTile({this.name, this.checked = false, this.checkEvent});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        this.name,
        style: TextStyle(
          decoration: this.checked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: this.checked,
        onChanged: checkEvent,
      ),
    );
  }
}
