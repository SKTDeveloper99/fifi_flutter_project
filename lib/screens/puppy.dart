import 'package:fifi_flutter_project/components/text_input_decoration.dart';
import 'package:fifi_flutter_project/screens/register.dart';
import 'package:flutter/material.dart';


class Ilovedogsanddogsanddogsanddogsanddogsanddogsanddogsanddogsandfinallydogs extends StatefulWidget {
  const Ilovedogsanddogsanddogsanddogsanddogsanddogsanddogsanddogsandfinallydogs({Key? key}) : super(key: key);

  @override
  _IlovedogsanddogsanddogsanddogsanddogsanddogsanddogsanddogsandfinallydogsState createState() => _IlovedogsanddogsanddogsanddogsanddogsanddogsanddogsanddogsandfinallydogsState();
}

class _IlovedogsanddogsanddogsanddogsanddogsanddogsanddogsanddogsandfinallydogsState extends State<Ilovedogsanddogsanddogsanddogsanddogsanddogsanddogsanddogsandfinallydogs> {
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
          key: _formKey,
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
                    color: Color(0xFFF2A7FF),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                      hintText: 'email or username',
                      prefixIcon: const Icon(Icons.email)
                  ),
                  validator: (val) => val!.isEmpty ? "Enter an email or username" : null,
                  onChanged: (val){
                    email = val;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                      hintText: "password",
                      prefixIcon: const Icon(Icons.lock)
                  ),
                  validator:(val) => val!.length  < 6 ? "Enter an password 6+ characters long" : null,
                  obscureText: true,
                  onChanged: (val){
                    setState(() {
                      password = val;
                    });
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: (){

                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(const Color(
                          0xFFFFB3FE))
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    TextButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Register()));
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          color: Color(0xFFF2A7FF),
                          fontSize: 15,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  error,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
        ),
      ),

    );
  }
}

