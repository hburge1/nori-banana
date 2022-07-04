import 'package:flutter/material.dart';
import '../forms/loginform.dart';


class Authenication extends StatelessWidget {
  const Authenication({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Nori Banana"),
        ),
        body: const LoginForm());
            
  }
}


