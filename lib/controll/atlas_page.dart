import 'package:flutter/material.dart';

import 'package:harvest/Constant_Colors.dart';
import 'package:harvest/Deco_design.dart';
import 'package:harvest/HomePage.dart';
//import 'package:harvest/Product.dart';

// ignore: camel_case_types
class atlas_page extends StatefulWidget {
  const atlas_page({Key? key}) : super(key: key);

  @override
  _atlas_page createState() => _atlas_page();
}

// ignore: camel_case_types
class _atlas_page extends State<atlas_page> {
  String? food, sowtime, planttime, name, email, phone, harvesttime, sun, pH;

  //TextController to read text entered in text field
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  final GlobalKey<FormState> _globalkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text("Atlas Page "),
          actions: [
            IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  showSearch(context: context, delegate: CustomSearch());
                })
          ]),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _globalkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //in the sprint description there was a picture, I am not sure if they were made available to us.
                const CircleAvatar(
                  radius: 70,
                  child: Text("FOOD PICTURE"),
                ),
                Center(
                    child: DataTable(
                  columns: const [
                    //table   columns for atlas
                    DataColumn(label: Text('Food')),
                    DataColumn(label: Text('Sow')),
                    DataColumn(label: Text('Plant')),
                    DataColumn(label: Text('Harvest')),
                    DataColumn(label: Text('Sun')),
                    DataColumn(label: Text('pH')),
                  ],
                  rows: const [
                    //information displaced deending on food selected
                    DataRow(cells: [
                      DataCell(Text('Almond')),
                      DataCell(Text('N/A')),
                      DataCell(Text('Late Winter')),
                      DataCell(Text('Autumn')),
                      DataCell(Text('Full Sun')),
                      DataCell(Text('Slightly Acidic to Neutral')),
                    ]),
                  ],
                )),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.80,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.green,
                    //link here the charts page
                    onPressed: () async {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Colors.green, width: 2)),
                    textColor: Colors.white,

                    child: Text("Go to Charts"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );

    TableRow buildRow(List<String> cells) => const TableRow(
        //children: cells.map((cell)) => Text
        );
  }
}

class CustomSearch extends SearchDelegate {
  List<String> allData = [
    'Almond',
    'Apple (Golden Delicious)',
    'Apple (Granny Smith)',
    'Artichoke',
    'Aubergine',
    'Basil',
    'Bean (Broad)',
    'Bean (Flat)',
    'Bean (Green)',
    'Bean (Yellow)',
    'Bean (Black)',
    'Bean (Black-Eyed)',
    'Bean (Purple)',
    'Beetroot',
    'Blackberry',
    'Blueberry',
    'Broccoli',
    'Butternut Squash',
    'Cabbage (Chinese)',
    'Cabbage (Purple)',
    'Carrot',
    'Cauliflower',
    'Cavolo Nero',
    'Celery',
    'Chilli (Birdseye)',
    'Chilli (Serrano)',
    'Chive',
    'Coriander',
    'Cucumber',
    'Curry Leaf',
    'Edible Flower',
    'Fennel',
    'Fig (Green)',
    'Fig (Purple)',
    'Gem Squash',
    'Ginger',
    'Gooseberry',
    'Granadilla',
    'Grape (Catawba)',
    'Grape (Hanepoot)',
    'Grape (Victoria)',
    'Grapefruit (Ruby)',
    'Jerusalem Artichoke',
    'Kale',
    'Kei Apple',
    'Leek',
    'Lemon',
    'Lemon Balm',
    'Lemon Verbena',
    'Lettuce',
    'Lime',
    'Marjoram',
    'Mint',
    'Mustard Leaf',
    'Naartjie',
    'Nasturtium',
    'Onion (Red)',
    'Onion (White)',
    'Orange (Cara Cara)',
    'Orange (Valencia)',
    'Oregano',
    'Parsley',
    'Pea',
    'Peach (White)',
    'Peach (Yellow)',
    'Pepper (Green California Wonder)',
    'Pepper (Red Santorini)',
    'Plum (Yellow)',
    'Plum (Red)',
    'Plum (Purple)',
    'Plum (Purple Leaf)',
    'Pumpkin (Boerpampoen)',
    'Pumpkin (Queensland Blue)',
    'Radish',
    'Rhubarb',
    'Rosemary',
    'Sage',
    'Shallot',
    'Sorrel',
    'Spinach',
    'Strawberry',
    'Sunflower Seed',
    'Sweet Potato (White)',
    'Sweet Potato (Orange)',
    'Thyme',
    'Tomato (Cherry)',
    'Tomato (Costoluto)',
    'Tomato (Floradade)',
    'Tomato (Moneymaker)',
    'Tomato (St. Pierre)',
    'Tomato (Yellow Baby)',
    'Turmeric',
    'Turnip',
    'Zucchini (Green)];'
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: RichText(
              text: TextSpan(
                  text: allData[index].substring(0, query.length),
                  style: const TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text: allData[index].substring(query.length),
                        style: const TextStyle(color: Colors.grey))
                  ]),
            ),
          );

          ItemCount:
          allData.length;
        });
  }
}
