import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:taskut/app/data/datasource/task/task_datasource.dart';
import 'package:taskut/app/data/model/task/task.dart';
import 'package:taskut/app/data/repository/task/task_repository.dart';

final locator = GetIt.instance;

Future<void> getItInit() async {
  //* Components
  locator.registerSingleton<Box<Task>>(Hive.box('taskBox'));

  //* DataSources
  locator.registerFactory<ITaskDataSource>(() => TaskLocalDataSource());

  //* Repositories
  locator.registerFactory<ITaskRepository>(() => TaskRepository());
}
