import 'package:flutter/material.dart';

/*
Note:
    To represent user statistics through the chart we need 6 charts to represent data:
  A- child:
    1. device chart
    2. apps chart
    3. websites chart
  B- single user:
    1. device
    2. apps
    3. websites

    So make sure you create the needed data maps and add dynamic functionality for updating the content of each map
 */


Map<String, double> dataMap = {
  'instagram': 28,
  'messenger': 12,
  'linkedin': 15,
  'others' : 40,
};

Map<String, double> childDataMap = {
  'Youtube': 5,
  'E-Learning': 35,
  'SoloLearn': 20,
  'others' : 40,
};

List<Color> colorList = [
  const Color.fromRGBO(201, 227, 244, 1),
  const Color.fromRGBO(6, 33, 50, 1),
  const Color.fromRGBO(200, 100, 98, 1),
  const Color.fromRGBO(180, 50, 98, 1),
];