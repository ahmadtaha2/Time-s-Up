import 'package:flutter/material.dart';
import 'package:pro1/Home_Page/Home_Page.dart';
import 'package:pro1/Home_Page/add_account.dart';
import 'package:pro1/Registration/Forgot_Password/verify_email.dart';
import 'package:pro1/launch.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pro1/app_themes.dart';

class SwitchAccount extends StatefulWidget {
  const SwitchAccount({Key? key}) : super(key: key);

  @override
  State<SwitchAccount> createState() => _SwitchAccountState();
}

class _SwitchAccountState extends State<SwitchAccount> {
  final Themes _themes = Themes();

// user input stored for comparison with the data stored in the database
  final TextEditingController _emailInput = TextEditingController();
  final TextEditingController _passwordInput = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();
  final Map<String, String> _authData = {
    'email/username': '',
    'password': '',
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme2,
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('media/images/logo2_small.png'),
                Container(
                  padding: const EdgeInsets.all(15),
                  height: 775,
                  decoration: _themes.screenDecoration(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.close_outlined,
                              color: Colors.blue[900],
                            ),
                          )
                        ],
                      ),
                      _themes.title('LOGIN'),
                      _themes.trailing('Login With a Different Account'),
                      const SizedBox(
                        height: 70,
                      ),
                      TextFormField(
                        //email/username text field
                        controller: _emailInput,
                        keyboardType: TextInputType.emailAddress,
                        keyboardAppearance: Brightness.dark,
                        decoration:
                            _themes.textFormFieldDecoration('Email'),
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
                        decoration: _themes.textFormFieldDecoration('Password'),
                        obscureText: true,
                        validator: (value) {
                          if (value!.length < 6) {
                            return 'Short password';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          _authData['password'] = newValue!;
                          _passwordInput.text = newValue;
                        },
                      ),
                      Row(
                        /**Forgot Password Link*/
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
                            child: _themes.resetLink('Forgot Password'),
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
                                    ? (context) => const MyHomePage()
                                    : ((context) => const SwitchAccount()),
                              ),
                            );
                            getData;
                          }
                        },
                        child: _themes.textButtonStyle('LOGIN'),
                      ),
                      Row(
                        /**Swich to Sign up */
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _themes.linkText1('New User?'),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => const AddAccount()),
                                ),
                              );
                            },
                            child: _themes.linkText2('ADD ACCOUNT'),
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
}
