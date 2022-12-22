import 'package:auto_sales_flutter/collection/lista_piese.dart';
import 'package:auto_sales_flutter/pieces/cards_pieces.dart';
import 'package:flutter/material.dart';
import '../models/anunt_piese.dart';


class ListItemsPiese extends StatelessWidget {

  List<AnuntModelPiese> tempList = [];

  ListItemsPiese({super.key, this.marca}) {
    

    for (var element in ListaPiese.anunturiPiese) {
      if (marca != null && element.marca == marca) {
        tempList.add(element);
      } else if (marca == null) {
        tempList.add(element);
      }
    }
  }

  String? marca;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tempList.length,
        itemBuilder: (context, index) {
          print(index);

          return CardAnuntPiese(
            index: index,
            titlePiese: tempList[index].titlePiese,
            descriptionPiese: tempList[index].descriptionPiese,
            imagePiese: tempList[index].imageUrlPiese != null
                ? Image.asset(tempList[index].imageUrlPiese!)
                : Image.asset('asset/logo.png'),
          );
        });
  }
}
