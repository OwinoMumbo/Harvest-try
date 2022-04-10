import 'package:flutter/material.dart';

class ViewLog extends StatefulWidget {
  const ViewLog({Key? key}) : super(key: key);

  @override
  _ViewLog createState() => _ViewLog();
}

class _ViewLog extends State<ViewLog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Existing Logs"),
      ),
      body: ListView.separated(
        reverse: true,
        itemBuilder: (context, position) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Log  $position ',
              ),
            ),
          );
        },
        separatorBuilder: (context, position) {
          return Card(
            color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'Log Name', // take actual name  from database
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
        itemCount:
            10, //instead of this take the size of the json array returned by the php
      ),
    );
  }
}
