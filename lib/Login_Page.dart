import 'dart:convert';
// ignore: unused_import
//import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:harvest/Deco_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:toast/toast.dart';
import 'Constant_Colors.dart' as colors;

import 'Register_Page.dart';
import 'HomePage.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _Login createState() => _Login();
}

var email, password;
var ValidResponse;

bool te = false;
// Future singin() async{
//   var finalResponse;
//   http.Response response = await http.post(Uri.parse("http://10.100.15.123/login.php"),
//       body: ({
//         'email' : email,
//         'password' : password
//       }
//       )
//   );
//   if(response.statusCode == 200){
//     finalResponse = response.body;
//     if(finalResponse.startsWith("I")){
//       Fluttertoast.showToast(msg: finalResponse,toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.red,gravity: ToastGravity.BOTTOM,);
//     }
//     else{
//       ValidResponse = response.body;
//     }
//   }
//   else{
//     finalResponse = "error";
//   }
// }

class _Login extends State<Login> {
  //TextController to read text entered in text field
  TextEditingController getEmail = TextEditingController();
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
        padding: const EdgeInsets.only(top: 0),
        child: Form(
          key: _globalkey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                          keyboardType: TextInputType.emailAddress,
                          controller: getEmail,
                          decoration:
                              buildInputDecoration(Icons.email, "Email"),
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
                          // onSaved: (String? value) {
                          //   email = value;
                          // },
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
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 30),

                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 50,
                        child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(30),
                            ),
                            child: RaisedButton(
                              color: Colors.greenAccent,
                              onPressed: () async {
                                print('click');
                                if (_globalkey.currentState!.validate()) {
                                  email = getEmail.text;
                                  password = confirmpassword.text;

                                  bool te = true;

                                  var finalResponse;
                                  http.Response response = await http.post(
                                      Uri.parse(
                                          "http://10.100.15.123/login.php"),
                                      body: ({
                                        'email': email,
                                        'password': password
                                      }));
                                  if (response.statusCode == 200) {
                                    finalResponse = response.body;
                                    print('startValue');
                                    print(finalResponse
                                        .toString()
                                        .characters
                                        .characterAt(1));
                                    print(finalResponse
                                            .toString()
                                            .characters
                                            .characterAt(1) !=
                                        'I');
                                    if (finalResponse
                                            .toString()
                                            .characters
                                            .characterAt(1) ==
                                        'I' /*||finalResponse.toString().characters.characterAt(1) != '{'*/) {
                                      print('helloworld');
                                      te = false;
                                      Fluttertoast.showToast(
                                        msg: finalResponse,
                                        toastLength: Toast.LENGTH_LONG,
                                        backgroundColor: Colors.red,
                                        gravity: ToastGravity.BOTTOM,
                                      );
                                    }
                                    if (finalResponse
                                            .toString()
                                            .characters
                                            .characterAt(1) !=
                                        '{') {
                                      ValidResponse = response.body;
                                    }
                                  }

                                  print('the following is response');
                                  print(ValidResponse);

                                  print('the following is bool');
                                  print(te);

                                  if (te == true) {
                                    print('the following is json data');
                                    var jd = json.decode(ValidResponse);
                                    print(jd['farmer_id'][0]);
                                    final prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setString(
                                        'farmer_id', jd['farmer_id'][0]);

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()),
                                    );
                                  }

                                  return;
                                } else {
                                  print("UnSuccessfull");
                                }
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  side: const BorderSide(
                                      color: Colors.green, width: 2)),
                              textColor: Colors.white,
                              child: const Text("LOGIN"),
                              // style: ElevatedButton.styleFrom(primary: Colors.black26,textStyle: const TextStyle(color: Colors.black,fontSize: 20,))
                            )),
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
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
                                  side: const BorderSide(
                                      color: Colors.green, width: 2)),
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
            ),
          ), //column
        ), //center
      ), //padding
    );
  }
}
