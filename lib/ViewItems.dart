import 'package:flutter/material.dart';
import 'package:harvest/addtolog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'MyLog.dart';

// class ViewItems extends StatefulWidget {
//   const ViewItems(List logData, {Key? key}) : super(key: key);

//   @override
//   _ViewItems createState() => _ViewItems();
// }


class ViewItems extends StatelessWidget{

const ViewItems(this.logData);
final List logData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("View Items"),
      ),
      body: Center(
        child: ListView(children: <Widget>[
           Center(
             child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                logData[0]['items'], // must mention on which log are you viewing the items
                textScaleFactor: 2,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
          ),
           ),

          Center(
            child: SizedBox(
						width: MediaQuery.of(context).size.width * 0.80,
						height: 50,
						child: ClipRRect(
							borderRadius: const BorderRadius.all(Radius.circular(30),),
							child: ElevatedButton(
								style: ElevatedButton.styleFrom(
									primary: Colors.green,
								),
								onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    final String? farmer_id = prefs.getString('farmer_id');
                    print(';og id');
                    final String? log_id = prefs.getString('log_id'); 

                    print(log_id);
                    
                    Navigator.push(context,MaterialPageRoute(builder: (context) => const AddToLog()),);
		
								},
								child: const Text("Add to log"),
								 // style: ElevatedButton.styleFrom(primary: Colors.black26,textStyle: const TextStyle(color: Colors.black,fontSize: 20,))
							)
						),
					),
          ),

          SizedBox(height: 30),

          Center(
            child: SizedBox(
						width: MediaQuery.of(context).size.width * 0.80,
						height: 50,
						child: ClipRRect(
							borderRadius: const BorderRadius.all(Radius.circular(30),),
							child: ElevatedButton(
								style: ElevatedButton.styleFrom(
									primary: Colors.green,
								),
								onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    final String? farmer_id = prefs.getString('farmer_id');
                    print(';og id');
                    final String? log_id = prefs.getString('log_id'); 
                    
                    Navigator.push(context,MaterialPageRoute(builder: (context) =>  filter_page()),);
		
								},
								child: const Text("Analyse"),
								 // style: ElevatedButton.styleFrom(primary: Colors.black26,textStyle: const TextStyle(color: Colors.black,fontSize: 20,))
							)
						),
					),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DataTable(
              columns: const [
                DataColumn(label: Text('FOOD',textScaleFactor: 2.0,)),
                DataColumn(label: Text('WEIGHT',textScaleFactor: 2.0,)),

            ],
            rows: logData.map((e) => DataRow(cells: [
              DataCell(Text(e['items'],textScaleFactor: 1.2,)),
              DataCell(Text(e['weight'] + ' g',textScaleFactor: 1.2,))
            ])
            
            ).toList(),
            
            ),
          ),
        ]),
      ),
    );
  }
}