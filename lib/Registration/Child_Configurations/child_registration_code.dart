import 'package:flutter/material.dart';
import 'package:pro1/Home_Page/Child_Version/Child_Home.dart';
import 'package:pro1/app_themes.dart';

class ChildRegistrationCode extends StatefulWidget {
  const ChildRegistrationCode({Key? key}) : super(key: key);

  @override
  State<ChildRegistrationCode> createState() => _ChildRegistrationCodeState();
}

class _ChildRegistrationCodeState extends State<ChildRegistrationCode> {
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController connectionCodeController = TextEditingController();
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
                      //TODO: a code will be revealed here to connect the child's device
                      Material(
                        color: Colors.transparent,
                        elevation: 40,
                        child: _themes.title('Connection Code'),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 40,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          keyboardAppearance: Brightness.dark,
                          decoration: _themes.textFormFieldDecoration(
                              'Enter a connection code'),
                          validator: (value) {
                            if (value!.isEmpty || value.length > 25) {
                              if (value.isEmpty) {
                                return 'This field is required!';
                              } else if (value.length > 25) {
                                return 'Invalid code';
                              }
                            }
                          },
                          onSaved: (newValue) {
                            connectionCodeController.text = newValue!;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 40,
                        child: TextButton(
                          onPressed: () {
                            final isValid = formKey.currentState!.validate();
                            if (isValid) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: connectionCodeController.text.isEmpty
                                      ? (context) =>
                                          const ChildRegistrationCode()
                                      : (context) => const ChildHomePage(),
                                ),
                              );
                            }
                          },
                          child: _themes.textButtonStyle('Connect'),
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
