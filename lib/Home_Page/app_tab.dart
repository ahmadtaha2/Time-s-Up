import 'package:flutter/material.dart';
import 'package:pro1/chart_data.dart';
import 'package:pro1/Registration/choose_mode.dart';
import 'package:pro1/Theme/app_themes.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:counter_button/counter_button.dart';

///This file is not ready yet
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final Themes _themes = Themes();
  final List _items = [
    'Hello1',
    'Hello2',
    'Hello3',
    'Hello4',
    'Hello5',
    'Hello6',
  ];
  String? selectedItem = 'Hello1';

  int _counterValue = 0;

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
            searchBar(context),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Center(
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
            // listView.builder { itemcount + itembuilder( listItem ) }
            ListTile(
              title: Text(
                'View app Statistics',
                style:
                    TextStyle(color: fontColor1, fontWeight: FontWeight.w800),
              ),
            ),
            Divider(
              color: fontColor1,
              thickness: 2,
            ),
            ListTile(
              title: Text(
                'View app Statistics',
                style: TextStyle(
                  color: fontColor1,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Divider(
              color: fontColor1,
              thickness: 2,
            ),
            ListTile(
              title: Text(
                'View app Statistics',
                style: TextStyle(
                  color: fontColor1,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Divider(
              color: fontColor1,
              thickness: 2,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          'Add limit',
          style: TextStyle(
            color: fontColor3,
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: Icon(
          Icons.add,
          color: fontColor3,
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text(
                "Time Limit",
                style: TextStyle(
                  color: fontColor6,
                ),
                textAlign: TextAlign.center,
              ),
              content: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      shadowColor: shadowColor1,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      color: background4,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Select App:'),
                            DropdownButton<String>(
                              value: selectedItem,
                              items: _items
                                  .map(
                                    (item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(item),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (item) =>
                                  setState(() => selectedItem = item),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      shadowColor: shadowColor1,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      color: background4,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Set Limit:'),
                            CounterButton(
                              loading: false,
                              onChange: (int val) {
                                setState(() {
                                  _counterValue = val;
                                });
                              },
                              count: _counterValue,
                              countColor: fontColor4,
                              buttonColor: fontColor2,
                              progressColor: fontColor3,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
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
                          color: fontColor6,
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
                          color: fontColor6,
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
        backgroundColor: background4,
        enableFeedback: true,
        tooltip: 'Add app limit',
      ),
    );
  }
}
