
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:sms/widget/app_text.dart';
import 'package:sms/widget/route_list.dart';

class SideBarWidget{
  final List<AdminMenuItem> _sidebarItems = const [
    AdminMenuItem(
      title: AppText.dashboard,
      route: RouteList.dashboard,
      icon: Icons.dashboard
    ),
    AdminMenuItem(
        title: AppText.userText,
        icon: Icons.person,
      children: [
        AdminMenuItem(
          title: AppText.teacherText,
          route: RouteList.teacher
        ),
        AdminMenuItem(
            title: AppText.studentText,
            route: RouteList.student
        ),
        AdminMenuItem(
            title: AppText.parentText,
            route: RouteList.parent
        ),
      ]
    ),
    AdminMenuItem(
        title: AppText.attendance,
        route: RouteList.attendance,
        icon: Icons.calendar_month_sharp
    ),
    AdminMenuItem(
        title: AppText.exams,
        route: RouteList.exams,
        icon: Icons.insert_page_break_outlined
    ),
    AdminMenuItem(
        title: AppText.settings,
        route: RouteList.settings,
        icon: Icons.settings
    )
  ];

  sideBarMenus(context,selectedRout){
    return SideBar(items: _sidebarItems, selectedRoute: selectedRout,
    onSelected: (item){
      if(item.route !=null){
        Navigator.of(context).pushReplacementNamed(item.route!);
      }
    },
    );
  }
}