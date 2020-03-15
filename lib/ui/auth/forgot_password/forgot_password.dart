import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.lightBlue,
        ),
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
