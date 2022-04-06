import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Constant_Colors.dart' as colors;

import 'InputboxClass.dart';

class RegisterPage extends StatefulWidget{
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPage createState() => _RegisterPage();


}

class _RegisterPage extends State<RegisterPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor:Colors.green,
        title: const Text("Register Page"),
      ),
      body: Padding(
        padding: EdgeInsets.only( top: /*MediaQuery.of(context).size.height * 0.15*/ 0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize : MainAxisSize.max,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.80,
                child: Column(
                  children: [

                    SizedBox(height: 10),
                    const TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText:"First Name"
                      ),
                    ),
                    SizedBox(height: 10),
                    const TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Last Name"
                      ),
                    ),
                    SizedBox(height: 10),
                    const TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Email"
                      ),
                    ),

                    SizedBox(height: 10),
                    const TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Password"
                      ),
                    ),

                    SizedBox(height: 10),
                    const TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Confirm Password"
                      ),
                    ),

                    SizedBox(height: 30),

                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.80,
                      height: 50,
                      child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(30),),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context){return const RegisterPage();},),);
                            },
                            child: const Text("REGISTER"),
                            // style: ElevatedButton.styleFrom(primary: Colors.black26,textStyle: const TextStyle(color: Colors.black,fontSize: 20,))
                          )
                      ),
                    ),//sizedbox
                  ],//children

                ),//Column


              ),//sizedbox

            ],//children

          ),//column

        ),//center

      ),//padd

    );
  }

}