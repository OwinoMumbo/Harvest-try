// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:shared_preferences/shared_preferences.dart';
import 'graph_data.dart';
import 'chart_model.dart';

import 'package:http/http.dart' as http;

import 'package:searchfield/searchfield.dart';


class filter_page extends StatefulWidget{

  const filter_page({Key? key}) : super(key: key);


  @override
  _filter createState() => _filter();
}



class _filter extends State<filter_page> {

  // final List<ProduceTimeline>data=[ //some data to display on the bar graph
  //   ProduceTimeline(months: "jan", quantity: 50, barColor: charts.ColorUtil.fromDartColor(Colors.green)),
  //   ProduceTimeline(months:"Feb",quantity:10, barColor: charts.ColorUtil.fromDartColor(Colors.green)),
  //   ProduceTimeline(months: "Mar", quantity: 30, barColor: charts.ColorUtil.fromDartColor(Colors.green)),
  //   ProduceTimeline(months:"Apr",quantity:15, barColor: charts.ColorUtil.fromDartColor(Colors.green)),

  // ];

  final List<ProduceTimeline>data = [];

  


  String monthValue="Select Months";
  String foodValue='Select Food';
  String typeValue='Select Type';

  var Type=[
    'Select Type',
    'Allium',
        'Berry',
        'Citrus',
        'Cruciferos',
        'Curcubit',
        'False Fruit',
        'Flower',
        'Leaf',
        'Legume',
        'Nightshade',
        'Nut',
        'Prome Fruit',
        'Root',
        'Seed',
        'Soft Herb',
        'Stalk',
        'Stone Fruit',
        'Vine Fruit',
        'Hard Herb'

  ];


  var food = [
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


  var month=[
    'Select Months',
    'This month',
    'Last 3 months',
    'Last 6 months',
    'Year'
  ];




  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(" My Log"),
        ),
      body:
      Padding(
        padding: const EdgeInsets.all(0.0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start, //position of column
          children: <Widget>[
            const SizedBox(height:20),

            ExpansionTile( //the tile that holds all the things under filter

              title: const Text("Filter",
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
            ),

                children: <Widget>[ //all under of expansion tile, i.e dropdowns
                  Column(
                    children: <Widget>[
                      
                      Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,//spaces between widgets
                       children:<Widget> [
                           const SizedBox(height: 15),

                         const Text(
                             'Time Period',
                             style:TextStyle(fontSize:15,fontWeight: FontWeight.bold,
                             )),

                         DropdownButton(   //for month
                               value: monthValue,
                               icon: const Icon(Icons.keyboard_arrow_down),

                               items: month.map((String item) {
                                 return DropdownMenuItem(
                                   value: item,
                                   child: Text(item),
                                 );
                               }).toList(),

                               onChanged: (String? newValue) {
                                 setState(() {
                                   monthValue = newValue!;
                                 });
                               }
                           ),
                       ],
                      ),

                      Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, //space between the widgets
                children:<Widget> [

                  const Text(
                      'Produce',
                      style:TextStyle(fontSize:15,fontWeight: FontWeight.bold,)
                  ),


                  DropdownButton(  //for Type
                      value: typeValue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: Type.map((String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          typeValue = newValue!;
                        });
                      }
                  ),


                  DropdownButton( //for the food list display
                      value: foodValue,
                      icon: const Icon(Icons.keyboard_arrow_down),

                      items: food.map((String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),

                      onChanged: (String? newValue) {
                        setState(() {
                          foodValue = newValue!;
                        });
                      }
                  ),
                ]
            )
                    ],
                  )
            ]

            ),

            SizedBox(height: 30),
            
            Container( //holds the bar chart
              height:400,
               padding: EdgeInsets.all(12),
              color: Colors.white70,
            ////  child: ConstrainedBox(//allow the box to change so that pie chart can fit in the box
                ///constraints: BoxConstraints(
                   /// minHeight: 100,

                ///),
                  child: Card(
                    child:Padding(
                        padding: EdgeInsets.all(0.0),
                       child: Column( // to display the heading of bar graph and the bar graph below
                         children: [
                           Text("Produce Data"), //title of bar graph

                           

                            Expanded(
                                child: graph(  //displaying the bar graph
                                  data: data,
                                ) ),
                         ],
                       )
                    ),

                  ),

              ),
            ///),
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

                              data.clear();

                              final prefs = await SharedPreferences.getInstance();
                              String farmer_id = prefs.getString('farmer_id')!;
                              String log_id = prefs.getString('log_id')!;
                              print('this is farmer id');
                              print(farmer_id);

                              print('this is log id');
                              print(log_id);

                              var monthV;

                              if(monthValue == 'Select Months'){
                                monthV = '7';
                              }
                              else if(monthValue == 'This month'){
                                monthV = '30';
                              }
                              else if(monthValue == 'Last 3 months'){
                                monthV = '90';
                              }
                              else if(monthValue == 'Last 6 months'){
                                monthV = '180';
                              }
                              else if(monthValue == 'Year'){
                                monthV = '365';
                              }
                              http.Response response = await http.post(Uri.parse("http://10.100.15.123/graph.php"),
                              body: ({
                                'items' : foodValue,
                                'log_id': log_id,
                                'period' : monthV
                                })
                              ); 

                              if(response.statusCode == 200){
                                print(response.body.toString().characters.characterAt(1));
                                if(response.body.toString().characters.characterAt(2) != '{'){
                                  List list = json.decode(response.body);
                                  print(list);



                                  for(var i =0;i < list.length ;i++){

                                    data.add(ProduceTimeline(months: list[i]['date'], quantity: int.parse(list[i]['weight']), barColor: charts.ColorUtil.fromDartColor(Colors.green)));

                                    print('added');

                                  }
                                  setState(() {});
                                  



                                }
                              }
                              
                            },
                            child: const Text("Apply flitter")),
                      ),
                    ),
          ],
      ),

      )
    );
  }}




// TODO Implement this library.