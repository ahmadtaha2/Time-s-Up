import 'package:flutter/material.dart';
import 'package:pro1/Registration/Child_Configurations//child_regetration_code.dart';
import 'package:pro1/app_themes.dart';

class ChildInformation extends StatefulWidget {
  const ChildInformation({Key? key}) : super(key: key);

  @override
  State<ChildInformation> createState() => _ChildInformationState();
}

class _ChildInformationState extends State<ChildInformation> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey();
  final Themes _themes = Themes();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background1,
        body: Form(
          key: formkey,
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
                      _themes.title('Child Info'),
                      const SizedBox(
                        height: 70,
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation:40,
                        child: TextFormField(
                          /*name text field*/
                          controller: _name,
                          keyboardType: TextInputType.name,
                          keyboardAppearance: Brightness.dark,
                          decoration: _themes.textFormFieldDecoration('Name'),
                          obscureText: false,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 3) {
                              return 'Invalid name';
                            }
                            return null;
                          },
                          onSaved: (newValue) =>
                              setState(() => _name.text = newValue!),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 40,
                        child: TextFormField(
                          /*age field*/
                          controller: _age,
                          keyboardType: TextInputType.number,
                          keyboardAppearance: Brightness.dark,
                          decoration: _themes.textFormFieldDecoration('age'),
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
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 40,
                        child: TextButton(
                          /**save button */
                          onPressed: () {
                            final isValid = formkey.currentState!.validate();
                            if (isValid) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_name.text != '' && _age.text != '')
                                      ? (context) => const SupervisorEmail()
                                      : ((context) => const ChildInformation()),
                                ),
                              );
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
