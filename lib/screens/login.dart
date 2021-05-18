import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 35, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  Text(
                    'Log in to get started',
                    style: TextStyle(fontSize: 18, color: Color(0xFF525252)),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Experience the all new App!',
                    style: TextStyle(fontSize: 18, color: Color(0xFF525252)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
