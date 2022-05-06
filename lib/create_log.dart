
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'join_log.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';


class createL extends StatefulWidget{

  const createL({Key? key}) : super(key: key);

  @override
  _createL createState() => _createL();
}

var LogName;

class _createL extends State<createL>{

  TextEditingController logname = TextEditingController();
  final GlobalKey<FormState> _globalkey = GlobalKey<FormState>();

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
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: logname,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText:"Enter Log Name"
                      ),
                      validator: (String? value){
                        if(value!.isEmpty){
                          return 'enter valid log name';
                        }
                        return null;
                      }
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
                              onPressed: () async {
                                if (_globalkey.currentState!.validate()) {
                                  LogName = logname.text;


                                  final prefs = await SharedPreferences.getInstance();
                                  final String? farmer_id = prefs.getString('farmer_id');

                                  print(farmer_id);


                                  var finalRes;
                                  http.Response response = await http.post(Uri.parse("http://10.100.15.123/createlog.php"),
                                      body: ({
                                        'log_name': LogName,
                                        'farmer_id' : farmer_id
                                      })

                                  );
                                  if(response.statusCode == 200){
                                    finalRes = response.body;
                                    print(finalRes);
                                  }

                                  Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return const joinL();
                                    },),);
                                }
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