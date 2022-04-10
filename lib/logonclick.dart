// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Add to log',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: MyHomePage(title: 'Add to Log'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);
//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   ScrollController listScrollController = ScrollController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),

//       // Floating action button implemented with the
//       // auto scroll function to the bottom of list
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           if (listScrollController.hasClients) {
//             final position = listScrollController.position.maxScrollExtent;
//             listScrollController.animateTo(
//               position,
//               duration: Duration(seconds: 3),
//               curve: Curves.easeOut,
//             );
//           }
//         },
//         isExtended: true,
//         tooltip: "Scroll to Bottom",
//         child: Icon(Icons.arrow_downward),
//       ),

//       // ListView with 100 list items
//       body: ListView.builder(
//         // Scroll Controller for functionality
//         controller: listScrollController,
//         itemCount: 100,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text("Item ${index + 1}"),
//           );
//         },
//       ),
//     );
//   }
// }
