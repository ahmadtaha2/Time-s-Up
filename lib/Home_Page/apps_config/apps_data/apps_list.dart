import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:app_usage/app_usage.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:pro1/Registration/choose_mode.dart';
import 'package:pro1/Theme/app_themes.dart';
import 'package:pro1/chart_data.dart';

class AppsListScreen extends StatefulWidget {
  const AppsListScreen({super.key});

  @override
  _AppsListScreenState createState() => _AppsListScreenState();
}

class _AppsListScreenState extends State<AppsListScreen> {
  bool _showSystemApps = false;
  bool _onlyLaunchableApps = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apps List'),
        actions: <Widget>[
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<String>>[
                const PopupMenuItem<String>(
                  value: 'system_apps',
                  child: Text('Toggle system apps'),
                ),
                const PopupMenuItem<String>(
                  value: 'launchable_apps',
                  child: Text('Toggle launchable apps only'),
                )
              ];
            },
            onSelected: (String key) {
              if (key == 'system_apps') {
                setState(
                  () {
                    _showSystemApps = !_showSystemApps;
                  },
                );
              }
              if (key == 'launchable_apps') {
                setState(
                  () {
                    _onlyLaunchableApps = !_onlyLaunchableApps;
                  },
                );
              }
            },
          )
        ],
      ),
      body: _AppsListScreenContent(
        includeSystemApps: _showSystemApps,
        onlyAppsWithLaunchIntent: _onlyLaunchableApps,
        key: GlobalKey(),
      ),
    );
  }
}


class _AppsListScreenContent extends StatefulWidget {
  final bool includeSystemApps;
  final bool onlyAppsWithLaunchIntent;

  _AppsListScreenContent({
    Key? key,
    this.includeSystemApps = false,
    this.onlyAppsWithLaunchIntent = false,
  }) : super(key: key);

  @override
  State<_AppsListScreenContent> createState() => _AppsListScreenContentState();
}

class _AppsListScreenContentState extends State<_AppsListScreenContent> {
  List<AppUsageInfo> infos = [];

  @override
  void initState() {
    getUsageStats();
    super.initState();
  }

  void getUsageStats() async {
    try {
      DateTime endDate = DateTime.now();
      DateTime startDate = endDate.subtract(
        const Duration(
          hours: 1,
        ),
      );
      List<AppUsageInfo> infoList = await AppUsage().getAppUsage(
        startDate,
        endDate,
      );
      setState(
        () => infos = infoList,
      );
      for (var info in infoList) {
        print(
          info.toString(),
        );
      }
    } on AppUsageException catch (exception) {
      print(
        exception,
      );
    }
  }

  final ChartData _chartData = ChartData();
  @override
  Widget build(BuildContext context) {
    String timeSet(
      int hrs,
      int mins,
      int seconds,
    ) {
      String set = "${hrs != 0 ? '$hrs hrs : ' : ''}"
          "${mins % 60 != 0 ? '${mins % 60} m : ' : ''}"
          "${seconds % 60 != 0 ? '${seconds % 60} s' : ''}";
      return set;
    }

    double calulateTimeConsumedPercentage(int timeSpent) {
      final double timeConsumedPercentage =
          ((timeSpent / (60 * 60 * 16)) * 100).roundToDouble() / 100;
      return timeConsumedPercentage;
    }
    /*
    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Center(
                        heightFactor: 1.2,
                        child: PieChart(
                          dataMap: (userMode.isNotEmpty && userMode == 'family')
                              ? _chartData.childDataMap
                              : _chartData.appData,
                          colorList: _chartData.colorList,
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
     */

    return FutureBuilder<List<Application>>(
      future: DeviceApps.getInstalledApplications(
          includeAppIcons: true,
          includeSystemApps: widget.includeSystemApps,
          onlyAppsWithLaunchIntent: widget.onlyAppsWithLaunchIntent),
      builder: (BuildContext context, AsyncSnapshot<List<Application>> data) {
        if (data.data == null) {
          return const Center(child: CircularProgressIndicator());
        } else {
          List<Application> apps = data.data!;
          return ListView.builder(
              itemBuilder: (BuildContext context, int position) {
                Application app = apps[position];
                return Column(
                  children: <Widget>[

                    ListTile(
                      leading: app is ApplicationWithIcon
                          ? CircleAvatar(
                              backgroundImage: MemoryImage(app.icon),
                              backgroundColor: Colors.transparent,
                            )
                          : null,
                      onTap: () => onAppClicked(context, app),
                      title: Text(app.appName),
                      subtitle: position >= infos.length
                          ? null
                          : LinearPercentIndicator(
                              width: 120.0,
                              lineHeight: 15,
                              percent: position >= infos.length
                                  ? 0.0
                                  : infos[position].appName.toLowerCase() ==
                                          app.appName
                                      ? calulateTimeConsumedPercentage(
                                          infos[position].usage.inSeconds,
                                        )
                                      : 0.0,
                              center: Text(
                                position >= infos.length &&
                                        infos[position].toString().isEmpty
                                    ? ""
                                    : "${(calulateTimeConsumedPercentage(infos[position].usage.inSeconds) * 100).toInt()}%",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: fontColor3,
                                ),
                              ),
                              barRadius: const Radius.circular(25),
                              backgroundColor: Colors.grey,
                              progressColor: Colors.blue,
                              animation: true,
                              animationDuration: 1000,
                            ),
                      trailing: position >= infos.length
                          ? null
                          : Text(
                              position >= infos.length
                                  ? ' '
                                  : timeSet(
                                      infos[position].usage.inHours,
                                      infos[position].usage.inMinutes,
                                      infos[position].usage.inSeconds,
                                    ),
                            ),
                    ),
                    const Divider(
                      thickness: 2.0,
                      indent: 10,
                      endIndent: 10,
                    )
                  ],
                );
              },
              itemCount: apps.length);
        }
      },
    );
  }

  void onAppClicked(BuildContext context, Application app) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(app.appName),
            actions: <Widget>[
              _AppButtonAction(
                label: 'Open app',
                onPressed: () => app.openApp(),
              ),
              _AppButtonAction(
                label: 'Open app settings',
                onPressed: () => app.openSettingsScreen(),
              ),
              _AppButtonAction(
                label: 'Uninstall app',
                onPressed: () async => app.uninstallApp(),
              ),
            ],
          );
        });
  }

  void dataFilter() {
    List<AppUsageInfo> rawData = infos;
  }
  /*
  bool x = true;
    var y;
    if (x){
      y = rawData[0].appName;
      y = rawData[0].usage.inSeconds;
    }
   */
}

class _AppButtonAction extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const _AppButtonAction({required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed?.call();
        Navigator.of(context).maybePop();
      },
      child: Text(label),
    );
  }
}
