import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:harvest/Deco_design.dart';
import 'package:harvest/Login_Page.dart';
import 'package:http/http.dart';
import 'Constant_Colors.dart' as colors;

import 'InputboxClass.dart';
import 'HomePage.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPage createState() => _RegisterPage();
}
var finalResponse;
var ValidResponse;

var fistName,lastName,email,phone,finalPassword;

Future doRegister() async{

  String url = "http://10.100.15.123/register.php";
  final response = await http.post(Uri.parse(url),
      body:({
        'email': email,
        'name': fistName,
        'surname' : lastName,
        'contact' : phone,
        'password' :finalPassword
      }));

  if(response.statusCode == 200){

    if(response.body.startsWith('Email')){
      Fluttertoast.showToast(msg: response.body,toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.red,gravity: ToastGravity.BOTTOM,);
    }
    else{
      ValidResponse = response.body;
    }
  }
  else{
    finalResponse = 'error';
  }

}


class _RegisterPage extends State<RegisterPage> {


  //TextController to read text entered in text field
  TextEditingController getName = TextEditingController();
  TextEditingController getSurname = TextEditingController();
  TextEditingController getContactNo = TextEditingController();
  TextEditingController getEmail = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();


  final GlobalKey<FormState> _globalkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Registration Page"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _globalkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  child: const Text("LOGO"),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: getName,
                    decoration: buildInputDecoration(Icons.person, "First Name"),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please Enter first name';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: getSurname,
                    decoration: buildInputDecoration(Icons.person, "Last Name"),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please Enter last name';
                      }
                      return null;
                    },

                  ),
                ),


                Padding(
                  padding:
                  const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: getEmail,
                    decoration: buildInputDecoration(Icons.email, "Email"),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'An E-mail is required to register.';
                      }
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
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
                  padding:
                  const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: getContactNo,
                    decoration: buildInputDecoration(Icons.phone, "Phone No"),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Phone number is required to register. ';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: password,
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(Icons.lock, "Password"),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please a Enter Password';
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
                      //print(password.text);

                      //print(confirmpassword.text);

                      if (password.text != confirmpassword.text) {
                        return "Password does not match";
                      }

                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.80,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.green,
                    onPressed: () {
                      if (_globalkey.currentState!.validate()) {

                        fistName = getName.text;
                        lastName = getSurname.text;
                        email = getEmail.text;
                        phone = getContactNo.text;
                        finalPassword = confirmpassword.text;

                        print(fistName);
                        print(lastName);

                        doRegister();

                        if(ValidResponse != null){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        }

                        return;
                      } else {
                        print("UnSuccessfull");
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Colors.green, width: 2)),
                    textColor: Colors.white,
                    child: Text("Register"),
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