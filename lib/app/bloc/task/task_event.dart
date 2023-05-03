part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {}

class TaskListReceived extends TaskEvent {
  
}

class TaskAdded extends TaskEvent {
String title;
  String subtitle;
  DateTime time;
  TaskType taskType;
  TaskAdded(
      {required this.title,
      required this.subtitle,
      required this.time,
      required this.taskType});
}
