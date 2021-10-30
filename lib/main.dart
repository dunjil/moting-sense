import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';

main() {
  runApp(MotionSense());
}

class MotionSense extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0XFF0A0E21),
        scaffoldBackgroundColor: Color(0XFF0A0E21),
      ),
      title: "Motion Sense",
      initialRoute: LoginScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
      },
    );
  }
}
