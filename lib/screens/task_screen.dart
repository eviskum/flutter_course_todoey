import 'package:flutter/material.dart';
import 'package:flutter_course_todoey/model/task.dart';
import 'package:flutter_course_todoey/widgets/add_task.dart';
import 'package:flutter_course_todoey/widgets/task_list.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Task> todoItems = [
    Task(taskTitle: 'Todo 1'),
    Task(taskTitle: 'Todo 2'),
    Task(taskTitle: 'Todo 3x'),
    Task(taskTitle: 'Todo 4x'),
  ];

  void _toggleDone(Task task) {
    setState(() {
      task.toggleDone();
    });
  }

  void _addTask(Task task) {
    setState(() {
      todoItems.add(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30.0,
                    child: Icon(
                      Icons.list,
                      size: 35.0,
                      color: Colors.lightBlueAccent,
                    )),
                const SizedBox(height: 20.0),
                const Text(
                  'Todoey',
                  style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.w700),
                ),
                Text('${todoItems.length} tasks', style: TextStyle(color: Colors.white, fontSize: 18.0)),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
              ),
              child: TaskList(
                taskList: todoItems,
                toggleDone: _toggleDone,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTask(
                    newTaskFn: _addTask,
                  )),
            ),
          );
        },
      ),
    );
  }
}
