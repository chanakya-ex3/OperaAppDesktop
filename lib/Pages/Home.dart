import 'package:firebase_for_all/firebase_for_all.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage", style: TextStyle(color: Colors.white),),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(onPressed:()=> FirebaseAuthForAll.instance.signOut(), icon:Icon(Icons.logout_rounded, color: Colors.white,))
        ],
      ),
      body: Text("This is homepage"),
    );
  }
}
