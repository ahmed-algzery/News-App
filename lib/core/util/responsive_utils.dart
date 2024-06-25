import 'package:flutter/material.dart';

double h(BuildContext context, double fraction) {
  var deviceHeight = MediaQuery.of(context).size.height;
  return deviceHeight * fraction;
}

double w(BuildContext context, double fraction) {
  var deviceWidth = MediaQuery.of(context).size.width;
  return deviceWidth * fraction;
}
