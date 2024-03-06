import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/features/home/home_screen.dart';
import 'package:untitled2/features/register/register_screen.dart';

import 'features/login/login_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';

SharedPreferences? prefs;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  prefs = await SharedPreferences.getInstance();
  if(prefs!.getString("isLogin") == null){
    prefs!.setString("isLogin", "false");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
          prefs!.getString("isLogin") == "true" ? HomeScreen() : LoginPage(),
    );
  }
}
