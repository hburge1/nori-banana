import 'package:flutter/material.dart';

const Color primaryColor = Color.fromARGB(255, 231, 210, 20);
const Color primaryDarkColor = Color.fromARGB(255, 87, 79, 12);
const Color primaryLiColor = Color.fromARGB(255, 247, 145, 213);

const double standardText = 18.0;
const double largeText = 18.0;

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

void snackBar(BuildContext  context, String text) =>
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));

  
InputDecoration inputStyling(String labelText, {hintText}) => 
InputDecoration( labelText: labelText, hintText:  hintText);
