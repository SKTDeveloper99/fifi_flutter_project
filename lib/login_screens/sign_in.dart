import 'package:fifi_flutter_project/components/text_input_decoration.dart';
import 'package:fifi_flutter_project/app_screens/home.dart';
import 'package:fifi_flutter_project/login_screens/sign_up.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFC6A7FF),
      body: Form(
        child: SingleChildScrollView(
          child: Container(
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
                      "Sign in to preexisting account",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 42,
                        color: Color(0xFF975EFF),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _emailController,
                      decoration: textInputDecoration.copyWith(
                        hintText: 'email',
                        prefixIcon: const Icon(Icons.email)
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                          return 'Enter a valid email!';
                      }
            }
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      decoration: textInputDecoration.copyWith(
                        hintText: "password",
                        prefixIcon: const Icon(Icons.lock)
                      ),
                      validator:(val) => val!.isEmpty ? "Please enter something" : null,
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: (){
                          if(_formKey.currentState!.validate()){
                            signInWithEmailAndPassword();
                            FirebaseAuth.instance.authStateChanges().listen((User? user) {
                              if (user != null) {
                                FirebaseDatabase.instance.ref().child("UsersMoney/${FirebaseAuth.instance.currentUser?.uid}/").set(
                                  5000,
                                );
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const Home()));
                              }
                            });
                          }
                        },
                      child: const Text(
                        "Sign In! Or I will haunt you!!!",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(const Color(
                            0xFFAE8BFF))
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          "Are you new?",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder:(context)=> const SignUp()));
                            },
                          child: const Text(
                            "Register now!",
                            style: TextStyle(
                              color: Color(0xFF8071FF),
                              fontSize: 15,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),

    );
  }
void signInWithEmailAndPassword() async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      // print('No user found for that email.');
      return;
    } else if (e.code == 'wrong-password') {
      return;
    }
  }
}
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
