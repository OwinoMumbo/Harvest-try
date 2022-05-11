// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:harvest/ViewLog.dart';
import 'package:harvest/create_log.dart';
import 'package:harvest/join_log.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:harvest/ViewLog.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Home Screen"),
      ),

      body: Padding(
        padding: EdgeInsets.only(
            top: /*MediaQuery.of(context).size.height * 0.15*/ 0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.80,
                child: Column(
                  children: [
                    SizedBox(height: 30),

                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.80,
                      height: 50,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30),
                        ),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                            ),
                            onPressed: () async {

                              final prefs = await SharedPreferences.getInstance();
                              String farmer_id = prefs.getString('farmer_id')!;
                              print('this is farmer id');
                              print(farmer_id);

                              http.Response response = await http.post(Uri.parse("http://10.100.15.123/viewlogs.php"),
                              body: ({
                                'farmerid' : farmer_id
                                })
                              ); 

                              if(response.statusCode == 200){
                                print(response.body.toString().characters.characterAt(1));
                                if(response.body.toString().characters.characterAt(2) != '{'){
                                  List list = json.decode(response.body);
                                  print(list);
                                  Navigator.push(context, MaterialPageRoute(builder: (context){return ViewLog(list);},),);
                                }
                              }
                              
                            },
                            child: const Text("View Logs")),
                      ),
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.80,
                      height: 50,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30),
                        ),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context){return const createL();},),);
                            },
                            child: const Text("Add New")),
                      ),
                    ), //sizedbox
                    SizedBox(height: 30),
                    // sizedbox
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.80,
                      height: 50,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30),
                        ),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context){return const joinL();},),);
                            },
                            child: const Text("Join Existing Log")),
                      ),
                    ), //sizedbox
                  ], //children
                ), //Column
              ), //sizedbox
            ], //children
          ), //column
        ), //center
      ), //padding
    );
  }
}
