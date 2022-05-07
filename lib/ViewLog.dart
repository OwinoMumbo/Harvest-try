import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ViewLog extends StatefulWidget {
  const ViewLog({Key? key}) : super(key: key);

  @override
  _ViewLog createState() => _ViewLog();
}



class _ViewLog extends State<ViewLog> {
    var ValidResponse;
    late List list;
    late String farmer_id;

    @override
    void initState(){
       super.initState();  
        _log();

   }
   Future _log() async{
       final prefs = await SharedPreferences.getInstance();
       farmer_id = prefs.getString('farmer_id')!;

    //    print(farmer_id);
      // var finalRes;
       http.Response response = await http.post(Uri.parse("http://10.100.15.123/viewlogs.php"),
        body: ({
		'farmerid' : farmer_id
	    })
        );
        if(response.statusCode == 200){
            //finalRes = response.body;
            if(response.body.toString().characters.characterAt(1) != '{'){
                list = json.decode(response.body);

                
                //List j = json.decode(response.body)['results'].map((data) => viewLogDetails.ExtractJson(data)).toList();
                // ValidResponse = json.decode(response.body);
                // print(ValidResponse[0]);
                // print('this is j');
                // print(viewLogDetails.ExtractJson(ValidResponse[0]).logJoinCode);
                // print('response size');
                // print(ValidResponse.length);
                // print('this is list');
                // print(list);
            }
        }
   }
  @override
  Widget build(BuildContext context) {
      _log();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Existing Logs"),
      ),
      body: ListView.builder(
          itemBuilder: (BuildContext , position){
            return Card(
                color: Colors.grey,
                child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                    'Log name: ' + list[position]['log_name'] + ' Join code: ' + list[position]['logjoincode'], // take actual name  from database
                    style: const TextStyle(color: Colors.white),
                ),
                ),
            );
          },
          // ignore: unnecessary_null_comparison
          itemCount: list.isEmpty ? 0 : list.length,
          
        ),
    //   body: ListView.separated(
    //     reverse: false,
    //     itemBuilder: (context, position) {
    //     return Card(
    //         color: Colors.grey,
    //         child: Padding(
    //           padding: EdgeInsets.all(20.0),
    //           child: Text(
    //             list[position]['log_name'], // take actual name  from database
    //             style: TextStyle(color: Colors.white),
    //           ),
    //         ),
    //       );
    //     },
    //     separatorBuilder: (context, position) {
    //     return Card(
    //         child: Padding(
    //           padding: const EdgeInsets.all(15.0),
    //           child: Text(
    //             list[position]['logjoincode'],
    //           ),
    //         ),
    //       );

    //     },
    //     // ignore: unnecessary_null_comparison
    //     itemCount: list == null ? 0 : list.length, //instead of this take the size of the json array returned by the php
    //   ),
    );
  }
}

class viewLogDetails{
    final String logName;
    final String logJoinCode;

    viewLogDetails(
        this.logName,
        this.logJoinCode
    );
    viewLogDetails.ExtractJson(Map<String, dynamic> json)
        :logName = json['log_name'],
         logJoinCode = json['logjoincode'];
}
