part of 'task_bloc.dart';

@immutable
abstract class TaskState {}

class TaskInitial extends TaskState {}

class TaskListReceiveSuccess extends TaskState {
  List<Task> taskList;
  TaskListReceiveSuccess(this.taskList);
}

class TaskAddingError extends TaskState {
  String errorMessage;
  TaskAddingError(this.errorMessage);
}
class TaskAddingSuccess extends TaskState {
}
