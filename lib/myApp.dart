import 'package:flutter/material.dart';
import 'navigation.dart';

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'My App',
      home: Navigation()
    );
  }
}