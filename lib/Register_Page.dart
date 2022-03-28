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
      //backgroundColor: const Color.fromARGB(255, 78, 113, 165),
      backgroundColor:  colors.AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Center(
          child: SingleChildScrollView(
            
            child: Column(
              children: [

              const SizedBox( height: 10,),

              SizedBox(
                //width: 300,
                width: MediaQuery.of(context).size.width * 0.80,
                //height: MediaQuery.of(context).size.height * 0.1,
                child: Column(
                  children: <Widget>[
                    // const Padding(padding: EdgeInsets.only(top: 20)),

                    // Input for user email
                    Positioned(
                      child: DetailsInputBox(hintText: "Email",prefixIcon: Icon(Icons.email,color: colors.AppColors.iconColor,)),
                    ),

                    const SizedBox( height: 10,),

                    // Input for the users first name
                    Positioned(
                      child: DetailsInputBox(hintText: "First name",prefixIcon: Icon(Icons.drive_file_rename_outline,color: colors.AppColors.iconColor,)),
                    ),

                    const SizedBox( height: 10,),

                    // Input for the users last name
                    Positioned(

                      child: DetailsInputBox(hintText: "Last name",prefixIcon: Icon(Icons.drive_file_rename_outline,color: colors.AppColors.iconColor,)),
                    ),

                    const SizedBox( height: 10,),

                    // Input for the users Id number
                    Positioned(
                      child: DetailsInputBox(hintText: "Cellphone number",prefixIcon: Icon(Icons.phone_android_outlined,color: colors.AppColors.iconColor,)),
                    ),

                    const SizedBox( height: 10,),

                    //const Padding(padding: EdgeInsets.only(top: 15,)),
                    const Positioned(
                      child: PasswordInputBox(hintText: "Password",),

                    ),

                    const SizedBox( height: 10,),

                    const Positioned(
                      child: PasswordInputBox(hintText: "Confirm Password",),

                    ),

                    const SizedBox( height: 30,),


                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.80,
                      height: 50,
                      child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(30),),
                          child: ElevatedButton(
                              onPressed: () {
                                //Navigator.push(context, MaterialPageRoute(builder: (context){return const NameOfThePage();},),);
                              },
                              child: const Text("REGISTER"),
                              style: ElevatedButton.styleFrom(primary: Colors.black26,textStyle: const TextStyle(color: Colors.black,fontSize: 20,))
                          )
                      ),
                    ),

                  ],
                ),


              ),

          ],
            ),
            
          ),

        )

     
     
      ),
    );
  }

}