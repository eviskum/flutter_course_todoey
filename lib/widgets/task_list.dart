import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_course_todoey/model/task.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  // final List<Task> taskList;
  // final void Function(Task task) toggleDone;

  // const TaskList({Key? key, required this.taskList, required this.toggleDone}) : super(key: key);
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Tasks todoItems = Provider.of<Tasks>(context);

    return Consumer<Tasks>(builder: (context, todoItems, child) {
      return ListView.builder(
          itemCount: todoItems.count,
          itemBuilder: (context, index) {
            return TaskTile(task: todoItems.taskList[index]);
          });
    });
  }
}

class TaskTile extends StatelessWidget {
  const TaskTile({Key? key, required this.task}) : super(key: key);

  final Task task;
  // final void Function(Task task) toggleFn;

  @override
  Widget build(BuildContext context) {
    // Tasks todoItems = Provider.of<Tasks>(context);
    return ListTile(
      onLongPress: () {
        Provider.of<Tasks>(context, listen: false).delete(task);
      },
      title: Text(
        task.taskTitle,
        style: TextStyle(decoration: task.isDone ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
          value: task.isDone,
          activeColor: Colors.lightBlueAccent,
          onChanged: (value) {
            Provider.of<Tasks>(context, listen: false).toggleDone(task);
            // toggleFn(task);
          }),
    );
  }
}
