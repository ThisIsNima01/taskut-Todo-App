import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

class TaskWidget extends StatefulWidget {
  TaskWidget({super.key});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // isBoxChecked = widget.task.isDone;
  }

  @override
  Widget build(BuildContext context) {
    return _getTaskItem();
  }

  Widget _getTaskItem() {
    // isBoxChecked = widget.task.isDone;

    return GestureDetector(
      onTap: () {
        setState(() {
          // isBoxChecked = !isBoxChecked;
          // widget.task.isDone = isBoxChecked;
          // widget.task.save();
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        height: 132,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                blurRadius: 20,
                spreadRadius: -18,
                offset: Offset(0, 4),
                color: Colors.black,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: _getMainContent(),
        ),
      ),
    );
  }

  Row _getMainContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Transform.scale(
                    scale: 1.1,
                    child: MSHCheckbox(
                      size: 32,
                      colorConfig: MSHColorConfig(
                        checkColor: (p0) => Colors.white,
                        fillColor: (p0) => Color(0xff18DAA3),
                      ),
                      style: MSHCheckboxStyle.fillScaleColor,
                      value: false,
                      // value: isBoxChecked,
                      onChanged: (selected) {
                        setState(() {
                          // isBoxChecked = selected;
                          // widget.task.isDone = isBoxChecked;
                          // widget.task.save();
                        });
                      },
                    ),
                  ),
                  // Checkbox(
                  //     value: isBoxChecked,
                  //     onChanged: ((isChecked) {
                  //       setState(() {
                  //         isBoxChecked = isChecked!;
                  //       });
                  //     })),
                  // Text(widget.task.title),
                  Text('آموزش فلاتر')
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'دوره فلاتر امیراحمد ادیبی',
                overflow: TextOverflow.ellipsis,
              ),
              // Text(
              //   widget.task.subTitle,
              //   overflow: TextOverflow.ellipsis,
              // ),
              Spacer(),
              _getTimeAndEditBadges(),
            ],
          ),
        ),
        SizedBox(
          width: 20,
        ),
        // Image.asset(widget.task.taskType.image),
      ],
    );
  }

  Row _getTimeAndEditBadges() {
    return Row(
      children: [
        Container(
          width: 90,
          height: 28,
          decoration: BoxDecoration(
            color: Color(0xff18DAA3),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Row(
              children: [
                Text(
                  '10:30',
                  style: TextStyle(
                      color: Colors.white, fontSize: 12, fontFamily: 'SB'),
                ),
                // Text(
                //   '${_getHourUnderTen(widget.task.time)}:${_getMinuteUnderTen(widget.task.time)}',
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontWeight: FontWeight.bold,
                //     fontSize: 14,
                //   ),
                // ),
                SizedBox(
                  width: 8,
                ),
                // Image.asset('assets/images/icon_time.png'),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 16,
        ),
        InkWell(
          onTap: () {
            // Navigator.of(context).push(MaterialPageRoute(
            //   builder: (context) => EditTaskScreen(
            //     task: widget.task,
            //   ),
            // ));
          },
          child: Container(
            width: 90,
            height: 28,
            decoration: BoxDecoration(
              color: Color(0xffE2F6F1),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'ویرایش',
                    style: TextStyle(
                      color: Color(0xff18DAA3),
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  // Image.asset('assets/images/icon_edit.png'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _getMinuteUnderTen(DateTime time) =>
      time.minute < 10 ? '0${time.minute}' : time.minute.toString();

  String _getHourUnderTen(DateTime time) =>
      time.hour < 10 ? '0${time.hour}' : time.hour.toString();
}
