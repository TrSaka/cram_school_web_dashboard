import 'package:flutter/material.dart';
import 'package:flutter_school/view2/constants.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: secondaryColor,
      child: SingleChildScrollView(
        // it enables scrolling
        child: Column(
          children: [
            const DrawerHeader(
              child: FlutterLogo(),
            ),
            DrawerListTile(
              title: "Duyurular",
              press: () {},
            ),
            DrawerListTile(
              title: "Duyurular",
              press: () {},
            ),
            DrawerListTile(
              title: "Duyurular",
              press: () {},
            ),
            DrawerListTile(
              title: "Duyurular",
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: .0,
      title: Text(
        title,
        style: const TextStyle(color: Colors.white54),
      ),
    );
  }
}
