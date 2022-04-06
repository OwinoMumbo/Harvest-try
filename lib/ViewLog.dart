import 'package:flutter/material.dart';



class ViewLog extends StatefulWidget{

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
    );
  }
}