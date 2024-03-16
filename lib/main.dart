import 'package:flutter/material.dart';
import 'screens/LoginPage.dart';

void main() {
  runApp(
    Directionality(
      textDirection: TextDirection.ltr,
      child: MaterialApp(
        title: 'Slivadoc',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
      ),
    ),
  );
}