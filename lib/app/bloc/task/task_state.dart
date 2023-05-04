part of 'task_bloc.dart';

abstract class TaskState extends Equatable {}

class TaskInitial extends TaskState {
  @override
  List<Object?> get props => [];
}

class TaskListReceiveSuccess extends TaskState {
  List<Task> taskList;
  TaskListReceiveSuccess(this.taskList);

  @override
  List<Object?> get props => [taskList];
}

class TaskAddError extends TaskState {
  String errorMessage;
  TaskAddError(this.errorMessage);

  @override
  List<Object?> get props => [];
}

class TaskAddSuccess extends TaskState {
  @override
  List<Object?> get props => [];
}

class TaskDeleteSuccess extends TaskState {
  @override
  List<Object?> get props => [];
}

class TaskSearch extends TaskState {
  List<Task> taskList;
  TaskSearch(this.taskList);
  @override
  List<Object?> get props => [];
}
