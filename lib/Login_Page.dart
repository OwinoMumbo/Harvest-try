import 'package:flutter/cupertino.dart';
import 'package:harvest/Deco_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Constant_Colors.dart' as colors;

import 'InputboxClass.dart';
import 'Register_Page.dart';
import 'HomePage.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  String? name, email, phone;

  //TextController to read text entered in text field
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  final GlobalKey<FormState> _globalkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Login Page"),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: /*MediaQuery.of(context).size.height * 0.15*/ 0),
        child: Form(
          key: _globalkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.80,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15, left: 10, right: 10),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: buildInputDecoration(Icons.email, "Email"),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'An E-mail is required to Login.';
                          }
                          if (!RegExp(
                                  "^[a-z,A-Z,0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value)) {
                            return 'Please a valid E-mail';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          email = value;
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15, left: 10, right: 10),
                      child: TextFormField(
                        controller: confirmpassword,
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        decoration:
                            buildInputDecoration(Icons.lock, "Password"),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please re-enter password';
                          }
                          print(password.text);

                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 30),

                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.20,
                      height: 50,
                      child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                          child: RaisedButton(
                            color: Colors.greenAccent,
                            onPressed: () {
                              if (_globalkey.currentState!.validate()) {
                                print("successful");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                );
                                return;
                              } else {
                                print("UnSuccessfull");
                              }
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                side:
                                    BorderSide(color: Colors.green, width: 2)),
                            textColor: Colors.white,
                            child: const Text("LOGIN"),
                            // style: ElevatedButton.styleFrom(primary: Colors.black26,textStyle: const TextStyle(color: Colors.black,fontSize: 20,))
                          )),
                    ),

                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.20,
                      height: 50,
                      child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                          child: RaisedButton(
                            color: Colors.greenAccent,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterPage()));
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                side:
                                    BorderSide(color: Colors.green, width: 2)),
                            textColor: Colors.white,
                            child: const Text("SIGN UP"),
                            // style: ElevatedButton.styleFrom(primary: Colors.black26,textStyle: const TextStyle(color: Colors.black,fontSize: 20,))
                          )),
                    ),

                    //sizedbox
                  ], //children
                ), //Column
              ),

              //sizedbox
            ], //children
          ), //column
        ), //center
      ), //padding
    );
  }
}
