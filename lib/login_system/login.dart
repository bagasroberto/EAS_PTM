// @dart=2.9

import 'package:eas/home.dart';
import 'package:flutter/material.dart';
import 'package:eas/login_system/background.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final myUsernameController = TextEditingController();
  final myPasswordController = TextEditingController();
  String _username, _password;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Background(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.only(top: 200.0)),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2661FA),
                        fontSize: 36),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(right: 10.0),
                  margin: EdgeInsets.symmetric(horizontal: 29),
                  child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Input Username';
                        }
                        return null;
                      },
                      controller: myUsernameController,
                      decoration: InputDecoration(labelText: "Username")),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(right: 10.0),
                  margin: EdgeInsets.symmetric(horizontal: 29),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Input Password';
                      }
                      return null;
                    },
                    controller: myPasswordController,
                    decoration: InputDecoration(labelText: "Password"),
                    obscureText: true,
                  ),
                ),
                Padding(padding: const EdgeInsets.only(top: 40.0)),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: RaisedButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      width: size.width * 0.5,
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(60.0),
                          color: Colors.blue),
                      padding: const EdgeInsets.all(0),
                      child: ElevatedButton(
                        child: Text("LOGIN",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        onPressed: () {
                          _username = myUsernameController.text;
                          _password = myPasswordController.text;

                          if (_formKey.currentState.validate()) {
                            if (_username != 'bagaskara') {
                              //print("username salah");
                            } else if (_password != '1927') {
                              //print("password salah");
                            } else {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return HomePage();
                              }));
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            fixedSize: const Size(300, 100),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
