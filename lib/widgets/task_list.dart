import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_course_todoey/model/task.dart';

class TaskList extends StatelessWidget {
  final List<Task> taskList;
  final void Function(Task task) toggleDone;

  const TaskList({Key? key, required this.taskList, required this.toggleDone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          return TaskTile(task: taskList[index], toggleFn: toggleDone);
        });
  }
}

class TaskTile extends StatelessWidget {
  const TaskTile({Key? key, required this.task, required this.toggleFn}) : super(key: key);

  final Task task;
  final void Function(Task task) toggleFn;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.taskTitle,
        style: TextStyle(decoration: task.isDone ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
          value: task.isDone,
          activeColor: Colors.lightBlueAccent,
          onChanged: (value) {
            toggleFn(task);
          }),
    );
  }
}
