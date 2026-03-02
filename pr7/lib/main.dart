// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'routes.dart';
import 'pages/loading_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/profile_page.dart';
import 'pages/detail_page.dart';
import 'features/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Антивирусы',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontFamily: 'serif',
            fontSize: 26,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      initialRoute: Routes.loading,
      routes: {
        Routes.loading: (context) => const LoadingPage(),
        Routes.login: (context) => LoginPage(),
        Routes.register: (context) => RegisterPage(),
        Routes.home: (context) => const HomePage(),
        Routes.profile: (context) => ProfilePage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == Routes.details) {
          final antivirus = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => DetailPage(antivirus: antivirus),
          );
        }
        return null;
      },
      debugShowCheckedModeBanner: false,
    );
  }
}