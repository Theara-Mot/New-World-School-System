import 'package:flutter/material.dart';
class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    Color primary = const Color(0xff046A38);
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('Profile'),
          backgroundColor: primary,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      color: primary,
                                      borderRadius: BorderRadius.all(Radius.circular(15))
                                  ),
                                  child: Icon(
                                    Icons.person,
                                    size: 45,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 15,),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Ten"),
                                Row(
                                  children: [
                                    Text("+855 ******8000"),
                                    Icon(Icons.phone_android_outlined,size: 15,color: Colors.blue,),SizedBox(width: 5,),
                                    Icon(Icons.contact_mail_rounded,size: 15,color: Colors.blue,),SizedBox(width: 5,),
                                    Icon(Icons.fingerprint_outlined,size: 15,color: Colors.blue,),SizedBox(width: 5,),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: 48,),
                          Container(
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.qr_code,size: 50,color: Colors.blue,),
                          )
                        ],
                      ),
                      Container(
                        color: Colors.white,
                        margin: EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Balance"),
                                Icon(Icons.remove_red_eye,size: 20)
                              ],
                            ),
                            Card(
                              child: ListTile(
                                leading: Icon(Icons.wallet),
                                title: Text('One-line with trailing widget'),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                leading: Icon(Icons.wallet),
                                title: Text('One-line with trailing widget'),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      /*body: Container(
          height: screenHeight - screenHeight/5,
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('Student').doc(User.id).collection('Profile').snapshots(),
            builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
              if(snapshot.hasData) {
                final snap = snapshot.data!.docs;
                return ListView.builder(
                    itemCount: snap.length,
                    itemBuilder: (context,index){
                      return Scaffold(
                        appBar: AppBar(
                          title: Text("Profile"),
                        ),
                      );
                    }
                );
              }
              else{
                return const Center(child: Text("Something Wrong !"),);
              }
            },
          )
      )*/
    );
  }
}