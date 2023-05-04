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

class TaskAddingError extends TaskState {
  String errorMessage;
  TaskAddingError(this.errorMessage);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TaskAddingSuccess extends TaskState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
