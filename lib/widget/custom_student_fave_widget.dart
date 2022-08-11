import 'package:animations/animations.dart';
import 'package:student_attendance/pages/student_details_page.dart';
// import 'details_page.dart';
import 'card_widget.dart';
import '';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:student_attendance/pages/details_page.dart';

const double fabSize = 56;

class CustomStudentFABWidget extends StatelessWidget {
  final ContainerTransitionType transitionType;

  const CustomStudentFABWidget({
    Key? key,
    required this.transitionType,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => OpenContainer(
    transitionDuration: Duration(seconds: 2),
    openBuilder: (context, _) => StudentDetailsPage(),
    closedShape: CircleBorder(),
    closedColor: Theme.of(context).primaryColor,
    closedBuilder: (context, openContainer) => Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).primaryColor,
      ),
      height: fabSize,
      width: fabSize,
      child: Icon(Icons.remove_red_eye, color: Colors.white),
    ),
  );
}