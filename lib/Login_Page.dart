// ignore: file_names
//ignore : prefer_const_constructors
import 'package:flutter/material.dart';
import 'Constant_Colors.dart' as colors;
import 'create_log.dart';
import 'InputboxClass.dart';
import 'Register_Page.dart';



class Login extends StatefulWidget{
  
  const Login({Key? key}) : super(key: key);

  @override
  _Login createState() => _Login();

}

class _Login extends State<Login>{

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: colors.AppColors.backgroundColor,

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
                        DetailsInputBox(hintText: "Email",prefixIcon: Icon(Icons.email,color: colors.AppColors.iconColor,)),

                        SizedBox(height: 10),

                        const Positioned(
                          child: PasswordInputBox(hintText: "Password",),
                        ),

                        SizedBox(height: 30),

                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.80,
                          height: 50,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(30),),
                              child: ElevatedButton(
                                onPressed: () {
                                 Navigator.push(context, MaterialPageRoute(builder: (context){return const createL();},),);
                              },

                              child: const Text("LOGIN")),
                         ),
                       ),//sizedbox

                       SizedBox(height: 30), 
                      
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.80,
                        height: 50,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(30),),
                              child: ElevatedButton(
                                  onPressed: () {
                                   Navigator.push(context, MaterialPageRoute(builder: (context){return const RegisterPage();},),);
                                },
                              child: const Text("REGISTER"),
                              style: ElevatedButton.styleFrom(primary: Colors.black26,textStyle: const TextStyle(color: Colors.black,fontSize: 20,))
                              )
                         ),
                         ),//sizedbox

                        SizedBox(height: 30), 

                        const InkWell(
                          child: Text("Forgot your password, reset Here!",style: TextStyle(color: Colors.blue,),),
                            //sizedbox
                          //onTap: (){
                          //Navigator.push(context, MaterialPageRoute(builder: (context){return const NameOfThePage();},),);
                          //},
                        ),//sizedbox

                      ],//children

                    ),//Column


                  ),//sizedbox

                ],//children

            ),//column

         ),//center

       ),//padding


     
     );

  }

}