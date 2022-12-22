
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:auto_sales_flutter/screens/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confPasswordController.dispose();

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
              controller: passwordController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: 'Pasword',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(80.0))),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password!';
                } else if (value != confPasswordController.text) {
                  return 'Both pass should be the same!';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: 50.0),
            TextFormField(
              controller: confPasswordController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.phone),
                hintText: 'Confirm Password',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(80.0))),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required.';
                } else if (value != passwordController.text) {
                  return 'Both pass should be the same!';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: 50.0),
            TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'User Name',
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
                        '${emailController.text} - ${passwordController.text} - ${confPasswordController.text}');
                  }
                },
                child: Text(
                  'Register',
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
}
