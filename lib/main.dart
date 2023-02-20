import 'package:butterfly_effect_admin/Bottom_NavBar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tamil Meme Templates Admin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AdminPage(),
    );
  }
}
