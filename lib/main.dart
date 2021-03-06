import 'package:flutter/material.dart';
import 'screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portofolio Rangga',
      home: HomeScreen(),
      routes: {
        // HomeScreen.routeName: (ctx) => HomeScreen(),
      },
      theme: ThemeData(
        primaryColor: Color(0xFF6200EE),
      ),
    );
  }
}