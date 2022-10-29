import 'package:flutter/material.dart';
import 'package:pro1/app_themes.dart';
import 'package:pro1/launch.dart';

///This file is not ready yet
class Website extends StatefulWidget {
  const Website({super.key});

  @override
  State<Website> createState() => _WebsiteState();
}

class _WebsiteState extends State<Website> {
  final Themes _themes = Themes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background1,
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: const EdgeInsets.all(10),
        decoration: _themes.screenDecoration(),
        child: ListView(
          children: [
            Card(
              color: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: fontColor3,
                    ),
                    Text(
                      'Search',
                      style: TextStyle(
                        color: fontColor3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              heightFactor: 10,
              child: Text(
                'Chart',
                style: TextStyle(
                  color: fontColor1,
                ),
              ),
            ),
            Divider(
              color: fontColor1,
              thickness: 2,
            ),
            ListTile(
              title: Text(
                'View device Statistics',
                style: TextStyle(
                  color: fontColor1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
