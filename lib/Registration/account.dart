import 'package:flutter/material.dart';
import 'package:pro1/Registration/choose_mode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pro1/Registration/login.dart';
import 'package:pro1/app_themes.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final Themes _themes = Themes();

//Capture user inputs
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmedPasswordController =
      TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();
  final Map<String, String> _authData = {
    'username': '',
    'email': '',
    'password': '',
  };
  bool hidden = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background1,
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: appLogo(),
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
                      Material(
                        color: Colors.transparent,
                        elevation: 40,
                        child: Column(
                          children: [
                            _themes.title('SIGN UP'),
                            _themes.trailing('Welcome to On Time'),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 40,
                        child: TextFormField(
                          //username text field
                          keyboardType: TextInputType.name,
                          keyboardAppearance: Brightness.dark,
                          controller: _usernameController,
                          decoration: _themes.textFormFieldDecoration('Username'),
                          obscureText: false,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 4) {
                              if(value.isEmpty){
                                return 'This field is required!';
                              }
                              else {
                                return 'Invalid username';
                              }
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            _authData['username'] = newValue!;
                            _usernameController.text = newValue;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 40,
                        child: TextFormField(
                          //email text field
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          keyboardAppearance: Brightness.dark,
                          decoration: _themes.textFormFieldDecoration('Email'),
                          obscureText: false,
                          validator: (value) {
                            if (value!.isEmpty ||
                                !value.contains('@') ||
                                !value.contains('.com') ||
                                value.length < 12) {
                              if(value.isEmpty){
                                return 'This field is required!';
                              }
                              else{
                                return 'Invalid email';
                              }
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            setState(() {
                              _authData['email'] = newValue!;
                              _emailController.text = newValue;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 40,
                        child: TextFormField(
                          /*password text field*/
                          keyboardAppearance: Brightness.dark,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 6) {
                              if(value.isEmpty){
                                return 'This field is required!';
                              }
                              else {
                                return 'Short password';
                              }
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
                                hidden
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                              ),
                              onPressed: () {
                                setState(() {
                                  hidden = !hidden;
                                });
                              },
                            ),
                          ),
                          obscureText: hidden,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 40,
                        child: TextFormField(
                          //Confirm password text field
                          keyboardAppearance: Brightness.dark,
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
                                hidden
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                              ),
                              onPressed: () {
                                setState(() {
                                  hidden = !hidden;
                                });
                              },
                            ),
                          ),
                          obscureText: hidden,
                          validator: (value) {
                            if (value!.isEmpty || value != _passwordController.text) {
                              if(value.isEmpty){
                                return 'This field is required!';
                              }
                              else {
                                return 'Password doesn\'t match';
                              }
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            setState(() {
                              _authData['password'] = newValue!;
                              _confirmedPasswordController.text = newValue;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 40,
                        child: TextButton(
                          /**Sign up button */
                          onPressed: () {
                            final isValid = formKey.currentState!.validate();
                            if (isValid) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_emailController.text != '' &&
                                          _passwordController.text != '' &&
                                          _usernameController.text != '')
                                      ? (context) => const ChooseMode()
                                      : ((context) => const Account()),
                                ),
                              );
                              getData;
                            }
                          },
                          child: _themes.textButtonStyle('SIGN UP'),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _themes.linkText1('ALREADY A MEMBER?'),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Login(),
                                  ),
                                );
                                getData;
                              },
                              child: _themes.linkText2('LOGIN'),
                            ),
                          ],
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

//Getter method to save sign-up user data/input
  get getData async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', _usernameController.text);
    prefs.setString('user', _emailController.text);
    prefs.setString('password', _passwordController.text);
  }

  // Widget swtch() {
  //   if (userMode == 'family') {
  //     return ParentHomePage();
  //   }
  //   if (userMode == 'personal') {
  //     return SingleUserHomePage();
  //   } else {
  //     return const Login();
  //   }
  // }
}
