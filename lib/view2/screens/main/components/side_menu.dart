import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_school/core/product/router/nav_route.dart';
import 'package:flutter_school/core/product/router/router.dart';
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
              title: "Çıkış Yap",
              press: () async {
                await FirebaseAuth.instance.signOut();
                print("Signed out");
                NavRoute(LoginRoute()).toPushReplecement(context);
              },
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
