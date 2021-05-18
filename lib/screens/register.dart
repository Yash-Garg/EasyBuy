import 'dart:ui';

import 'package:easybuy/helpers/validation_helper.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool _obscureText = true;
  bool _obscureConfirmText = true;

  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _mobileController;
  late TextEditingController _passController;
  late TextEditingController _confirmPassController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _mobileController = TextEditingController();
    _passController = TextEditingController();
    _confirmPassController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _passController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }

  void _togglePassVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggleConfirmPassVisibility() {
    setState(() {
      _obscureConfirmText = !_obscureConfirmText;
    });
  }

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
                    'Register in to get started',
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
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 30),
              child: Column(
                children: [
                  TextFormField(
                    cursorColor: Colors.black,
                    style: TextStyle(fontSize: 16),
                    keyboardType: TextInputType.name,
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: 'Your name here..',
                      prefixIcon: Icon(
                        Icons.person_outline,
                        size: 30,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    cursorColor: Colors.black,
                    style: TextStyle(fontSize: 16),
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (input) => isValidEmail(input!)
                        ? null
                        : 'Enter a valid email address',
                    decoration: InputDecoration(
                      labelText: 'E-mail ID',
                      hintText: 'abc@xyz.com',
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        size: 30,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    cursorColor: Colors.black,
                    style: TextStyle(fontSize: 16),
                    controller: _mobileController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Mobile Number',
                      prefixText: '+91 ',
                      hintText: 'XXXXX XXXXX',
                      prefixIcon: Icon(
                        Icons.phone,
                        size: 30,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    cursorColor: Colors.black,
                    style: TextStyle(fontSize: 16),
                    controller: _passController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _obscureText,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (input) => isValidPassword(input!)
                        ? null
                        : 'Password should be at least 8 characters',
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'xxxxxxxxx',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: _obscureText
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                        onPressed: _togglePassVisibility,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    cursorColor: Colors.black,
                    style: TextStyle(fontSize: 16),
                    controller: _confirmPassController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _obscureConfirmText,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (input) => isValidPassword(input!)
                        ? null
                        : 'Password should be at least 8 characters',
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      hintText: 'xxxxxxxxx',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: _obscureConfirmText
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                        onPressed: _toggleConfirmPassVisibility,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'REGISTER',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Already have an account? Login',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}