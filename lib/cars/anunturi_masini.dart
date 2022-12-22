import 'package:auto_sales_flutter/cars/lista_masini.dart';
import 'package:flutter/material.dart';

import 'package:auto_sales_flutter/cars/list_widget_masini.dart';

class Anunturi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var dropdownValueCars = null;

    return Scaffold(
      appBar: AppBar(
        title: Text('Toate Anunturile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () {},
              child: ListM()),
        ),
      ),
    );
  }
}
