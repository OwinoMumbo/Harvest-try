// import 'package:flutter/material.dart';
// //import 'package:dropdown_button2/dropdown_button2.dart';

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:harvest/addtolog.dart';
import 'package:harvest/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Constant_Colors.dart' as colors;

import 'package:http/http.dart' as http;

//String dropdownvalue = 'Select Food';

class AddToLog extends StatefulWidget {
  
  const AddToLog({Key? key}) : super(key: key);
  
  @override
	_AddToLog createState() => _AddToLog();
}

class _AddToLog extends State<AddToLog> {
//   // Initial Selected Value
  String dropdownvalue = 'Select Food';
  final GlobalKey<FormState> _globalkey = GlobalKey<FormState>();
  TextEditingController getWeight = TextEditingController();
  var weight;

//   // List of items in our dropdown menu
  var items = [
    'Select Food', 
    'Almond', 
    'Apple (Golden Delicious)', 
    'Apple (Granny Smith)', 
    'Artichoke', 'Edible Flower', 
    'Nasturtium', 'Aubergine', 
    'Chilli (Birdseye)', 
    'Chilli (Serrano)', 
    'Pepper (Green California Wonder)', 
    'Pepper (Red Santorini)', 
    'Tomato (Cherry)', 
    'Tomato (Costoluto)', 
    'Tomato (Floradade)', 
    'Tomato (Moneymaker)', 
    'Tomato (St. Pierre)', 
    'Tomato (Yellow Baby)', 
    'Basil', 
    'Coriander', 
    'Fennel', 
    'Lemon Balm', 
    'Mint', 
    'Parsley', 
    'Bean (Broad)', 
    'Bean (Flat)', 
    'Bean (Green)', 
    'Bean (Yellow)', 
    'Bean (Black)', 
    'Bean (Black-Eyed)', 
    'Bean (Purple)', 
    'Pea', 
    'Beetroot', 
    'Carrot', 
    'Ginger', 
    'Jerusalem Artichoke', 
    'Radish', 'Sweet Potato (White)', 'Sweet Potato (Orange)', 'Turmeric', 'Turnip', 'Blackberry', 'Blueberry', 'Gooseberry', 'Kei Apple', 'Strawberry', 'Broccoli', 'Cabbage (Chinese)', 'Cabbage (Purple)', 'Cauliflower', 'Cavolo Nero', 'Kale', 'Butternut Squash', 'Gem Squash', 'Cucumber', 'Pumpkin (Boerpampoen)', 'Pumpkin (Queensland Blue)', 'Zucchini (Green)', 'Celery', 'Rhubarb', 'Chive', 'Leek', 'Onion (Red)', 'Onion (White)', 'Shallot', 'Fig (Green)', 'Fig (Purple)', 'Granadilla', 'Grape (Catawba)', 'Grape (Hanepoot)', 'Grape (Victoria)', 'Grapefruit (Ruby)', 'Lemon', 'Lime', 'Naartjie', 'Orange (Cara Cara)', 'Orange (Valencia)', 'Lemon Verbena', 'Marjoram', 'Rosemary', 'Sage', 'Thyme', 'Lettuce', 'Mustard Leaf', 'Sorrel', 'Spinach', 'Peach (White)', 'Peach (Yellow)', 'Plum (Yellow)', 'Plum (Red)', 'Plum (Purple)', 'Plum (Purple Leaf)', 'Sunflower Seed'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add to Log"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            top: /*MediaQuery.of(context).size.height * 0.15*/ 0),
        child: Form(
          key: _globalkey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 30),
        
                      DropdownButton(
                        // Initial Value
        
                        value: dropdownvalue,
        
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),
        
                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
        
                      SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: getWeight,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                             hintText: "Weight in grams"),

                             validator: (String ? value){
                               if(value!.isEmpty){
                                 return 'Enter valid weight in grams';
                               }
                               return null;
                             },
                      ),
                      SizedBox(height: 30),
        
        
                      SizedBox(height: 30),
                      SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.80,
                        height: 50,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                          child: ElevatedButton(
                              onPressed: () async {
                                
                                final prefs = await SharedPreferences.getInstance();
                                final String? log_id = prefs.getString('log_id'); 

                                print('the log id in addlog page');

                                bool valid = true;

                                if(dropdownvalue.startsWith('Select')){
                                  valid = false;
                                  Fluttertoast.showToast(msg: 'Please select valid food',toastLength: Toast.LENGTH_SHORT, backgroundColor: Colors.red,gravity: ToastGravity.BOTTOM,);
                                }

                                if(_globalkey.currentState!.validate() && (valid == true)){
                                  weight = getWeight.text;

                                  print(dropdownvalue);
                                  print(log_id);

                                  print('weight');
                                  print(weight);

                                  http.Response response = await http.post(Uri.parse("http://10.100.15.123/inseettolog.php"),
                                      body: ({
                                        'log_id' : log_id,
                                        'items' : dropdownvalue,
                                        'weight' : weight
                                      })
                                  );

                                  if(response.statusCode == 200){
                                    if(response.body.startsWith('s')){
                                      Fluttertoast.showToast(msg: response.body,toastLength: Toast.LENGTH_SHORT, backgroundColor: Colors.red,gravity: ToastGravity.BOTTOM,);
                                    }
                                  }
                                }
                                

                                //Navigator.push(context, MaterialPageRoute(builder: (context){return const NameOfThePage();},),);
                              },
                              child: const Text("ADD")),
                        ),
                      ), //sizedbox
        
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
