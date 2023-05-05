import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskut/app/bloc/task/task_bloc.dart';
import 'package:taskut/app/config/theme.dart';
import 'package:taskut/app/data/model/task/task.dart';
import 'package:taskut/app/data/model/task_type/task_type.dart';
import 'package:taskut/app/data/model/type_enum/type_enum.dart';
import 'package:animate_icons/animate_icons.dart';
import 'package:taskut/app/di/di.dart';
import 'package:taskut/app/core/global_state/fab_visibility_state.dart';
import 'package:taskut/app/screen/add_task_screen.dart';
import 'package:taskut/app/screen/home_screen.dart';
import 'package:taskut/app/screen/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(TaskTypeAdapter());
  Hive.registerAdapter(TaskTypeEnumAdapter());
  await Hive.openBox<Task>('taskBox');
  await getItInit();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  AnimationController? _animationController;
  AnimateIconController? controller;
  bool visible = true;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    controller = AnimateIconController();
  }

  @override
  Widget build(BuildContext bContext) {
    return BlocProvider(
      create: (context) => TaskBloc(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Taskut',
          home: Overlay(
            initialEntries: [
              OverlayEntry(
                builder: (context) => Stack(
                  children: [
                    NotificationListener<FabChanged>(
                      onNotification: (notification) {
                        setState(() {
                          visible = notification.visibility;
                        });
                        return true;
                      },
                      child: MainScreen(),
                    ),
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 400),
                      bottom: visible ? 64 : -100,
                      right: 24,
                      child: FloatingActionButton(
                        backgroundColor: AppColors.primaryColor,
                        elevation: 0,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AddTaskScreen(),
                          ));
                        },
                        child: Icon(Icons.add),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
