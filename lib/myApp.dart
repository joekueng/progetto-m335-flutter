import 'package:flutter/material.dart';
import 'navigation.dart';

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        useMaterial3: true, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.orange, primary: Colors.blueAccent, background: Colors.white),
      ),
      home: Navigation()
    );
  }
}