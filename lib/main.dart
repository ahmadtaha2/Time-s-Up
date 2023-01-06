import 'package:flutter/material.dart';
import 'package:pro1/Theme/theme_const.dart';
import 'launch.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());

  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(const MyApp());
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      title: 'Total Control',
      locale: Get.deviceLocale,
      home: const SafeArea(
        child: Launch(),
      ),
    );
  }
}

/*
Data needed for device, apps and websites are just the
time spent + name of the app and the website
TODO: team tasks{

    TODO mine:{
      chart & search (in progress with ahmad)
      login

       }
}
 */
