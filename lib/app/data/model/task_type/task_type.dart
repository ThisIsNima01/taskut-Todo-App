import 'package:hive/hive.dart';
import 'package:taskut/app/data/model/type_enum/type_enum.dart';

part 'task_type.g.dart';

@HiveType(typeId: 9)
class TaskType {
  TaskType({
    required this.title,
    required this.image,
    required this.taskTypeEnum,
  });

  @HiveField(0)
  String title;

  @HiveField(1)
  String image;

  @HiveField(2)
  TaskTypeEnum taskTypeEnum;
}
