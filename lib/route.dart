
import 'package:flutter/material.dart';
import 'package:sms/screen/Setting.dart';
import 'package:sms/screen/attendance.dart';
import 'package:sms/screen/dashboard.dart';
import 'package:sms/screen/exams.dart';
import 'package:sms/screen/parent.dart';
import 'package:sms/screen/student.dart';
import 'package:sms/screen/teacher.dart';
import 'package:sms/widget/route_list.dart';

class NameRouter {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name){
      case RouteList.dashboard:
        return getPagetRoute(DashBoardScreen());
      case RouteList.teacher:
        return getPagetRoute(TeacherScreen());
      case RouteList.student:
        return getPagetRoute(StudentScreen());
      case RouteList.parent:
        return getPagetRoute(ParentScreen());
      case RouteList.settings:
        return getPagetRoute(SettingScreen());
      case RouteList.exams:
        return getPagetRoute(Exams());
      case RouteList.attendance:
        return getPagetRoute(AttendanceScreen());
      default:
        return getPagetRoute(DashBoardScreen());
    }
  }
}
PageRouteBuilder getPagetRoute(Widget screen){
  return PageRouteBuilder(
      pageBuilder:(BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation) => screen,
      transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child
          ) =>  Align(
        child: SizeTransition(
          sizeFactor: animation,
          child: child,
        ),
      ),
      transitionDuration: Duration(milliseconds: 500)
  );
}