import 'package:flutter/material.dart';
import 'package:pro1/Registration/login.dart';
import 'package:pro1/app_themes.dart';
import 'package:pro1/launch.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final _passwordController = TextEditingController();
  final TextEditingController _confirmedPasswordController =
      TextEditingController();
      final SnackBar successfulReset = const SnackBar(content: Text('Password Changed Successfuly!'));
  final Map<String, String> _authData = {
    'email/username': '',
    'password': '',
  };
  bool allow = false;
  final Themes _themes = Themes();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme2,
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'media/images/On_Time.png',
                        width: 75,
                        height: 75,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'On Time',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  height: 775,
                  decoration: _themes.screenDecoration(),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      _themes.title('Reset Password'),
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        'NOTE! Use the code provided in the verification email to reset your password',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange[700],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        // configure the comaparasion of the entered value and code given in the email and write it's code
                        keyboardType: TextInputType.number,
                        keyboardAppearance: Brightness.dark,
                        decoration: _themes
                            .textFormFieldDecoration('verification code'),
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty || value.length != 6) {
                            setState(() {
                              allow = false;
                            });
                            return 'Invalid code';
                          } else {
                            setState(() {
                              allow = true;
                            });
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        //new password text field
                        keyboardAppearance: Brightness.dark,
                        enabled: allow,
                        validator: (value) {
                          if (value!.isEmpty || value.length < 6) {
                            return 'Short password';
                          }
                          return null;
                        },
                        controller: _passwordController,
                        onSaved: (newValue) {
                          setState(() {
                            _authData['password'] = newValue!;
                            _passwordController.text = newValue;
                          });
                        },
                        decoration:
                            _themes.textFormFieldDecoration('New Password'),
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        //Confirm password text field
                        keyboardAppearance: Brightness.dark,
                        enabled: allow,
                        controller: _confirmedPasswordController,
                        decoration: _themes
                            .textFormFieldDecoration('Confirm New Password'),
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty ||
                              value != _passwordController.text) {
                            return 'Password doesn\'t match';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          setState(
                            () {
                              _authData['password'] = newValue!;
                              _confirmedPasswordController.text = newValue;
                            },
                          );
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                        /**reset button */
                        onPressed: () {
                          final isValid = formKey.currentState!.validate();
                          if (isValid) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_passwordController.text != '')
                                    ? (context) => const Login()
                                    : ((context) => const ResetPassword()),
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(successfulReset);
                          }
                        },
                        child: _themes
                            .textButtonStyle(allow ? 'RESET' : 'VERIFY CODE'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
