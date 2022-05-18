
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';



class joinL extends StatefulWidget{

  const joinL({Key? key}) : super(key: key);

  @override
  _joinL createState() => _joinL();
}

class _joinL extends State<joinL>{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.green,
        title: const Text("Join Log"),
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
                    TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText:"Enter Log Name"
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText:"Enter Log code"
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
                              //Navigator.push(context, MaterialPageRoute(builder: (context){return const NameOfThePage();},),);
                            },

                            child: const Text("JOIN")),
                      ),
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