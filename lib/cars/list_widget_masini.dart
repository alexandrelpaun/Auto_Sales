import 'package:auto_sales_flutter/models/anunt_cars.dart';
import 'package:flutter/material.dart';
import 'package:auto_sales_flutter/cars/cards_cars.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<AnuntModel> fetchAnuntModel() async {
  final response = await http.get(Uri.parse('https://www.samsareala.ro/wp-json/wc/v3/products?'));
  if (response.statusCode == 200) {
    return AnuntModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class ListItems extends StatefulWidget {
  @override
  State<ListItems> createState() => _ListItemsState();
}

class _ListItemsState extends State<ListItems> {
  late Future<AnuntModel> futureAnunt;

  @override
  void initState() {
    super.initState();
    futureAnunt = fetchAnuntModel();
  }

  final List<AnuntModel> anunturi = [
    AnuntModel(
      name: 'Toyota',
      description:
          'Detalii Suplimentare la telefon. Daca nu raspund revin cu telefon in cel mai scurt timp posibil.',
      imageUrl: 'assets/car1.png',
    ),
    AnuntModel(
      name: 'Toyota1',
      description:
          'Detalii Suplimentare la telefon. Daca nu raspund revin cu telefon in cel mai scurt timp posibil.',
      imageUrl: 'assets/car1.png',
    ),
    AnuntModel(
      name: 'Toyota2',
      description:
          'Detalii Suplimentare la telefon. Daca nu raspund revin cu telefon in cel mai scurt timp posibil.',
      imageUrl: 'assets/car1.png',
    ),
  ];

//  static const likedkey = 'liked_Key';
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: anunturi.length,
        itemBuilder: (context, index) {
          print(index);

          return CardAnunt(
            index: index,
            titleCars: anunturi[index].name ?? '',
            descriptionCars: anunturi[index].description,
            imageCars: anunturi[index].imageUrl != null
                ? Image.asset(anunturi[index].imageUrl!)
                : Image.asset('assets/logo.png'),
          );
        });
  }
}
