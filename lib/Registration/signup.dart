import 'package:flutter/material.dart';
import 'package:pro1/Registration/Child_Configurations//child_info.dart';
import 'package:pro1/Registration/account.dart';
import 'package:pro1/Theme/app_themes.dart';
import 'package:pro1/Theme/theme_const.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //TODO: you stopped right here while working on the theme
        backgroundColor: background1,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                color: Colors.transparent,
                elevation: 40,
                child: Column(
                  children: [
                    Image.asset(
                      'media/images/TotalControl_Logo.png',
                      width: 250,
                      height: 250,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Total Control',
                      style: TextStyle(
                          color: fontColor4,
                          fontWeight: FontWeight.w800,
                          fontSize: 55),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: background2,
                  minimumSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 40,
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Login()));
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(
                color: Colors.transparent,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: background2,
                  minimumSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 40,
                ),
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Account(),
                  ),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                elevation: 40,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: ((context) => const ChildInformation()),
                      ),
                    );
                  },
                  child: Text(
                    'Is this the child device?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: fontColor4,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
