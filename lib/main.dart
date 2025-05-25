import 'package:flutter/material.dart';
import 'package:pegtech_front/pages/employee_page.dart';
import 'package:provider/provider.dart';
import 'providers/client_provider.dart';
import 'pages/user_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ClientProvider(),
      child: MaterialApp(
        title: 'PegTech',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: const EmployeePage(),
      ),
    );
  }
}

