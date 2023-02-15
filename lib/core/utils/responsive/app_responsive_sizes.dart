import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DefaultResponsiveSizes {
  final BuildContext context;
  DefaultResponsiveSizes(this.context);

  getDeviceHeight() {
    MediaQuery.of(context).size.height;
  }
  static const defaultResponsiveSizes = 16.0;
  
}
// kolay gelsin kardeşim bende yemekteyim : ok
