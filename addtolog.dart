// import 'package:flutter/material.dart';
// //import 'package:dropdown_button2/dropdown_button2.dart';

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:harvest/addtolog.dart';
import 'package:harvest/main.dart';
import 'Constant_Colors.dart' as colors;

void main() {
  runApp(const MyApp());
}

String dropdownvalue = 'Select Food';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
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
  String dropdownvalue2 = 'Select Type';

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
    'Chive'
  ];
  var types = ['leaves', 'itype', 'ne type', 'Select Type'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add to Log"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            DropdownButton(
              // Initial Value
              value: dropdownvalue2,

//                   // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

//                   // Array list of items
              items: types.map((String types) {
                return DropdownMenuItem(
                  value: types,
                  child: Text(types),
                );
              }).toList(),
//                   // After selecting the desired option,it will
//                   // change button value to selected value
              onChanged: (String? newValue2) {
                setState(() {
                  dropdownvalue2 = newValue2!;
                });
              },
            ), // close drop down value
          ],
        ),
      ),
    );
  }
}
