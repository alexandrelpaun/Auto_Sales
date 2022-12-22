import 'dart:convert';

import 'package:flutter/material.dart';

class AnunDetaliatPiese extends StatefulWidget {
  AnunDetaliatPiese(
      {super.key,
      required this.imagePiese,
      this.titlePiese,
      this.descriptionPiese});

  final Image imagePiese;
  String? titlePiese;
  String? descriptionPiese;

 

  @override
  State<AnunDetaliatPiese> createState() => _AnunDetaliatPieseState();
}

class _AnunDetaliatPieseState extends State<AnunDetaliatPiese> {
  bool _isLoading =false;
    // am declarat o variabiala bool pentru a putea sa implementam CircularProgressIndicator

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titlePiese ?? ''),
      ),
      body: Column(
        children: [
          widget.imagePiese,
          Text(widget.titlePiese ?? ''),
          Text(widget.descriptionPiese ?? ''),
        ],
      ),
    );
  }
}
