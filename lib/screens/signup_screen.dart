import 'package:flutter/material.dart';
//import 'package:helmetshope/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:helmetshope/core/constants.dart';
import 'package:helmetshope/screens/home_screen.dart';
import 'package:helmetshope/screens/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
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
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: " password",
                        prefixIcon: const Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "enter password";
                        }
                        return null;
                      },
                    ),
                    kheight15,
                    TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: " confirm password",
                          prefixIcon: const Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "enter password";
                          } else if (value != passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        }),
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
                    _auth.createUserWithEmailAndPassword(
                      email: emailController.text.toString(),
                      password: passwordController.text.toString(),
                    );

                    // String  email= emailController.text.toString();
                    // String    password =passwordController.text.toString();

                    // Future<void>reguser(String email,String password)async{
                    //  UserCredential userCredential=await _auth.createUserWithEmailAndPassword(
                    //   email: emailController.text.toString(),
                    //   password: passwordController.text.toString(),
                    // );
                    //  print("user id is ${userCredential.user?.uid}");

                    // }
                    //reguser(email, password);

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
                    "SignUp",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) {
                        return HomeScreen();
                      },
                    ),
                  );
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 18, 17, 19),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                      child: Text(
                    "Signup with google",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("already have an account? "),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginScreen();
                          },
                        ),
                      );
                    },
                    child: const Text("Login"),
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
