import 'package:flutter/material.dart';
import 'package:opera_app_windows/MyRoutes.dart';
import 'package:opera_app_windows/Pages/Auth.dart';
import 'package:firebase_for_all/firebase_for_all.dart';
import 'package:opera_app_windows/Pages/Home.dart';
import 'package:opera_app_windows/Pages/SplashScreen.dart';
import 'package:opera_app_windows/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseCoreForAll.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    auth: true,
    firestore: true,
    storage: true,
  );
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
              seedColor: const Color.fromARGB(255, 92, 13, 161),
              primary: Color.fromARGB(255, 92, 13, 161),
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
      home: StreamBuilder(
        stream: FirebaseAuthForAll.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen();
          }
          if (snapshot.hasData) {
            return HomePage();
          }
          return AuthPage();
        },
      ),
    );
  }
}


// test