// import 'package:flutter/material.dart';
// //import 'package:dropdown_button2/dropdown_button2.dart';

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:harvest/addtolog.dart';
import 'package:harvest/main.dart';
import 'Constant_Colors.dart' as colors;



String dropdownvalue = 'Select Food';

class AddToLog extends StatelessWidget {
  const AddToLog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter DropDownButton',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//   // Initial Selected Value
  String dropdownvalue = 'Select Food';


//   // List of items in our dropdown menu
  var items = [
    'Select Food',
    'Almond',
    'Apple',
    'Artichoke',
    'Abergine',
    'Basil',
    'Bean',
    'Beetroot',
    'Blackberry',
    'Blueberry',
    'Broccoli',
    'Butternut',
    'Cabbage',
    'Carrot',
    'Cauliflower',
    'Colovo Nero',
    'Celery',
    'Chilli(Birdseye)',
    'Chilli(Serrano)',
    'Coriander',
    'Cucumber',
    'Curry',
    'Curry Leaf',
    'Edible Flower',
    'Fennel',
    'Gooseberry',
    'Granadilla',
    'Grape',
    'Grapefruit',
    'Jerusalem Artichoke',
    'Kale',
    'Kei Apple',
    'Leek',
    'Lemon',
    'Marjoram',
    'Mint',
    'Naartjie',
    'Nasturtium',
    'Orange',
    'Peach',
    'Plum',
    'Pumpkin',
    'Radish',
    'Rhubarb',
    'Rosemary',
    'Sage',
    'Shallot',
    'Sorrel',
    'Spinach',
    'Strawberry',
    'Sunflower seed',
    'Sweet Potatoe',
    'Thyme',
    'Tomatoe',
    'Tumeric',
    'Turntip',
    'Zucchini'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add to Log"),
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
            const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText:"Weight"
              ),
            ),
            SizedBox(height: 30),

            SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText:"Date"
              ),
            ),

            SizedBox(height: 30),
            SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText:"Quantity"
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
                    onPressed: () {
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
    );
  }
}
