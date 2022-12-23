import 'package:auto_sales_flutter/collection/lista_piese.dart';
import 'package:auto_sales_flutter/models/anunt_cars.dart';
import 'package:auto_sales_flutter/pieces/cards_pieces.dart';
import 'package:flutter/material.dart';
import '../models/anunt_piese.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ListItemsPiese extends StatefulWidget {
  @override
  State<ListItemsPiese> createState() => _ListItemsPieseState();

  List<AnuntModelPiese> tempList = [];

  ListItemsPiese({super.key, this.marca, required this.tempList}) 
  {
    for (var element in ListaPiese.anunturiPiese) {
      if (marca != null && element.marca == marca) {
        tempList.add(element);
      } else if (marca == null) {
        tempList.add(element);
      }
    }
  }

  String? marca;
}

class _ListItemsPieseState extends State<ListItemsPiese> {
  late Future<AnuntModelPiese> futureAnunt;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.tempList.length,
        itemBuilder: (context, index) {
          print(index);

          return CardAnuntPiese(
            index: index,
           name: widget.tempList[index].name,
            description: widget.tempList[index].description,
            images: widget.tempList[index].images != null
                ? Image.network(widget.tempList[index].images!)
                : Image.asset('asset/logo.png'),
          );
        });
  }
}
