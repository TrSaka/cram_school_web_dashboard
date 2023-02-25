import 'package:flutter/material.dart';
import '../../../utils/color/scheme_colors.dart';
import '../../../utils/responsive/app_responsive_sizes.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.press,
    required this.iconData,
  }) : super(key: key);

  final String title;
  final VoidCallback press;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width <= 800) {
      width = 0;
    }
    return ListTile(
      onTap: press,
      title: Row(
        children: [
          Icon(iconData, color: UIColors.bgColor),
          const SizedBox(width: DefaultResponsiveSizes.defaultResponsiveSizes),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: width * 0.01),
          ),
        ],
      ),
    );
  }
}
