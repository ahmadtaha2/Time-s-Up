import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pro1/Theme/app_themes.dart';

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
      backgroundColor: background4,
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: const EdgeInsets.all(10),
        decoration: _themes.screenDecoration(context),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            ListTile(
              title: Text(
                'Connected Devices',
                style: TextStyle(
                  color: fontColor1,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              trailing: IconButton(
                onPressed: null,
                icon: Icon(
                  CupertinoIcons.square_fill,
                  color: fontColor1,
                  size: 35,
                ),
              ),
              subtitle: Divider(
                color: fontColor1,
                thickness: 6,
              ),
            ),

            ///ListView.builder will be added here
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text(
                "Add a device",
                style: TextStyle(
                  color: fontColor1,
                ),
                textAlign: TextAlign.center,
              ),
              content: SizedBox(
                width: 200,
                height: 180,
                child: TextFormField(
                  style: TextStyle(
                    color: fontColor4,
                  ),
                  keyboardType: TextInputType.number,
                  decoration: _themes.textFormFieldDecoration('Email/Username'),
                  obscureText: true,
                ),
              ),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Add',
                        style: TextStyle(
                          color: fontColor1,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: fontColor1,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
              elevation: 30,
            ),
          );
        },
        backgroundColor: background1,
        child: Icon(
          CupertinoIcons.add_circled,
          color: fontColor1,
        ),
      ),
    );
  }
}

///chart
/*
Center(
                heightFactor: 1.2,
                child: PieChart(
                  dataMap: (userMode.isNotEmpty && userMode == 'family')
                      ? childDataMap
                      : childDeviceDataMap,
                  colorList: colorList,
                  chartRadius: MediaQuery.of(context).size.width / 2,
                  chartValuesOptions: ChartValuesOptions(
                    chartValueStyle: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: fontColor1,
                    ),
                    showChartValues: true,
                    showChartValuesOutside: true,
                    showChartValuesInPercentage: true,
                    showChartValueBackground: false,
                  ),
                  legendOptions: LegendOptions(
                    showLegends: true,
                    legendPosition: LegendPosition.left,
                    legendTextStyle: TextStyle(
                      color: fontColor1,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              )
 */
