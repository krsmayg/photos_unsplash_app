import 'package:flutter/material.dart';
import './route_generator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      initialRoute: '/',
      theme: ThemeData(fontFamily: 'Poppins'),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
