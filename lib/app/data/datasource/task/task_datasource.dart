import 'package:hive/hive.dart';
import 'package:taskut/app/data/model/task_type/task_type.dart';
import 'package:taskut/app/di/di.dart';

import '../../model/task/task.dart';

abstract class ITaskDataSource {
  List<Task> getAllTasks();
  Future<void> addTask(
      {required String title,
      required String subtitle,
      bool isDone = false,
      required DateTime time,
      required TaskType taskType});
}

class TaskLocalDataSource extends ITaskDataSource {
  Box<Task> taskBox = locator.get();

  @override
  List<Task> getAllTasks() => taskBox.values.toList();

  @override
  Future<void> addTask({
    required String title,
    required String subtitle,
    bool isDone = false,
    required DateTime time,
    required TaskType taskType,
  }) async {
    try {
      await taskBox.add(Task(
          title: title, subTitle: subtitle, time: time, taskType: taskType));
    } catch (e) {
      print('Error Occured: ${e}');
    }
  }
}
