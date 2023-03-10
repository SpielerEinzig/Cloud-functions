import 'package:firebase_cloud_functions/providers/user_provider.dart';
import 'package:firebase_cloud_functions/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blueGrey,
            primaryColorDark: Colors.blueGrey,
            brightness: Brightness.dark,
          ),
          scaffoldBackgroundColor: Colors.blueGrey[900]),
      home: const WelcomeScreen(),
    );
  }
}
