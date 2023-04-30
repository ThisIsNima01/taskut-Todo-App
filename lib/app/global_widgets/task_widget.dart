import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:taskut/app/core/values/colors.dart';

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
                        fillColor: (p0) => const Color(0xff18DAA3),
                      ),
                      style: MSHCheckboxStyle.fillScaleColor,
                      value: true,
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
                  const Text(
                    'آموزش فلاتر',
                    style: TextStyle(
                      color: CustomColors.blackColor,
                      fontFamily: 'SB',
                      fontSize: 14,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                'دوره فلاتر امیراحمد ادیبی',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: CustomColors.blackColor,
                  fontFamily: 'SM',
                  fontSize: 12,
                ),
              ),
              // Text(
              //   widget.task.subTitle,
              //   overflow: TextOverflow.ellipsis,
              // ),
              const Spacer(),
              _getTimeAndEditBadges(),
            ],
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        // Image.asset(widget.task.taskType.image),
        Image.asset('assets/images/test.png')
      ],
    );
  }

  Row _getTimeAndEditBadges() {
    return Row(
      children: [
        Container(
          width: 84,
          height: 28,
          decoration: BoxDecoration(
            color: const Color(0xff18DAA3),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Row(
              children: [
                const Text(
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
                const SizedBox(
                  width: 8,
                ),
                SvgPicture.asset('assets/icons/clock.svg'),
              ],
            ),
          ),
        ),
        const SizedBox(
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
            width: 84,
            height: 28,
            decoration: BoxDecoration(
              color: const Color(0xffE2F6F1),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'ویرایش',
                    style: TextStyle(
                      color: Color(0xff18DAA3),
                      fontSize: 12,
                      fontFamily: 'SB',
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  SizedBox(
                    width: 16,
                    child: SvgPicture.asset('assets/icons/edit.svg'),
                  )
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
