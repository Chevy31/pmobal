import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:modul1/layout/login.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: AnimatedSplashScreen(
        splash: Image(
          image: NetworkImage(
              "https://i.pinimg.com/originals/f0/5c/bc/f05cbc8c0f8b075d2b4f1f68fee49649.jpg"),
        ),
        nextScreen: login(),
        duration: 30,
        pageTransitionType: PageTransitionType.fade,
        backgroundColor: Colors.black,
      ),
    );
  }
}
