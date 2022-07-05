import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:strawberry/pages/authentication.dart';
import 'widgets/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';



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
      home: const Authenication());
        body: Center(
          child: Image(
          image: NetworkImage('https://stock.adobe.com/ca/images/vector-seamless-pattern-with-strawberry-on-stripe-pink-backdrop-food-background-can-be-used-for-restaurant-or-cafe-menu-design-banners-wrapping-paper-eps10-cute-berry-design-wallpaper-print-fo/260575806'),

          ),
          );
          
      }            

}
