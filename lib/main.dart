import 'package:chatapp/pages/Login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'pages/Chat_screan.dart';
import 'pages/register_page.dart';
import 'pages/welcome_screan.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "WelcomeScrean",
      routes: {
        "WelcomeScrean": (context) => WelcomeScrean(),
        "LoginScren": (context) => LoginScren(),
        "RegisterScrean": (context) => RegisterScrean(),
        "ChatScrean": (context) => ChatScrean(),
      },
    );
  }
}
