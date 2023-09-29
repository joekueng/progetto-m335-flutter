import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'myApp.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  print("App started");
}
