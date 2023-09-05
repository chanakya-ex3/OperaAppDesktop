import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/logo.png", height: 50),
                SizedBox(
                  width: 20,
                ),
                Text("Opera Project Management Consultants", style: TextStyle(fontSize: 20))
              ],
            ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Card(
            margin: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: 600,
                  child: Form(
                    child: Column(
                      children: [
                        Text("Login Page",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Email",
                              hintText: "Enter your email address",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: "Password", hintText: "Enter your password"),
                            obscureText: true,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(onPressed: ()=>print("clicked"), child: Text("Login")),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
