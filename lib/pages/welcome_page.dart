import 'package:flutter/material.dart';


class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pagina di benvenuto',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Benvenuto'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Benvenuto nella pagina di benvenuto!'),
              SizedBox(height: 20),
              Text('Clicca sul pulsante per continuare'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text('Continua'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
