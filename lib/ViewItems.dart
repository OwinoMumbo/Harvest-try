import 'package:flutter/material.dart';

class ViewItems extends StatefulWidget {
  const ViewItems({Key? key}) : super(key: key);

  @override
  _ViewItems createState() => _ViewItems();
}

class _ViewItems extends State<ViewItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("View Items"),
      ),
      body: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Name of log", // must mention on which log are you viewing the items
            textScaleFactor: 2,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(
            // textDirection: TextDirection.rtl,
            // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
            // border:TableBorder.all(width: 2.0,color: Colors.red),
            children: [
              TableRow(children: [
                Text(
                  "Date",
                  textScaleFactor: 1.5,
                ),
                Text("Food", textScaleFactor: 1.5),
                Text("Weight", textScaleFactor: 1.5),
                Text("Quantity", textScaleFactor: 1.5),
                //Text("Weight",textScaleFactor: 1.5),
              ]),

// need a forloop to loop through what we get from the database maybe json array returned by php
              TableRow(children: [
                Text(
                  "01-02-22",
                  textScaleFactor: 1.5,
                ),
                Text("Maize", textScaleFactor: 1.5),
                Text("50kg", textScaleFactor: 1.5),
                Text(" 5 ,10kg sacks ", textScaleFactor: 1.5),
                //Text("Weight",textScaleFactor: 1.5),
              ]),

              TableRow(children: [
                Text(
                  "01-03-22",
                  textScaleFactor: 1.5,
                ),
                Text("Rice", textScaleFactor: 1.5),
                Text("40kg", textScaleFactor: 1.5),
                Text(" 8 ,5kg sacks ", textScaleFactor: 1.5),
                //Text("Weight",textScaleFactor: 1.5),
              ]),
            ],
          ),
        ),
      ]),
    );
  }
}
