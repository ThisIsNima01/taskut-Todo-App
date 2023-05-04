import 'package:taskut/app/data/datasource/task/task_datasource.dart';
import 'package:taskut/app/data/model/task/task.dart';
import 'package:taskut/app/di/di.dart';

import '../../model/task_type/task_type.dart';

abstract class ITaskRepository {
  List<Task> getTasksList();
  Future<void> addNewTask(
      {required String title,
      required String subtitle,
      bool isDone = false,
      required DateTime time,
      required TaskType taskType});
  deleteTask(Task task);
}

class TaskRepository extends ITaskRepository {
  final ITaskDataSource taskDataSource = locator.get();
  @override
  Future<void> addNewTask(
      {required String title,
      required String subtitle,
      bool isDone = false,
      required DateTime time,
      required TaskType taskType}) async {
    await taskDataSource.addTask(
        title: title, subtitle: subtitle, time: time, taskType: taskType);
  }

  @override
  List<Task> getTasksList() => taskDataSource.getAllTasks();

  @override
  deleteTask(Task task) {
    taskDataSource.deleteTask(task);
  }
}
