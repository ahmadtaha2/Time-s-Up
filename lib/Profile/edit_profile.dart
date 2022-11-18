import 'package:flutter/material.dart';
import 'package:pro1/app_themes.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool visible = false;
  SnackBar editProfileMessage = const SnackBar(
    content: Text(
      'Saved!',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
  );
  bool logIn = true;
  final Themes _themes = Themes();
  final GlobalKey<FormState> formKey = GlobalKey();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background1,
      appBar: AppBar(
        backgroundColor: background1,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person,
                color: circleImageColor2,
              ),
            ),
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Container(
            height: 775,
            decoration: _themes.screenDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                    left: 30,
                    right: 10,
                    bottom: 30,
                  ),
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: fontColor2,
                    ),
                  ),
                ),
                Container(
                  height: 686,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 40,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    color: background3,
                  ),
                  child: Column(
                    children: [
                      /*
                      * the user entries must be saved
                      */
                      Material(
                        color: Colors.transparent,
                        elevation: 40,
                        child: TextFormField(
                          /*edit name text field*/
                          keyboardType: TextInputType.name,
                          keyboardAppearance: Brightness.dark,
                          //controller: _usernameController,
                          decoration: _themes.textFormFieldDecoration('Name'),
                          obscureText: false,
                          validator: (value) {
                            if (value!.length < 4) {
                              return 'Invalid name';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            //_authData['username'] = newValue!;
                            //_usernameController.text = newValue;
                          },
                        ),
                      ),
                      const Divider(
                        color: Colors.transparent,
                        thickness: 1,
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 40,
                        child: TextFormField(
                          //username text field
                          keyboardType: TextInputType.name,
                          keyboardAppearance: Brightness.dark,
                          //controller: _usernameController,
                          decoration:
                              _themes.textFormFieldDecoration('Username'),
                          obscureText: false,
                          validator: (value) {
                            if (value!.length < 4) {
                              return 'Invalid username';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            //_authData['username'] = newValue!;
                            //_usernameController.text = newValue;
                          },
                        ),
                      ),
                      const Divider(
                        color: Colors.transparent,
                        thickness: 1,
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 40,
                        child: TextFormField(
                          /* edit email text field*/
                          keyboardType: TextInputType.emailAddress,
                          keyboardAppearance: Brightness.dark,
                          //controller: _usernameController,
                          decoration: _themes.textFormFieldDecoration('Email'),
                          obscureText: false,
                          validator: (value) {
                            if (value!.isEmpty ||
                                !value.contains('@') ||
                                !value.contains('.com') ||
                                value.length < 12) {
                              return 'Invalid email';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            //_authData['username'] = newValue!;
                            //_usernameController.text = newValue;
                          },
                        ),
                      ),
                      const Divider(
                        color: Colors.transparent,
                        thickness: 1,
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 40,
                        child: TextFormField(
                          //edit phone number text field
                          keyboardType: TextInputType.phone,
                          keyboardAppearance: Brightness.dark,
                          //controller: _usernameController,
                          decoration:
                              _themes.textFormFieldDecoration('Phone Number'),
                          obscureText: false,
                          validator: (value) {
                            if (value!.length < 10) {
                              return 'Invalid phone number';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            //_authData['username'] = newValue!;
                            //_usernameController.text = newValue;
                          },
                        ),
                      ),
                      const Divider(
                        color: Colors.transparent,
                        thickness: 1,
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 40,
                        child: TextFormField(
                          //edit password text field
                          keyboardType: TextInputType.text,
                          keyboardAppearance: Brightness.dark,
                          //controller: _usernameController,
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
                              return 'Invalid password';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            //_authData['username'] = newValue!;
                            //_usernameController.text = newValue;
                          },
                        ),
                      ),
                      const Divider(
                        color: Colors.transparent,
                        thickness: 1,
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 40,
                        child: TextFormField(
                          //Edit birthday text field
                          keyboardType: TextInputType.datetime,
                          keyboardAppearance: Brightness.dark,
                          //controller: _usernameController,
                          decoration:
                              _themes.textFormFieldDecoration('Birthday'),
                          obscureText: false,
                          validator: (value) {
                            if (value!.length < 10) {
                              return 'Invalid birthday';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            //_authData['username'] = newValue!;
                            //_usernameController.text = newValue;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 30,
                        child: TextButton(
                          onPressed: () {
                            final bool isValid =
                                formKey.currentState!.validate();
                            if (isValid) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(editProfileMessage);
                              Navigator.of(context).pop(context);
                            }
                          },
                          child: _themes.textButtonStyle('SAVE'),
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
