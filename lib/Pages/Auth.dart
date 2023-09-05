import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/images/OperaLogo.png"),
        title:
            Center(child: Text('Opera Project Management Consultants Pvt Ltd')),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Text(""),
    );
  }
}
