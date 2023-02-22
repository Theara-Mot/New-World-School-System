import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:sms/widget/app_colors.dart';
import 'package:sms/widget/app_text.dart';
import 'package:sms/widget/app_text_style.dart';
import 'package:sms/widget/route_list.dart';
import 'package:sms/widget/side_bar_widget.dart';

class Exams extends StatelessWidget {
  const Exams({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.grey[200],
      appBar:AppBar(
        title: Text(AppText.schoolManagement,
          style: AppTextStyle.appbar.copyWith(color: AppColors.white),),
      ),
      sideBar: SideBarWidget().sideBarMenus(context, RouteList.exams),
      body: SingleChildScrollView(
        child: Container(
            child: Text('Exams',
                style: TextStyle(fontSize: 18))
        ),
      ),
    );
  }
}
