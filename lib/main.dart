import 'package:flutter/material.dart';
import 'package:opera_app_windows/MyRoutes.dart';
import 'package:opera_app_windows/Pages/Auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Opera',
      theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue.shade900,
              primary: Color.fromARGB(255, 13, 161, 92),
              secondary: Colors.blue.shade900,
              tertiary: Colors.blue.shade900,
              onPrimary: Colors.white,
              onSecondary: Colors.white,
              onTertiary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
              background: Colors.white,
              onBackground: Colors.black,
              error: Colors.red,
              onError: Colors.white,
              brightness: Brightness.light)),
      routes: {
        MyRoutes.auth: (context) => const AuthPage(),
        MyRoutes.home: (context) => const Placeholder(),
      },
      home: AuthPage(),
    );
  }
}


// test