import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:iot_app_ui/const/coustom_colors.dart';
import 'package:iot_app_ui/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "IoT App",
      theme: ThemeData(
        scaffoldBackgroundColor: kMainBG,
        primarySwatch: Colors.amber,
      ),
      home: Home(),
    );
  }
}
