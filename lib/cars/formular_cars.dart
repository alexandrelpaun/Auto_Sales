import 'package:auto_sales_flutter/cars/anunturi_masini.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:auto_sales_flutter/models/anunt_cars.dart';


Future<AnuntModel> createAlbum(String title) async {
  final response = await http.post(
    Uri.parse('https://api.sendgrid.com/v3/mail/send'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $SENDGRID_API_KEY'// nu am reusit sa obtin token key, inca incecrc sa inregistrez DNS in wordPress
    },
    body: jsonEncode(<String, String>{// aici aparea data  in loc de body
      'personalizations': '[{"to": [{"email": "test@example.com"}]}],"from": {"email": "test@example.com"},"subject": "Sending with SendGrid is Fun","content": [{"type": "text/plain", "value": "and easy to do anywhere, even with cURL"}]'
    }),
    
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return AnuntModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class Formular extends StatefulWidget {
  const Formular({super.key});

  @override
  State<Formular> createState() => _FormularState();
}

class _FormularState extends State<Formular> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController numeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  Future<AnuntModel>? _futureAnuntModel;

  @override
  void dispose() {
    emailController.dispose();
    numeController.dispose();
    phoneController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cerere Oferta'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(30.0),
          children: <Widget>[
            TextFormField(
              controller: numeController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: 'Nume si Prenume',
                labelText: 'Nume si Prenume',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(80.0))),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name.';
                }
                return null;
              },
            ),
            const SizedBox(height: 50.0),
            TextFormField(
              controller: phoneController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.phone),
                hintText: 'Telefon',
                labelText: 'Telefon',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(80.0))),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required.';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: 50.0),
            TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'email@email.com',
                  labelText: 'email@email.com',
                  prefixIcon: Icon(Icons.mail),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(80.0))),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value != null && !EmailValidator.validate(value)) {
                    return 'Enter a valid email';
                  } else {
                    return null;
                  }
                }),
            const SizedBox(height: 50.0),
            Container(
              margin: EdgeInsets.all(80),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print(
                        '${emailController.text} - ${numeController.text} - ${phoneController.text}');

                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Anunturi()),
                        (route) => false);
                  }
                },
                child: Text(
                  'Trimitere',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  FutureBuilder<AnuntModel> buildFutureBuilder() {
    return FutureBuilder<AnuntModel>(
      future: _futureAnuntModel,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.description!);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
