import 'package:flutter/material.dart';
import 'package:pro1/Registration/account.dart';
import 'package:pro1/launch.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pro1/Theme/app_themes.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:pro1/Registration/choose_mode.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import '../Home_Page/Parent_Version/parent_home.dart';
import '../Home_Page/Single_User_Version/single_user_home.dart';

class Login extends StatefulWidget {

  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
// user input stored for comparison with the data stored in the database
  final _emailInput = TextEditingController();
  final _passwordInput = TextEditingController();

  // final GlobalKey<FormState> formKey = GlobalKey();
  //final Map<String, String> _authData = {
  //'email/username': '',
  //'password': '',
  //};
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  var mpassword, memail;
  final Themes _themes = Themes();

  signIn() async {

    await Firebase.initializeApp();
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();

      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: memail, password: mpassword);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          AwesomeDialog(
              context: context,
              title: "Erorr",
              body: Text("No user found for that email."))
            ..show();
        } else if (e.code == 'wrong-password') {
          AwesomeDialog(
              context: context,
              title: "Erorr",
              body: Text("Wrong password provided for that user."))
            ..show();
        }
      }
    } else {
      print("Not valid");
    }
  }

  @override
  Widget build(BuildContext context)  {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme2,
        body: Form(
          key: formstate,
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
                            fontSize: 30),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.close_outlined,
                              color: Colors.blue[900],
                            ),
                          )
                        ],
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
                        onSaved: (val) {
                          memail = val;
                        },
                        // onSaved: (newValue) {
                        //_authData['email/username'] = newValue!;
                        // _emailInput.text = newValue;
                        //  },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        //password text field
                        controller: _passwordInput,
                        decoration: _themes.textFormFieldDecoration('Password'),
                        obscureText: true,
                        validator: (value) {
                          if (value!.length < 6) {
                            return 'Short password / Invalid password';
                          }
                          return null;
                        },
                        onSaved: (val) {
                          mpassword = val;
                        },
                        // onSaved: (newValue) {
                        // _authData['password'] = newValue!;
                        //_passwordInput.text = newValue;
                        // },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
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
                        onPressed: () async {
                          UserCredential response = await signIn();
                          final FirebaseAuth auth = FirebaseAuth.instance;
                          final User? user = auth.currentUser;
                          final uid = user?.uid;
                          final ref = FirebaseDatabase.instance.ref();
                          final snapshot = await ref.child('Users/$uid/User_Mode').get();
                          if (response != null) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_emailInput.text != '' &&
                                        _passwordInput.text != '')
                                    ? (context) => swtch(snapshot.value)
                                    : ((context) => const Login()),
                              ),
                            );
                          }
                          // final isValid = formKey.currentState!.validate();
                          //  if (isValid) {
                          //Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //  builder: (_emailInput.text != '' &&
                          //     _passwordInput.text != '')
                          //  ? (context) => const MyHomePage()
                          // : ((context) => const Login()),
                          // ),
                          //  );
                          //  getData;
                          //}
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


}
swtch(userMode){

  if (userMode == 'family') {
    return ParentHomePage();
  }
  if (userMode == 'personal') {
    return SingleUserHomePage();
  } else {
    return Login();
  }
}