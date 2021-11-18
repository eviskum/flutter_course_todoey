class Task {
  late final String _taskTitle;
  late bool _isDone;

  String get taskTitle => _taskTitle;
  bool get isDone => _isDone;

  Task({required taskTitle, isDone = false}) {
    _taskTitle = taskTitle;
    _isDone = isDone;
  }

  void toggleDone() => _isDone = !_isDone;
}
