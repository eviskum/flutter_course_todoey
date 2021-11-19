import 'package:flutter/material.dart';
import 'package:flutter_course_todoey/model/task.dart';
import 'package:provider/provider.dart';

class AddTask extends StatelessWidget {
  // final void Function(Task task) newTaskFn;
  @override
  Widget build(BuildContext context) {
    // Tasks todoItems = context.watch<Tasks>();
    // Tasks todoItems = Provider.of<Tasks>(context);
    String newTask = '';

    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.lightBlueAccent, fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  newTask = value;
                },
                // decoration: InputDecoration(border: InputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent))),
              ),
              TextButton(
                  onPressed: () {
                    // widget.newTaskFn(Task(taskTitle: newTask));
                    Provider.of<Tasks>(context, listen: false).add(Task(taskTitle: newTask));
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 45.0,
                    // width: 150.0,
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Center(
                      child: Text('Add',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          )),
                    ),
                  )),
              // OutlinedButton(onPressed: () {}, child: Text('Add')),
            ],
          ),
        ),
      ),
    );
  }
}
