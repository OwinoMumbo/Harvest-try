import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';

class ProduceTimeline{ //model for chart
final String months;
final int quantity;
final charts.Color barColor;

ProduceTimeline({
  required this.months,
  required this.quantity,
  required this.barColor,
}
    );
}