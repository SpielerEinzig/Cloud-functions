import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cloud_functions/models/user_model.dart';
import 'package:firebase_cloud_functions/providers/user_provider.dart';
import 'package:firebase_cloud_functions/services/database_service.dart';
import 'package:firebase_cloud_functions/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final DatabaseService _databaseService = DatabaseService();
  bool loading = false;
  late Stream stream;

  void initData() async {
    User? userAuth = context.read<UserProvider>().getUserCredential;

    if (userAuth != null) {
      stream = _firestore.collection("Users").doc(userAuth.uid).snapshots();
    }
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SafeArea(
          child: StreamBuilder(
              stream: stream,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                } else if (snapshot.hasError) {
                  debugPrint("Error with snapshot: ${snapshot.error}");
                  Text(
                    "An error occurred.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white.withOpacity(0.7),
                      fontWeight: FontWeight.w500,
                    ),
                  );
                }

                final data = snapshot.data!;

                UserModel userModel = UserModel(
                  running: data['running'],
                  amount: data['amount'],
                  email: data['email'],
                  userid: data['userid'],
                );

                return Center(
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Email: ${userModel.email}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white.withOpacity(0.7),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "Status: ${userModel.running ? "Running" : "Paused"}",
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white.withOpacity(0.7),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "Number of hours active",
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white.withOpacity(0.7),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              userModel.amount.toString(),
                              style: const TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomButton(
                        onPressed: () async {
                          await _databaseService.editRunning(
                            userid: userModel.userid,
                            running: !userModel.running,
                          );
                        },
                        label: userModel.running ? "Pause" : "Start",
                        loading: loading,
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
