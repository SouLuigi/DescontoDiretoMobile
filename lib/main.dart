import 'package:desconto_direto_mobile/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Desconto Direto', home: login_Screen());
  }
}
