import 'package:flutter/material.dart';

Color theme1 = const Color.fromRGBO(226, 228, 229, 1);
Color theme2 = Colors.blue[300]!;
Color background1 = const Color.fromRGBO(39, 46, 67, 1);
Color background2 = const Color.fromRGBO(22, 29, 48, 1);
Color background3 = const Color.fromRGBO(40, 78, 139, 1);
Color background4 = const Color.fromRGBO(180, 180, 180, 1);
Color background5 = const Color.fromRGBO(238, 128, 47, 1);
Color fontColor1 = const Color.fromRGBO(180, 180, 180, 1);
Color fontColor2 = const Color.fromRGBO(40, 78, 139, 1);
Color fontColor3 = const Color.fromRGBO(22, 29, 48, 1);
Color fontColor4 = const Color.fromRGBO(238, 128, 47, 1);
Color circleImageColor1 = const Color.fromRGBO(255, 202, 165, 1);
Color circleImageColor2 = const Color.fromRGBO(238, 128, 47, 1);
Color shadowColor1 = Colors.white10;
Color fillColor1 = const Color.fromRGBO(22, 29, 48, 0.66);

class Themes {
  InputDecoration textFormFieldDecoration(String label) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.blue[50],
      labelText: label,
      labelStyle: const TextStyle(color: Colors.blue),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
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

  BoxDecoration screenLightDecoration() {
    return BoxDecoration(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      ),
      color: background4,
    );
  }

  Text title(String txt) {
    return Text(
      txt,
      style: TextStyle(
        color: fontColor4,
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
      textAlign: TextAlign.center,
    );
  }

  Text trailingChooseNode(String txt) {
    return Text(
      txt,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w800,
        fontSize: 12,
      ),
      textAlign: TextAlign.center,
    );
  }

  Text textButtonStyle(String txt) {
    return Text(
      txt,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: fontColor4,
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
      style: const TextStyle(
        color: Colors.white70,
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

  Text menuText(String txt) {
    return Text(
      txt,
      style: TextStyle(
        color: fontColor1,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

Row appLogo() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        'media/images/time_exploit.png',
        width: 100,
        height: 100,
      ),
      const Text(
        'Time Exploit',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w800, fontSize: 30),
      ),
    ],
  );
}

TextFormField searchBar() {
  return TextFormField(
    keyboardType: TextInputType.text,
    keyboardAppearance: Brightness.dark,
    style: TextStyle(
      color: fontColor1,
    ),
    decoration: InputDecoration(
      hintText: 'Search',
      hintStyle: TextStyle(
        color: fontColor1,
      ),
      filled: true,
      fillColor: fillColor1,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      prefixIcon: Icon(
        Icons.search,
        color: fontColor1,
      ),
    ),
  );
}
