import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sms/model/user_model.dart';
import 'package:sms/screen/list_users.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final nameController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Create Users"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          TextField(
            controller: nameController,
            decoration: decoration('Name'),
          ),
          SizedBox(height: 24,),
          TextField(
            controller: userNameController,
            decoration: decoration('User Name'),
          ),
          SizedBox(height: 24,),
          TextField(
            controller: passwordController,
            decoration: decoration('Password'),
          ),
          SizedBox(height: 24,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                label: Text('Create'),
                icon: Icon(Icons.clear),
                onPressed: (){
                  nameController.text = '';
                  userNameController.text = '';
                  passwordController.text = '';
                },
              ),
              ElevatedButton.icon(
                label: Text('Create'),
                icon: Icon(Icons.save,),
                onPressed: (){
                  final user = Users(
                    name: nameController.text,
                    userName: userNameController.text,
                    password: passwordController.text
                  );
                 createUser(user);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ListUsers()
                  ));
                },
              )
            ],
          )
        ],
      ),
    );

  }
  InputDecoration decoration(String label)=> InputDecoration(
      labelText:label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8))
      )
  );
  Future createUser(Users user) async{
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    user.id = docUser.id;
    final json = user.toJson();
    await docUser.set(json);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('User created successfully')));

  }
}
