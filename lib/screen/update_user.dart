import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sms/model/user_model.dart';
import 'package:sms/screen/list_users.dart';

class UpdateUser extends StatelessWidget {
  UpdateUser({Key? key}) : super(key: key);
  final nameController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  late Users users ;

  @override
  Widget build(BuildContext context) {
    // Users updateUser = Users(
    //     id: users.id,
    //     name: nameController.text,
    //     userName: userNameController.text,
    //     password: passwordController.text);
    // final ref = FirebaseFirestore.instance.collection('users');
    // List<Users> users = ref.data!;
    // ref.doc(updateUser.id);
    // nameController.text = '${ref.id}';
    // userNameController.text = '${ref.}';
    // passwordController.text = '${updateUser.password}';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Update Users"),
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
                label: Text('Update'),
                icon: Icon(Icons.save,),
                onPressed: (){
                  Users updateUser = Users(
                      id: users.id,
                      name: nameController.text,
                      userName: userNameController.text,
                      password: passwordController.text);
                  final ref = FirebaseFirestore.instance.collection('users');
                  ref.doc(updateUser.id).update(updateUser.toJson());
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
}