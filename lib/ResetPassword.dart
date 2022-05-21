import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harvest/Deco_design.dart';
import 'package:harvest/Login_Page.dart';
import 'Constant_Colors.dart' as colors;

import 'InputboxClass.dart';
import 'HomePage.dart';

class Resetpassword extends StatefulWidget {
  const Resetpassword({Key? key}) : super(key: key);

  @override
  _Resetpassword createState() => _Resetpassword();
}

class _Resetpassword extends State<Resetpassword> {
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
        title: const Text("Reset Password "),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _globalkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: password,
                    keyboardType: TextInputType.text,
                    decoration:
                        buildInputDecoration(Icons.lock, "New Password"),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please a Enter New Password';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: confirmpassword,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration:
                        buildInputDecoration(Icons.lock, "Confirm Password"),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please re-enter password';
                      }
                      print(password.text);

                      print(confirmpassword.text);

                      if (password.text != confirmpassword.text) {
                        return "Password does not match";
                      }

                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.20,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.green,
                    onPressed: () {
                      if (_globalkey.currentState!.validate()) {
                        print("successful");
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                        return;
                      } else {
                        print("UnSuccessfull");
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Colors.green, width: 2)),
                    textColor: Colors.white,
                    child: Text("Reset"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
