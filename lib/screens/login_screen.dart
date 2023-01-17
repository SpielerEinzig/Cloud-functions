import 'package:firebase_cloud_functions/screens/home_screen.dart';
import 'package:firebase_cloud_functions/utilities/page_navigation.dart';
import 'package:firebase_cloud_functions/widgets/custom_button.dart';
import 'package:firebase_cloud_functions/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final PageNavigation _navigation = PageNavigation();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log in"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextField(
                    controller: _emailController,
                    label: "Enter your email",
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    controller: _passwordController,
                    label: "Enter your password",
                  ),
                ],
              ),
            ),
            CustomButton(
              onPressed: () {
                _navigation.pushPage(
                  context: context,
                  destination: const HomeScreen(),
                );
              },
              label: "Log in",
              height: size.height * 0.075,
            ),
          ],
        ),
      ),
    );
  }
}
