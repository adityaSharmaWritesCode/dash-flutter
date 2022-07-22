import 'package:dash_call/screens/homeScreen.dart';
import 'package:dash_call/screens/loginScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dash',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor:
            const Color.fromRGBO(36, 36, 36, 1), // BACKGROUND COLOR
        backgroundColor:
            const Color.fromRGBO(46, 46, 46, 1), // SECONDARY BACKGROUND COLOR
        primaryColor: const Color.fromRGBO(14, 114, 236, 1), // BUTTON COLOR
        bottomAppBarColor: const Color.fromRGBO(26, 26, 26, 1), // FOOTER COLOR
      ),
      routes: {
        LoginScreen.route: (context) => const LoginScreen(),
        HomeScreen.route: (context) => const HomeScreen(),
      },
      initialRoute: LoginScreen.route,
    );
  }
}
