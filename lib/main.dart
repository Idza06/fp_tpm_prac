import 'package:flutter/material.dart';
import 'login.dart';

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Movies App",
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.white
      ),
      home: Login(),
    );
  }
}