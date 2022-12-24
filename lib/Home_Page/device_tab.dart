import 'package:flutter/material.dart';
import 'package:pro1/chart_data.dart';
import 'package:pro1/Registration/choose_mode.dart';
import 'package:pro1/Theme/app_themes.dart';
import 'package:pie_chart/pie_chart.dart';

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
      backgroundColor: background4,
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: const EdgeInsets.all(10),
        decoration: _themes.screenDecoration(context),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Center(
                /**
                 * FIXME: I don't see the need of the chart in the device tab
                 */
                heightFactor: 1.2,
                child: PieChart(
                  dataMap: (userMode.isNotEmpty && userMode == 'family')
                      ? childDataMap
                      : dataMap,
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
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            ListTile(
              title: (userMode.isNotEmpty && userMode == 'family')
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Lock / Unlock Device',
                          style: TextStyle(
                            color: fontColor1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                              ),
                              child: const Text(
                                'lock',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                              ),
                              child: const Text(
                                'unlock',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

/*
Text(
                'NOTE: add Lock / unlock feature here',
                style: TextStyle(
                  color: fontColor1,
                  fontWeight: FontWeight.w800,
                ),
              ),
 */
