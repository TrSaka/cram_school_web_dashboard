import 'package:flutter/material.dart';

import '../../utils/responsive/app_responsive_sizes.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  getHeight(value) => DefaultResponsiveSizes(context).getDeviceHeight() * value;
  getHeight2(value) => MediaQuery.of(context).size.height * value;
}
