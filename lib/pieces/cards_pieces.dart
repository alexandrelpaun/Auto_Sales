import 'package:flutter/material.dart';
import 'package:auto_sales_flutter/pieces/anunt_piese_detaliat.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardAnuntPiese extends StatefulWidget {
  String? titlePiese;
  String? descriptionPiese;
  Image? imagePiese;
  int index;

  CardAnuntPiese({
    required this.index,
    this.titlePiese,
    this.descriptionPiese,
    this.imagePiese,
  });

  @override
  State<CardAnuntPiese> createState() => _CardAnuntPieseState();
}

class _CardAnuntPieseState extends State<CardAnuntPiese> {
  late final String likedkey;

  bool liked = false;

  late SharedPreferences pref;

  @override
  void initState() {
    super.initState();

    likedkey =
        'liked_key ${widget.index}'; // pt a putea sa identificam ce key se atribuie fiecarui anunt,i-am adaugat index in denumire
    _restorePersistPreferences(); // se apeleaza metoda care schimba starea dupa ce se reporneste aplicatia , si doar la inceputul aplicatiei
  }

  void _persistPreferences(bool liked) async {
    // se seteaza valoarea lui key dupa ce este apasat butonul
    pref = await SharedPreferences.getInstance();
    pref.setBool(likedkey, liked);
  }

  void _restorePersistPreferences() async {
    pref =
        await SharedPreferences.getInstance(); // se returneaza o instanta de SP
    liked = pref.getBool(likedkey) == null
        ? false
        : pref.getBool(
            likedkey)!; // daca key nu are nicio valoare atunci se afiseaza false , altf val lui key
    setState(() {}); // ca sa putem schimba starea trebuie sa apelam setState
  }

  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: widget.imagePiese!,
        title: Text(widget.titlePiese ?? ''),
        subtitle: Text(widget.descriptionPiese ?? ''),
        trailing: IconButton(
          onPressed: () {
            setState(() {
              liked = !liked;
            });
            _persistPreferences(liked);
          },
          icon: Icon(
            liked ? Icons.favorite : Icons.favorite_border,
            color: liked ? Colors.red : Colors.grey,
          ),
        ),
        onTap: (() {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AnunDetaliatPiese(
                        titlePiese: widget.titlePiese,
                        descriptionPiese: widget.descriptionPiese,
                        imagePiese: widget.imagePiese!,
                      )));
        }),
      ),
    );
  }
}
