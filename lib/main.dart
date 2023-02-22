import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sms/route.dart';
import 'package:sms/screen/dashboard.dart';
import 'package:sms/screen/list_users.dart';
import 'package:sms/screen/profile.dart';
import 'package:sms/screen/add_users.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      onGenerateRoute: NameRouter.generateRoute,
      ///home: DashBoardScreen()
    );
  }
}
