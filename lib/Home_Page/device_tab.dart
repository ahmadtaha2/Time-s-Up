import 'package:flutter/material.dart';
import 'package:pro1/app_themes.dart';
import 'package:pro1/launch.dart';

//This file is not ready yet
class Device extends StatefulWidget {
  const Device({super.key});

  @override
  State<Device> createState() => _DeviceState();
}

class _DeviceState extends State<Device> {
  final Themes _themes = Themes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme2,
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
                  borderRadius: BorderRadius.circular(30)),
              child: TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: theme1,
                    ),
                    Text(
                      'Search',
                      style: TextStyle(
                        color: theme1,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Center(
              heightFactor: 10,
              child: Text('Chart'),
            ),
            Divider(
              color: Colors.blue[900]!,
              thickness: 2,
            ),
            const ListTile(
              title: Text('View device Statistics'),
            ),
          ],
        ),
      ),
    );
  }
}
