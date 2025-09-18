import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;

  const LoginButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = const Color(0xFF023047),
    this.textColor = const Color(0xFFFFB703),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: GoogleFonts.kaiseiDecol(
          textStyle: TextStyle(color: textColor, fontSize: 16),
        ),
      ),
    );
  }
}
