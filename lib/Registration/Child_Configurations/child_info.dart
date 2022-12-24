import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pro1/Home_Page/Child_Version/Child_Home.dart';
import 'package:pro1/Home_Page/Child_Version/Child_Widgets/Code_Config/code_generator.dart';
import 'package:pro1/Registration/child_registration_code.dart';
import 'package:pro1/Theme//app_themes.dart';

class ChildInformation extends StatefulWidget {
  const ChildInformation({Key? key}) : super(key: key);

  @override
  State<ChildInformation> createState() => _ChildInformationState();
}

class _ChildInformationState extends State<ChildInformation> {
  final GlobalKey<FormState> formkey = GlobalKey();

  final TextEditingController _name = TextEditingController();
  final TextEditingController _age = TextEditingController();

  final Themes _themes = Themes();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: appLogo(),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  height: 775,
                  decoration: _themes.screenDecoration(context),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 30,
                      ),
                      _themes.title('Child Info'),
                      const SizedBox(
                        height: 70,
                      ),
                      TextFormField(
                        /*name text field*/
                        controller: _name,
                        keyboardType: TextInputType.name,
                        keyboardAppearance: Brightness.dark,
                        decoration:
                            _themes.textFormFieldDecoration('Child Name'),
                        obscureText: false,
                        validator: (value) {
                          var childn = value;
                          if (value!.isEmpty || value.length < 3) {
                            return 'Invalid name';
                          }
                          return null;
                        },
                        onSaved: (newValue) =>
                            setState(() => _name.text = newValue!),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        /*age field*/
                        controller: _age,
                        keyboardType: TextInputType.number,
                        keyboardAppearance: Brightness.dark,
                        decoration:
                            _themes.textFormFieldDecoration(' Child Age'),
                        obscureText: false,
                        validator: (value) {
                          if (value!.isEmpty || value.length >= 3) {
                            return 'Invalid age';
                          }
                          return null;
                        },
                        onSaved: (newValue) =>
                            setState(() => _age.text = newValue!),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                        /**save button */
                        onPressed: () async {
                          FirebaseDatabase database = FirebaseDatabase.instance;
                          DatabaseReference ref =
                              FirebaseDatabase.instance.ref().child('Users');
                          Random random = new Random();
                          int randomNumber = random.nextInt(10000);
                          String randID = randomNumber.toString();
                          ref.child(randID).set({"User_type": "Child"});

                          final isValid = formkey.currentState!.validate();
                          if (isValid) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_name.text != '' && _age.text != '')
                                    ? (context) => const CodeGenerator()
                                    : ((context) => const ChildInformation()),
                              ),
                            );
                          }
                        },
                        child: _themes.textButtonStyle('SAVE'),
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
