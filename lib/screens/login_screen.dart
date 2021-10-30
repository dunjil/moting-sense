import 'package:flutter/material.dart';
import 'package:motionsense/screens/home_screen.dart';
import '../widgets/rounded_button.dart';
import 'package:motionsense/constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  bool showSpinner = false;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Text(
                  "Security Credentials",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white70,
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter your Email'),
              ),
              SizedBox(
                height: 14.0,
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white70,
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              WidgetButtons(
                  title: 'Log In',
                  color: Colors.blueGrey,
                  onPress: () async {
                    FocusScope.of(context).requestFocus(new FocusNode());
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final newUser = await auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (newUser != null) {
                        Navigator.pushNamed(context, HomeScreen.id);
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    } catch (e) {
                      print(e);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
