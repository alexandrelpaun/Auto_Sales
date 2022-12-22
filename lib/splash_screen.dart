import 'package:auto_sales_flutter/home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) =>  Home(),
          ),
          (route) =>
              false); //am scos toate ecranele si am adaugat ecranul cu anunturi
    });

   
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10.0),
            child: Image.asset('assets/logo.png'),
          ),
          const Positioned(
            bottom: 40.0,
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
