import 'package:flutter/material.dart';

Color background1 = const Color.fromRGBO(39, 46, 67, 1);
Color background2 = const Color.fromRGBO(22, 29, 48, 1);
Color background3 = const Color.fromRGBO(40, 78, 139, 1);
Color fontColor1 = const Color.fromRGBO(180, 180, 180, 1);
Color fontColor2 = const Color.fromRGBO(40, 78, 139, 1);
Color circleImageColor1 = const Color.fromRGBO(255, 202, 165, 1);
Color circleImageColor2 = const Color.fromRGBO(238, 128, 47, 1);

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
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      ),
      color: background2,
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
  Text menuText(String txt){
    return Text(
      txt,
      style: TextStyle(
        color: fontColor1,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
