import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:strawberry/pages/authentication.dart';
import 'widgets/loading.dart';



Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const NoriApp());
}

class NoriApp extends StatelessWidget {
  const  NoriApp({Key? key}) : super(key: key);
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nori Banana App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Authenication());
  }
}            


