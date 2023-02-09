import 'package:flutter/material.dart';
import 'package:flutter_school/core/utils/color/scheme_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 30,
      child: Divider(
        color: UIColors.PRIMARY_COLOR,
        thickness: 2,
      ),
    );
  }
}
