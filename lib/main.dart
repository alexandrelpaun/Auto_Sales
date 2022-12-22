import 'package:flutter/material.dart';
import 'package:auto_sales_flutter/splash_screen.dart';
import 'package:auto_sales_flutter/cars/anunturi_masini.dart';
import 'package:auto_sales_flutter/home.dart';


void main() {
  runApp( AutoSales());
}

class AutoSales extends StatelessWidget {
  const AutoSales({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Auto_Sales',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Auto Sales'),
          ),
          body: SplashScreen(),
        ));
  }
}
