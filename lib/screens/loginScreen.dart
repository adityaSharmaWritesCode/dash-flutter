import 'package:dash_call/resources/auth_methods.dart';
import 'package:dash_call/screens/homeScreen.dart';
import 'package:dash_call/widgets/big_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const route = 'login-screen-route';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Start or join a meeting',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 38),
              child: Image.asset('assets/images/login.jpg'),
            ),
            CustomButton(
              content: 'Google Sign In',
              onTap: () async {
                bool res = await _authMethods.signInWithGoogle();
                if (res) {
                  Navigator.pushReplacementNamed(context, HomeScreen.route);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
