import 'package:flutter/material.dart';
import 'package:firebase_for_all/firebase_for_all.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firebaseAuth = FirebaseAuthForAll.instance;

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();

  String username = "";
  String passwd = "";
  void submit() async {
    if (_formKey.currentState!.validate()) {
      try {
        _formKey.currentState!.save();
        await _firebaseAuth.signInWithEmailAndPassword(
            email: username, password: passwd);
        print("Username: $username");
        print("Password: $passwd");
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Invalid Username or Password")));
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Container(
          alignment:
              AlignmentGeometry.lerp(Alignment.center, Alignment.center, 0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/logo.png", height: 50),
                  SizedBox(
                    width: 20,
                  ),
                  Text("Opera Project Management Consultants",
                      style: TextStyle(fontSize: 30, color: Colors.white))
                ],
              ),
              Card(
                margin: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: 600,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Text(
                              "Login Page",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 32),
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Username cannot be empty";
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  username = value!;
                                },
                                decoration: InputDecoration(
                                  labelText: "Email",
                                  hintText: "Enter your email address",
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 32),
                              child: TextFormField(
                                  decoration: InputDecoration(
                                      labelText: "Password",
                                      hintText: "Enter your password"),
                                  obscureText: true,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Password cannot be empty";
                                    } else if (value.length < 6) {
                                      return "Password length should be atleast 6";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    passwd = value!;
                                  }),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                                onPressed: () => submit(),
                                child: Text("Login")),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
