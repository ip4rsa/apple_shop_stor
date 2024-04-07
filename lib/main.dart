import 'package:apple_shop/Screens/main_screen.dart';
import 'package:apple_shop/di/di.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getInit();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'SM',
      ),
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
