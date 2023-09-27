import 'package:flutter/material.dart';

class TestUI extends StatefulWidget {
  const TestUI({super.key});

  @override
  State<TestUI> createState() => _TestUIState();
}

class _TestUIState extends State<TestUI> {
  int _test = 0;

  void _onPressed() {
    setState(() {
      _test = 1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          FloatingActionButton(onPressed: _onPressed),
          Text('$_test'),
        ],),
      ),
    );
  }
}
