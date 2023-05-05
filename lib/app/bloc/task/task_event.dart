part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {}

class TaskListReceived extends TaskEvent {}

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

class TaskDeleted extends TaskEvent {
  Task task;
  bool isUserSearching;
  TaskDeleted(this.task, this.isUserSearching);
}

class TaskSearched extends TaskEvent {
  String searchedWord;
  int wordLength;
  TaskSearched(this.searchedWord, this.wordLength);
}

class TaskTimelineFilterChanged extends TaskEvent {
  int fromHour;
  int toHour;
  TaskTimelineFilterChanged(this.fromHour, this.toHour);
}
