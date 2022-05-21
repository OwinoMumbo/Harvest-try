import 'package:harvest/ResetPassword.dart';

import 'HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:harvest/Deco_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Constant_Colors.dart' as colors;

import 'InputboxClass.dart';
import 'Register_Page.dart';
import 'HomePage.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({Key? key}) : super(key: key);

  @override
  _Forgotpassword createState() => _Forgotpassword();
}

class _Forgotpassword extends State<Forgotpassword> {
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
        title: const Text("Forgot Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
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
                            return 'An E-mail is required to reset password.';
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
//link reset box
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.80,
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
                                      builder: (context) =>
                                          const Resetpassword()));
                              if (_globalkey.currentState!.validate()) {
                                //when email is in database
                                print("Link sent to Email ");
                                return;
                              } else {
                                //if the email is not in database
                                print("User not found");
                              }
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                side: const BorderSide(
                                    color: Colors.green, width: 2)),
                            textColor: Colors.white,
                            child: const Text("SEND RESET LINK "),
                            //sends link to the email of user to set new password(link to new password page)
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
