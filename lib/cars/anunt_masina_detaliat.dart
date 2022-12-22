import 'dart:math';

import 'package:auto_sales_flutter/cars/formular_cars.dart';
import 'package:flutter/material.dart';

class Anunt extends StatelessWidget {
  Anunt(
      {super.key,
      this.imageCars,
      this.titleCars,
      this.descriptionCars});

  Image? imageCars;
  String? titleCars;
  String? descriptionCars;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleCars ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            imageCars!,
            Text(titleCars ?? ''),
            Text(descriptionCars ?? ''),
            const SizedBox(
              height: 50,
            ),
            TextButton(
                style: TextButton.styleFrom(
                  minimumSize: const Size(150, 50),
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Formular()));
                },
                child: const Text(
                  'Cerere Oferta',
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }

  buildTitle(BuildContext context) {}

  buildDescription(BuildContext context) {}
}
