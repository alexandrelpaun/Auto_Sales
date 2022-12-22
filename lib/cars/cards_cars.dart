import 'package:auto_sales_flutter/cars/anunt_masina_detaliat.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardAnunt extends StatefulWidget {
  CardAnunt({
    this.titleCars,
    this.descriptionCars,
    this.imageCars,
    required this.index,
  });

  int index;
  Image? imageCars;
  String? titleCars;
  String? descriptionCars;

  @override
  State<CardAnunt> createState() => _CardAnuntState();
}

class _CardAnuntState extends State<CardAnunt> {
  bool liked = false;
  late final String likedkey;
  late SharedPreferences pref;

  @override
  void initState() {
    super.initState();

    likedkey = 'liked_key_${widget.index}';
     _restorePersistedPreferences();
  }

  void _persistPreferences(bool liked) async {
    pref = await SharedPreferences.getInstance();
    pref.setBool(likedkey, liked);
  }

  void _restorePersistedPreferences() async {
    pref = await SharedPreferences.getInstance();
    liked = pref.getBool(likedkey) == null ? false : pref.getBool(likedkey)!;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Column(
            children: [
              ListTile(
                leading: widget.imageCars,
                title: Text(widget.titleCars!),
                subtitle: Text(widget.descriptionCars ?? ''),
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => Anunt(
                            imageCars: widget.imageCars,
                            titleCars: widget.titleCars,
                            descriptionCars: widget.descriptionCars,
                          )),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
