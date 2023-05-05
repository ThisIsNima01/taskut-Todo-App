import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:taskut/app/data/model/task/task.dart';
import 'package:taskut/app/data/model/task_type/task_type.dart';
import 'package:taskut/app/data/repository/task/task_repository.dart';
import 'package:taskut/app/di/di.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final ITaskRepository taskRepository = locator.get();
  bool isUserSearching = false;
  bool isUserFiltering = false;
  List<Task> filteredTaskList = [];
  List<Task> searchedTasks = [];
  TaskBloc() : super(TaskInitial()) {
    on<TaskListReceived>((event, emit) {
      final taskList = taskRepository.getTasksList();
      emit(TaskListReceiveSuccess(taskList));
    });

    on<TaskAdded>(
      (event, emit) async {
        if (event.subtitle.isEmpty || event.title.isEmpty) {
          emit(TaskAddError('عنوان یا توضیحات تسک نباید خالی باشد'));
          return;
        }

        await taskRepository.addNewTask(
            title: event.title,
            subtitle: event.subtitle,
            time: event.time,
            taskType: event.taskType);

        final taskList = taskRepository.getTasksList();

        emit(TaskAddSuccess());
        if (!isUserSearching) emit(TaskListReceiveSuccess(taskList));
      },
    );

    on<TaskDeleted>(
      (event, emit) {
        isUserSearching = event.isUserSearching;

        taskRepository.deleteTask(event.task);
        final taskList = taskRepository.getTasksList();

        emit(TaskLengthUpdated(taskList.length));

        if (!isUserSearching && !isUserFiltering) {
          emit(TaskListReceiveSuccess(taskList));
        }
      },
    );

    on<TaskSearched>(
      (event, emit) {
        isUserSearching = event.wordLength != 0;
        final taskList = taskRepository.getTasksList();

        if (isUserFiltering) {
          searchedTasks = filteredTaskList
              .where((task) => task.title
                  .toLowerCase()
                  .contains(event.searchedWord.toLowerCase()))
              .toList();
          emit(TaskLengthUpdated(taskList.length));

          emit(TaskSearch(searchedTasks));
          return;
        }

        if (!isUserSearching) {
          emit(TaskListReceiveSuccess(taskList));
        } else {
          List<Task> searchedTasks = taskList
              .where((task) => task.title
                  .toLowerCase()
                  .contains(event.searchedWord.toLowerCase()))
              .toList();
          emit(TaskLengthUpdated(taskList.length));

          emit(TaskSearch(searchedTasks));
        }
      },
    );

    on<TaskTimelineFilterChanged>(
      (event, emit) {
        final taskList = taskRepository.getTasksList();

        if (isUserSearching) {
          filteredTaskList = searchedTasks.where((task) {
            return task.time.hour >= event.fromHour &&
                task.time.hour <= event.toHour;
          }).toList();
        } else {
          filteredTaskList = taskList.where((task) {
            return task.time.hour >= event.fromHour &&
                task.time.hour <= event.toHour;
          }).toList();
        }

        if (event.fromHour == 0) {
          isUserFiltering = false;
          filteredTaskList = [];
          emit(TaskListReceiveSuccess(taskList));
        } else {
          isUserFiltering = true;
          emit(TaskTimelineFilter(filteredTaskList));
        }
      },
    );
  }
}
