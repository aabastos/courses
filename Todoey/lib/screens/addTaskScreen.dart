import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF737373),
      child: Container(
        padding: EdgeInsets.all(25.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'Adicionar Tarefa',
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 32.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 0.0,
                  vertical: 5.0,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            MaterialButton(
              color: Colors.lightBlueAccent,
              height: 50.0,
              child: Text(
                'Adicionar',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () => {},
            ),
          ],
        ),
      ),
    );
  }
}
