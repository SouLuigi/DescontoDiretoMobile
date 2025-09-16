
import 'package:flutter/material.dart';

class login_Screen extends StatefulWidget {
  const login_Screen({super.key});

  @override
  State<login_Screen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<login_Screen> {
   bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF023047),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],

          ),
        ),
      ),
    );
  }
}
