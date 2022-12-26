import 'package:auto_sales_flutter/cars/fetch_data.dart';

import 'package:auto_sales_flutter/models/anunt_cars.dart';
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0.0),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Masini'),
            ),
            // DropdownButton(
            //     value: dropdownValueCars,
            //     onChanged: (value) {
            //       setState() {
            //         dropdownValueCars = value;
            //       }
            //        Navigator.pop(context);
            //     },
            //     items: ListaMasini.anunturiMasini
            //         .map<DropdownMenuItem<String>>((AnuntModel value) {
            //       return DropdownMenuItem(
            //         value: value.marca ?? '',
            //         child: Text('${value.marca}'),
            //       );
            //     }).toList()
            //       ..insert(
            //           0,
            //           DropdownMenuItem(
            //             child: Text('Select marca'),
            //             value: null,
            //           ))
            //     ),
          ],
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () {},
              child:  ListM()),
        ),
      ),
    );
  }
}
