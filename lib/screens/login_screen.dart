import 'package:flutter/material.dart';
//import 'package:helmetshope/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:helmetshope/screens/home_screen.dart';
import 'package:helmetshope/screens/signup_screen.dart';

import '../widgets/custom_textform_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  void login() {
    _auth
        .signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text.toString())
        .then((value) {})
        .onError((error, stackTrace) {
      print(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 150,
              ),
              const Text(
                "SafeHeads",
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 150,
              ),
              Form(
                key: formkey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: " email",
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "enter email";
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // kheight15,
                    CustomTextFormWidget(
                      formController: passwordController,
                      hintText: "password",
                      obscureText: true,
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 15,
              ),
              // kheight15,

              // kheight15,
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    login();

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return HomeScreen();
                        },
                      ),
                    );
                  }
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 18, 17, 19),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                      child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // InkWell(
              //   onTap: () {
              //     Navigator.of(context).pushReplacement(
              //       MaterialPageRoute(
              //         builder: (context) {
              //           return HomeScreen();
              //         },
              //       ),
              //     );
              //   },
              //   child: Container(
              //     height: 50,
              //     decoration: BoxDecoration(
              //         color: Color.fromARGB(255, 18, 17, 19),
              //         borderRadius: BorderRadius.circular(10)),
              //     child: const Center(
              //         child: Text(
              //       "Signup with google",
              //       style: TextStyle(color: Colors.white),
              //     )),
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("dont have an account? "),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return SignupScreen();
                          },
                        ),
                      );
                    },
                    child: const Text("signUp"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
