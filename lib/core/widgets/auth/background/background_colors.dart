import 'package:flutter/material.dart';
import '../../../utils/color/scheme_colors.dart';

class BackgroundColors extends StatelessWidget {
  const BackgroundColors({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        expandedWidget(UIColors.PRIMARY_COLOR),
        expandedWidget(Colors.white),
      ],
    );
  }

  Expanded expandedWidget(Color color) {
    return Expanded(
      flex: 5,
      child: Container(
        color: color,
      ),
    );
  }
}



