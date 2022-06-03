import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modul1/googel_login.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:modul1/base/DummyData.dart';
import 'package:get/get.dart';
import 'package:modul1/layout/navbar.dart';
import 'package:modul1/layout/emailLogin.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  loginScreen createState() => loginScreen();
}

class loginScreen extends State<login> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepOrangeAccent.withOpacity(0.6),
                Colors.black.withOpacity(0.2),
                Colors.black.withOpacity(0.2),
              ],
              begin: Alignment.topCenter,
            )),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 12,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "LOGIN",
                        style: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal),
                      ),
                      SizedBox(height: 70),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: <Widget>[
                            Material(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(20)),
                              elevation: 2,
                              child: AspectRatio(
                                aspectRatio: 7 / 1,
                                child: Center(
                                  child: TextFormField(
                                    style: TextStyle(color: Colors.black),
                                    controller: usernameController,
                                    decoration: InputDecoration(
                                      hintText: "Enter Username",
                                      hintStyle: TextStyle(color: Colors.black),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.all(8),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 16),
                              child: Material(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                                elevation: 2,
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                        child: AspectRatio(
                                          aspectRatio: 7 / 1,
                                          child: Center(
                                            child: TextFormField(
                                              style: TextStyle(color: Colors.black),
                                              controller: passwordController,
                                              obscureText: true,
                                              decoration: InputDecoration(
                                                hintText: "Enter Password",
                                                hintStyle:
                                                TextStyle(color: Colors.black),
                                                border: InputBorder.none,
                                                contentPadding: EdgeInsets.all(8),

                                              ),
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              width: MediaQuery.of(context).size.width,
                              child: MaterialButton(
                                onPressed: () async {
                                  loginControl();
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16),
                                ),
                                color: Color(0xFFFF7043),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                                padding: EdgeInsets.all(16),
                              ),
                            ),
                            SizedBox(height: 20),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(height: 20),
                            ElevatedButton.icon(
                                onPressed: (){
                                  },
                                icon: FaIcon(FontAwesomeIcons.google),
                                label: Text("Login With Google"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                          minimumSize: Size(100, 40),
                        ),
                      ),
                            Text("Or",
                              style: TextStyle(
                                  fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w500
                              )
                              ,),
                            ElevatedButton.icon(
                                onPressed:() async{
                                  final result = await Navigator.of(context).push(
                                    MaterialPageRoute(builder: (_) => emailLogin())
                                  );
                                } ,
                                icon: FaIcon(FontAwesomeIcons.envelope),
                                label: Text("Login With Email"),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              onPrimary: Colors.black,
                              minimumSize: Size(100, 40)
                            ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ]),
      ),
    );
  }
  loginControl() async{
    for(int i=0; i < DummyData.data.length;i++){
      try{
        if(DummyData.data[i]['username'] == usernameController &&
            DummyData.data[i]['password'] == passwordController){
          final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
          sharedPreferences.setString('nama',DummyData.data[i]['nama']);
        }
        Get.to(navBar());
      }catch(error){
        print(error);
      }
    }
  }
}
