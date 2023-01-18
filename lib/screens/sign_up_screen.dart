import 'package:firebase_cloud_functions/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utilities/page_navigation.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final PageNavigation _navigation = PageNavigation();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign up"),
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
                    obscureText: false,
                    controller: _emailController,
                    label: "Enter your email",
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    obscureText: true,
                    controller: _passwordController,
                    label: "Enter your password",
                  ),
                ],
              ),
            ),
            CustomButton(
              loading: loading,
              onPressed: () async {
                setState(() {
                  loading = true;
                });

                bool proceed = await context.read<UserProvider>().registerUser(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );

                if (proceed) {
                  setState(() {
                    loading = false;
                  });

                  _navigation.pushPage(
                    context: context,
                    destination: const HomeScreen(),
                  );
                }
              },
              label: "Sign up",
              height: size.height * 0.075,
            ),
          ],
        ),
      ),
    );
  }
}
