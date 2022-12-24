import 'package:flutter/material.dart';
import 'package:pro1/Registration/Forgot_Password/reset_password.dart';
import 'package:pro1/Theme/app_themes.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  final _emailInput = TextEditingController();
  final Map<String, String> _authData = {
    'email/username': '',
    'password': '',
  };
  final Themes _themes = Themes();
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                  decoration: _themes.screenDecoration(context),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.close_outlined,
                              color: background4,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Column(
                        children: [
                          _themes.title('Verify Email'),
                          _themes.trailing(
                              'Verify your email address to reset your password'),
                        ],
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        keyboardAppearance: Brightness.dark,
                        decoration: _themes.textFormFieldDecoration('Email'),
                        obscureText: false,
                        validator: (value) {
                          if (value!.isEmpty ||
                              !value.contains('@') ||
                              !value.contains('.com') ||
                              value.length < 12) {
                            if (value.isEmpty) {
                              return 'This field is required!';
                            } else {
                              return 'Invalid email/username';
                            }
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          _authData['email/username'] = newValue!;
                          _emailInput.text = newValue;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextButton(
                        onPressed: () {
                          SnackBar verificationMessage = const SnackBar(
                            content: Text(
                              'Verification message is sent to your email',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            duration: Duration(seconds: 4),
                          );
                          final isValid = formKey.currentState!.validate();
                          if (isValid) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(verificationMessage);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_emailInput.text != '')
                                    ? (context) => const VerifyEmail()
                                    : (context) =>
                                        const ResetPassword(), // fix it
                              ),
                            );
                          }
                        },
                        child: _themes.textButtonStyle('VERIFY'),
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
