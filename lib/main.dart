import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '物联网导论作业', initialRoute: '/info', routes: RoutePath);
  }
}

