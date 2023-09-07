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
        title: Text(
          "HomePage",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            onPressed: () => FirebaseAuthForAll.instance.signOut(),
            icon: Icon(
              Icons.logout_rounded,
              color: Colors.white,
            ),
            hoverColor: Colors.black,
          )
        ],
      ),
      body: Column(
        children: [
          Card(
            color: Theme.of(context).colorScheme.secondary,
            child: Container(
              width: double.infinity,
              height: 250,
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/logo.png", height: 70),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Opera Project Management Consultants",
                          style: TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.w600,
                              color: Colors.white))
                    ],
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    "Hello Shivaram",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ),
          // Expanded(
          //   child: Container(
          //     width: 1920,
          //     child: Card(
          //       color: Colors.redAccent,
          //       child: Row(
          //         children: [
          //           Expanded(
          //               child: Container(
          //             // width: 800,
          //             child: Card(
          //               color: Colors.greenAccent,
          //               child: Expanded(
          //                 child: Column(
          //                   children: [
          //                   ],
                            
          //                 ),
          //               )
          //             ),
          //           )),
          //           Expanded(
          //               child: Container(
          //             // width: 800,
          //             child: Card(
          //               color: Colors.greenAccent,
          //               child: Expanded(
          //                 child: Column(
          //                 ),
          //               )
          //             ),
          //           )),
          //         ],
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
