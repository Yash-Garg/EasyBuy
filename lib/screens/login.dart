import 'package:easybuy/helpers/authentication_helper.dart';
import 'package:easybuy/helpers/validation_helper.dart';
import 'package:easybuy/widgets/custom_snack.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  late TextEditingController _emailController;
  late TextEditingController _passController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  void _togglePassVisibility() {
    setState(() {
      _obscureText = !_obscureText;
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
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 30),
              child: Column(
                children: [
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
                    controller: _passController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _obscureText,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (input) => isValidPassword(input!)
                        ? null
                        : 'Password should be at least 8 characters long',
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
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Use mobile number',
                    style: TextStyle(color: Colors.orange, fontSize: 16),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      final String email = _emailController.text;
                      final String pass = _passController.text;

                      if (isValidEmail(email) && isValidPassword(pass)) {
                        await signInWithEmail(email, pass);
                      } else {
                        Get.showSnackbar(
                          customSnack(
                              null, 'Please check the entered details.'),
                        );
                      }
                    },
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 1,
                      ),
                    ),
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
