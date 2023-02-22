import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Color primary = const Color(0xff046A38);
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //late SharedPreferences sharedPreferences ;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children:[
          Column(
            children: [
              Container(
                height: screenHeight * .3,
                decoration: BoxDecoration(
                    color: primary,
                    borderRadius:const BorderRadius.only(
                        bottomRight: Radius.circular(70)
                    )
                ),
                child: Center(
                    child: Image.asset('lib/assets/images/logo.png',
                      height: 130,
                    )
                ),
              ), Container(
                height: screenHeight * .1,
                decoration: BoxDecoration(
                  color: primary,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(70)
                      )
                  ),
                ),
              ),
              SizedBox(
                  height: screenHeight * .6,
                  child:Column(
                    children: [
                      Container(
                        margin:const EdgeInsets.only(
                            top: 10,
                            bottom: 10),
                        child:
                        Text("Login",
                          style: TextStyle(
                            fontSize: 30,
                            letterSpacing: 2,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 2
                              ..color = primary,
                          ),)
                        ),
                      const SizedBox(height: 10,),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: idController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'User Name',
                              icon: Icon(Icons.person),
                              iconColor: Colors.green
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: passwordController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              icon: Icon(Icons.password),
                              iconColor: Colors.green
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          height: 40,
                          width: 150,
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: ElevatedButton(
                            child:  Text('Login',style: TextStyle(fontSize: 22),),
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Colors.green,
                              side:const BorderSide(color: Colors.green, width: 1),
                              elevation: 10,
                              minimumSize:const Size(100, 50),
                              shadowColor: Colors.lightGreenAccent,
                            ),
                            onPressed: () async {
                              String id = idController.text.trim();
                              String password = passwordController.text.trim();
                              FocusScope.of(context).unfocus();

                              if(id.isEmpty){
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text("Student ID Is Empty!"),
                                ));
                              }else if(password.isEmpty){
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text("Password Is Empty!"),
                                ));
                              }else {
                                /*QuerySnapshot snap = await FirebaseFirestore.instance.
                                collection("Student").where('id',isEqualTo: id).get();*/

                                try{
                                  /*if(password == snap.docs[0]['password']){
                                    sharedPreferences  = await SharedPreferences.getInstance();
                                    sharedPreferences.setString('studentId', id).then((_) => {
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) => const HomeScreen()))
                                    });

                                  }else{
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                        content: Text("Password Is Not Correct!")));
                                  }*/
                                }catch(e){
                                  String err = "";
                                  if(e.toString() == "Invalid value: Valid value range is empty: 0"){
                                    setState((){
                                      err = "Student ID Does Not Exist";
                                    });
                                  }else{
                                    setState((){
                                      err = "Error occurred!";
                                    });
                                  }
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text(err)));
                                }
                              }
                            },
                          )
                      ),
                    ],
                  )
              )
            ],
          )],
      ),
    );
  }
}