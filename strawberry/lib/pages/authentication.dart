import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/loading.dart';

class Authenication extends StatefulWidget {
  Authenication({Key? key}) : super(key: key);

  @override
  State<Authenication> createState() => _AuthState();
}

class _AuthState extends State<Authenication> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  get children => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Nori Banana"),
        ),
        body: loading
            ? const Loading()
            : Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _email,
                      decoration: const InputDecoration(labelText: "Email"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email cannot be empty";
                        }
                        if (!value.contains('@')) {
                          return "Email is in wrong format";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _password,
                      decoration: const InputDecoration(labelText: "Password"),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password cannot be empty";
                        }
                        if (value.length < 7) {
                          return "Password is too short";
                        }
                        return null;
                      },
                    ),
                    OutlinedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        child: Text("LOGIN")),
                    OutlinedButton(
                        onPressed: () {
                          setState(() {
                            register();
                          });
                        },
                        child: Text("REGISTER")),
                    OutlinedButton(
                        onPressed: () {}, child: Text("FORGOT PASSWORD")),
                  ],
                ),
              ));
  }

  Future<void> register() async {
    if (_formKey.currentState!.validate()) {
        try{
     var registerResponse = await _auth.createUserWithEmailAndPassword(
         email: _email.text, password: _password.text);
        } catch(e) {}
      setState(() {
        loading = true;
      });
    }
  }
}
