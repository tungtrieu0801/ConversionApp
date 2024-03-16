import 'package:flutter/material.dart';

class AppWidget {
  static TextStyle bigText(){
    return const TextStyle(
        color: Colors.black,
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Roboto_Serif'
    );
  }
  static TextStyle normal(){
    return const TextStyle(
        color: Colors.black,
        fontSize: 25.0,
        fontWeight: FontWeight.w500,
        fontFamily: 'Roboto_Serif'
    );
  }
}