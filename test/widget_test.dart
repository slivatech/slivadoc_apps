// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:slivadoc_mobile_apps/screens/LoginPage.dart';

void main() {
  testWidgets('LoginPage displays form fields and buttons', (WidgetTester tester) async {
    await tester.pumpWidget(LoginPage());

    // Verify that the email field is displayed.
    expect(find.byType(TextFormField), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);

    // Verify that the password field is displayed.
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.text('Password'), findsOneWidget);

    // Verify that the login button is displayed.
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);

    // Verify that the forgot password button is displayed.
    expect(find.byType(TextButton), findsOneWidget);
    expect(find.text('Forgot Password?'), findsOneWidget);
  });
}