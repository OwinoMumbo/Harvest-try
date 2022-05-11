import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'chart_model.dart';

class graph extends StatelessWidget{

final List<ProduceTimeline>data;

graph({required this.data});

@override

  Widget build(BuildContext context) {

  List<charts.Series<ProduceTimeline,
  String>>series=[
   charts.Series(
     id: 'My Produce',
     data: data,
     domainFn: (ProduceTimeline series,_)=>series.months, //x axis
     measureFn: (ProduceTimeline series,_)=>series.quantity, //y axis of graph
   )
  ];
    return charts.BarChart(series, animate: true);

  }
}
