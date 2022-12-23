import 'package:auto_sales_flutter/collection/lista_piese.dart';
import 'package:auto_sales_flutter/models/anunt_piese.dart';
import 'package:auto_sales_flutter/pieces/fetch_data_piese.dart';
import 'package:auto_sales_flutter/pieces/list_widget_piese.dart';
import 'package:flutter/material.dart';

class AnunturiPiese extends StatefulWidget {
  @override
  State<AnunturiPiese> createState() => _AnunturiPieseState();
}

class _AnunturiPieseState extends State<AnunturiPiese> {
  var dropdownValue = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anunturi Piese'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0.0),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Piese dezmembrari'),
            ),
            DropdownButton(
                value: dropdownValue,
                onChanged: (value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownValue = value; //
                  });
                  Navigator.pop(context);
                },
                items: ListaPiese.anunturiPiese
                    .map<DropdownMenuItem<String>>((AnuntModelPiese value) {
                  return DropdownMenuItem(
                    value: value.marca ?? '',
                    child: Text('${value.marca}'),
                  );
                }).toList()
                  ..insert(
                      0,
                      DropdownMenuItem(
                        child: Text('Select marca'),
                        value: null,
                      ))),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: MaterialButton(
            // style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            onPressed: () {},
            child: ListMPiese()),
      ),
    );
  }
}
