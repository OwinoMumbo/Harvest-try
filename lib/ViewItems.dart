import 'package:flutter/material.dart';



class ViewItems extends StatefulWidget{

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
    );
  }
}