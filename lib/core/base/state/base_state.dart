import 'package:flutter/material.dart';
abstract class BaseState<T extends StatefulWidget> extends State<T> {
  getHeight(value) {
    return MediaQuery.of(context).size.height * value;
  }

  getWidth(value) {
    return MediaQuery.of(context).size.width * value;
  }

  ThemeData getTheme() {
    return Theme.of(context);
  }
}
