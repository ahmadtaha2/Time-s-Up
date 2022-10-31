import 'package:flutter/material.dart';
//import 'package:pro1/Home_Page/Home_Page.dart';
import 'package:pro1/Home_Page/Parent_Version/parent_home.dart';
import 'package:pro1/Home_Page/Single_User_Version/single_user_home.dart';
import 'package:pro1/Registration/Forgot_Password/verify_email.dart';
import 'package:pro1/Registration/account.dart';
import 'package:pro1/Registration/choose_mode.dart';
//import 'package:pro1/launch.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pro1/app_themes.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
// user input stored for comparison with the data stored in the database
  final _emailInput = TextEditingController();
  final _passwordInput = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();
  final Map<String, String> _authData = {
    'email/username': '',
    'password': '',
  };

  final Themes _themes = Themes();
  bool visible = false;

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
                  padding: const EdgeInsets.all(12.0),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 30,
                      ),
                      _themes.title('LOGIN'),
                      _themes.trailing('Sign in to your account'),
                      const SizedBox(
                        height: 70,
                      ),
                      TextFormField(
                        //email/username text field
                        controller: _emailInput,
                        keyboardType: TextInputType.emailAddress,
                        keyboardAppearance: Brightness.dark,
                        decoration:
                            _themes.textFormFieldDecoration('Email/Username'),
                        obscureText: false,
                        validator: (value) {
                          if (value!.isEmpty ||
                              !value.contains('@') ||
                              !value.contains('.com') ||
                              value.length < 12) {
                            return 'Invalid email/username';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          _authData['email/username'] = newValue!;
                          _emailInput.text = newValue;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        //password text field
                        keyboardAppearance: Brightness.dark,
                        controller: _passwordInput,
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
                          if (value!.length < 6) {
                            return 'Short password / Invalid password';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          _authData['password'] = newValue!;
                          _passwordInput.text = newValue;
                        },
                      ),
                      Row(
                        /**Forgot Password link*/
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const VerifyEmail(),
                                ),
                              );
                            },
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Colors.orange[800],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        /**Login button */
                        onPressed: () {
                          final isValid = formKey.currentState!.validate();
                          if (isValid) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_emailInput.text != '' &&
                                        _passwordInput.text != '')
                                    ? (context) => swtch()
                                    : ((context) => const Login()),
                              ),
                            );
                            getData;
                          }
                        },
                        child: _themes.textButtonStyle('LOGIN'),
                      ),
                      Row(
                        /*Switch to Sign up */
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _themes.linkText1('New User?'),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => const Account()),
                                ),
                              );
                            },
                            child: _themes.linkText2('SIGN UP'),
                          ),
                        ],
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

//getter method to save the login user data/input
  get getData async {
    SharedPreferences loginPrefs = await SharedPreferences.getInstance();
    loginPrefs.setString('user', _emailInput.text);
    loginPrefs.setString('password', _passwordInput.text);
  }

  Widget swtch() {
    if (userMode == 'family') {
      return ParentHomePage();
    }
    if (userMode == 'personal') {
      return SingleUserHomePage();
    } else {
      return const Login();
    }
  }
}
