import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:auto_sales_flutter/screens/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _userController = TextEditingController();

  String? _userName, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
       
        child: Container(
          padding: EdgeInsets.all(40.0),
          child: Form(
             key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Text('Email'),
                SizedBox(height: 5.0),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _userController,

               
                  autofocus: false,
                  validator: (value) {
                    if (value != null && !EmailValidator.validate(value)) {
                      return 'Enter a valid email';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Text('Password'),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _passwordController,
                  autofocus: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ' Please enter your password';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    
                  },
                  child: Text(
                    'Login',
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot your password?',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    // SizedBox(width: 40.0),
                    MaterialButton(
                      onPressed: () {
                        print(
                            '${_passwordController.text}-${_userController.text}');
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                            (route) => false);
                      },
                      child: Text(
                        'Sign up',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
