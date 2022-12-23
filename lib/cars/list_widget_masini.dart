import 'package:auto_sales_flutter/collection/lista_masini.dart';
import 'package:auto_sales_flutter/models/anunt_cars.dart';
import 'package:flutter/material.dart';
import 'package:auto_sales_flutter/cars/cards_cars.dart';
import 'package:html/parser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ListItems extends StatefulWidget {
  @override
  State<ListItems> createState() => _ListItemsState();

  List<AnuntModel> anunturi = [];

  ListItems({required this.anunturi}) {

    for (var element in ListaMasini.anunturiMasini) {
      if (marca != null && element.marca == marca) {
        anunturi.add(element);
      } else if (marca == null) {
        anunturi.add(element);
      }
    }
  }

  String? marca;
}

class _ListItemsState extends State<ListItems> {
  late Future<AnuntModel> futureAnunt;

  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;

    return parsedString;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.anunturi.length,
        itemBuilder: (context, index) {
          print(index);

          return CardAnunt(
            
           index:index,
           id:widget.anunturi[index].id,
            titleCars: widget.anunturi[index].name ?? '',
            descriptionCars:
                _parseHtmlString(widget.anunturi[index].description ?? ''),
            imageCars: widget.anunturi[index].imageUrl != null
                ? Image.network(widget.anunturi[index].imageUrl!)
                : Image.asset('assets/logo.png'),
          );
        });
  }
}
