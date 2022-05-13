// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:harvest/main.dart';

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    tester.runAsync(() async{
      when(valueRepository.getValues())
        .thenAnswer((_) => Future.delayed(Duration(seconds: 30), ()=> []));
    await tester.pumpWidget(MyApp(ValueListPage(
      valueRepository: valueRepository,
    )));
    
      await tester.pumpAndSettle(
        Duration(seconds: 10), EnginePhase.build, Duration(minutes: 1));
      
      expect(find.byType(CircularProgressIndicator), findOneWidget);
    
  },);
  },
   );
