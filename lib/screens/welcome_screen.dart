import 'package:firebase_cloud_functions/screens/login_screen.dart';
import 'package:firebase_cloud_functions/screens/sign_up_screen.dart';
import 'package:firebase_cloud_functions/utilities/page_navigation.dart';
import 'package:firebase_cloud_functions/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageNavigation _navigation = PageNavigation();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Welcome",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                CustomButton(
                    loading: false,
                    onPressed: () {
                      _navigation.pushPage(
                        context: context,
                        destination: const LoginScreen(),
                      );
                    },
                    label: "Log in"),
                const SizedBox(height: 20),
                CustomButton(
                    loading: false,
                    onPressed: () {
                      _navigation.pushPage(
                        context: context,
                        destination: const SignUpScreen(),
                      );
                    },
                    label: "Sign up"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
