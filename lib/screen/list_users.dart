import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sms/model/user_model.dart';
import 'package:sms/screen/add_users.dart';
import 'package:sms/screen/update_user.dart';
import 'package:sms/widget/big_text.dart';

class ListUsers extends StatefulWidget {
  const ListUsers({Key? key}) : super(key: key);

  @override
  State<ListUsers> createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  final CollectionReference ref =
      FirebaseFirestore.instance.collection('users');
  late final Users users;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: BigText(text: 'User List'),
        centerTitle: true,
        elevation: 0,
      ),
      body: StreamBuilder<QuerySnapshot<Map<String,dynamic>>>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (_,snapshot){
          if(snapshot.hasError) return Text("Something went wrong ${snapshot.error}");
          if(snapshot.hasData){
            final docs = snapshot.data!.docs;
            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index) {
                final data = docs[index].data();
                return ListTile(
                    leading: CircleAvatar(
                      child: Text('${data['name']}'),
                    ),
                    title: Text('${data['userName']}'),
                    subtitle: Text('${data['password']}'),
                    trailing: Container(
                      width: 60,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => UpdateUser()));
                            },
                            child: Icon(
                              Icons.edit,
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              ref.doc(data['id']).delete();
                            },
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ));
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.teal,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => UserPage()));
        },
      ),
    );
  }

  void getUserList() {
    final CollectionReference ref =
        FirebaseFirestore.instance.collection('users');
  }

  Future<Users?> readUser() async {
    final docUser = FirebaseFirestore.instance
        .collection('users')
        .doc('EmVw8RpwSNyWSyxGW8sf');
    final snapshot = await docUser.get();

    if (snapshot.exists) {
      return Users.fromJson(snapshot.data()!);
    }
  }
}
