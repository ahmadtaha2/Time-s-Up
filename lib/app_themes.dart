import 'package:flutter/material.dart';
import 'package:pro1/launch.dart';

class Themes {
  InputDecoration textFormFieldDecoration(String label) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.blue[50],
      labelText: label,
      labelStyle: const TextStyle(color: Colors.blue),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  BoxDecoration screenDecoration() {
    return BoxDecoration(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      color: theme1,
    );
  }

  Text title(String txt) {
    return Text(
      txt,
      style: TextStyle(
        color: Colors.orange[700],
        fontSize: 35,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  Text trailing(String txt) {
    return Text(
      txt,
      style: TextStyle(
        color: Colors.orange[700],
      ),
    );
  }

  Text textButtonStyle(String txt) {
    return Text(
      txt,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.blue[800],
        shadows: const [
          Shadow(
            color: Colors.black,
            offset: Offset(0, 1),
          ),
        ],
      ),
    );
  }

  Text linkText1(String txt) {
    return Text(
      txt,
      style: TextStyle(
        color: Colors.blue[800],
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text linkText2(String txt) {
    return Text(
      txt,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.orange[800],
      ),
    );
  }

  Text resetLink(String txt) {
    return Text(
      txt,
      style: TextStyle(
        color: Colors.orange[700],
      ),
    );
  }
}
