import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:progetto_m335_flutter/database/controller.dart';
import 'myApp.dart';
import 'dart:async';

Timer? timer;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  print("App started");
  Controller controller = Controller();
  timer = Timer.periodic(Duration(seconds: 60), (Timer t) => (
      controller.syncData()
  ));
}
