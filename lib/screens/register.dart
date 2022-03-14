import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  //form key
  final _formKey = GlobalKey<FormState>();

  //text field states
  String email = '';
  String password = '';
  String error  = '';

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.pink[200],
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Form(
          key: ,
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 75),
                Image.asset(
                  'assets/puppy.png',
                  height: 150,
                  width: 150,
                ),
                const SizedBox(height: 25),
                const Text(
                  "Register",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 42,
                    color: Colors.pink,
                  ),
                ),
                const SizedBox(height: 20),

              ],
            ),
          ),
        ),
      ),

    );
  }
}
