import 'package:flutter/material.dart';
import 'package:pro1/Registration/login.dart';
import 'package:pro1/app_themes.dart';

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
  final SnackBar successfulReset =
      const SnackBar(content: Text('Password Changed Successfuly!'));
  final Map<String, String> _authData = {
    'email/username': '',
    'password': '',
  };
  bool allow = false;
  bool visible = false;
  final Themes _themes = Themes();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background1,
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: appLogo(),
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
                      Material(
                        color: Colors.transparent,
                        elevation: 40,
                        child: _themes.title('Reset Password'),
                      ),
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
                      Material(
                        color: Colors.transparent,
                        elevation: 40,
                        child: TextFormField(
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
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 40,
                        child: TextFormField(
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
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue[50],
                            labelText: 'Password',
                            labelStyle: const TextStyle(color: Colors.blue),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                visible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                              ),
                              onPressed: () {
                                setState(() {
                                  visible = !visible;
                                });
                              },
                            ),
                          ),
                          obscureText: visible,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 40,
                        child: TextFormField(
                          //Confirm password text field
                          keyboardAppearance: Brightness.dark,
                          enabled: allow,
                          controller: _confirmedPasswordController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue[50],
                            labelText: 'Password',
                            labelStyle: const TextStyle(color: Colors.blue),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                visible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                              ),
                              onPressed: () {
                                setState(() {
                                  visible = !visible;
                                });
                              },
                            ),
                          ),
                          obscureText: visible,
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
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 40,
                        child: TextButton(
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
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(successfulReset);
                            }
                          },
                          child: _themes
                              .textButtonStyle(allow ? 'RESET' : 'VERIFY CODE'),
                        ),
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
