import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:strawberry/style/style.dart';



class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

@override
State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm>{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  
  
  @override
  Widget build(BuildContext context) {
    return Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _email,
                      decoration: inputStyling("Email"),
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
                      decoration: inputStyling("Password"),
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
                          setState(() {
                           loading = true;
                            register(); 
                              });
                        },
                        child: const Text("REGISTER")),
                ],
         ),
      );
  
}

Future<void> register() async {
    if (_formKey.currentState!.validate()) {
        try{
     UserCredential registerResponse = 
        await _auth.createUserWithEmailAndPassword(
             email: _email.text, password: _password.text);

        await _db.collection("users").doc(registerResponse.user!.uid).set({
          "name": _email.text,
          
        });

         
         registerResponse.user!.sendEmailVerification();
         setState(() {
          loading = false;
         });
        
        }catch (e){
        setState(() {
        snackBar(context, e.toString());
        loading = false;
      });
    } 
    }
    }
}
