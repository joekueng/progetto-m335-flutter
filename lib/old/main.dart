/*
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import '../pages/welcome_page.dart';
import '../pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.red,
          accentCoulor: Colors.blue,
          fontFamily: 'Roboto',
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 24),
            headline2: TextStyle(fontSize: 20),
            headline3: TextStyle(fontSize: 16),
          )),
      // Cambia la proprietà `home` con `WelcomePage()`
      home: WelcomePage(),
      // Aggiungi un nuovo `onGenerateRoute`
      onGenerateRoute: (settings) {
        // Se la route è `/home`, esci dal `WelcomePage()` e vai alla `HomePage()`
        if (settings.name == '/home') {
          Navigator.pop(context);
          return MaterialPageRoute(
              builder: (context) => const HomePage(
                    title: 'Titolo',
                  ));
        }
        // Altrimenti, restituisci la route predefinita
        return MaterialPageRoute(builder: (context) => WelcomePage());
      },
    );
  }
 }  */