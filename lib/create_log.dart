
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import 'join_log.dart';


class createL extends StatefulWidget{

  const createL({Key? key}) : super(key: key);

  @override
  _createL createState() => _createL();
}

class _createL extends State<createL>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.green,
        title: const Text("Create New Log"),
      ),

      body: Container(
        padding: EdgeInsets.only( top: /*MediaQuery.of(context).size.height * 0.15*/ 0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize : MainAxisSize.max,
            children:<Widget> [

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.80,
                child: Column(
                  children: [

                    SizedBox(height: 10),
                    const TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText:"Enter Log Name"
                      ),
                    ),
                    SizedBox(height: 10),
                    const TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter log location"
                      ),
                    ),
                    SizedBox(height: 10),
                    const TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter number of members"
                      ),
                    ),

                    SizedBox(height: 10),
                    const TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter your log code"
                      ),
                    ),

                    SizedBox(height: 30),


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
                                Navigator.push(context, MaterialPageRoute(builder: (context){return const joinL();},),);
                              },
                              child: const Text("CREATE LOG"),
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

      ),//padding



    );
  }
}