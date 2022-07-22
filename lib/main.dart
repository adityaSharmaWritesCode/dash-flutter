import 'package:dash_call/resources/auth_methods.dart';
import 'package:dash_call/screens/homeScreen.dart';
import 'package:dash_call/screens/loginScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        highlightColor: Colors.white, //SELECTED ITEM COLOR
      ),
      routes: {
        LoginScreen.route: (context) => const LoginScreen(),
        HomeScreen.route: (context) => const HomeScreen(),
      },
      // initialRoute: HomeScreen.route,
      home: StreamBuilder(
        stream: AuthMethods().authChanges,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasData) {
            return const HomeScreen();
          }

          return const LoginScreen();
        }),
      ),
    );
  }
}
