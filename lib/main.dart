import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_case/view/home_screen.dart';
import 'package:voco_case/view/login_screen.dart';
import 'package:voco_case/view/splash_screen.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    //  home: LoginPage(),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        '/loginpage': (context) => LoginPage(),
        '/homescreen': (context) => HomeScreen(),
      },
    );
  }
}
