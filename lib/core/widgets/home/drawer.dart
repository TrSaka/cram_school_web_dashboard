// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_school/core/product/router/nav_route.dart';
import 'package:flutter_school/core/product/router/router.dart';
import 'package:flutter_school/core/product/view_model/home/menu/menu_view_model.dart';
import 'package:flutter_school/core/utils/color/scheme_colors.dart';

class DrawerMenu extends ConsumerWidget {
  const DrawerMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MenuViewModel viewModel = MenuViewModel();
    return Drawer(
      elevation: 10,
      backgroundColor: Theme.of(context).primaryColor,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const DrawerHeader(child: FlutterLogo()),
            DrawerListTile(
              iconData: Icons.people_rounded,
              title: "Öğrencilerim",
              press: () {
                changePage(ref, 0);
              },
            ),
            DrawerListTile(
              iconData: Icons.article_rounded,
              title: "Sınav Sonuçları",
              press: () {
                changePage(ref, 1);
              },
            ),
            DrawerListTile(
              iconData: Icons.add_alert_rounded,
              title: "Duyurular",
              press: () {
                changePage(ref, 2);
              },
            ),
            DrawerListTile(
              iconData: Icons.settings,
              title: "Ayarlar",
              press: () {
                changePage(ref, 3);
              },
            ),
            DrawerListTile(
              iconData: Icons.logout_rounded,
              title: "Çıkış Yap",
              press: () async {
                viewModel.deleteRememberMeDataFromCache();
                await FirebaseAuth.instance.signOut();
                debugPrint("Signed out");
                NavRoute(const LoginRoute()).toPushReplecement(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void changePage(WidgetRef ref, int number) {
    ref.read(pageChangeProvider.notifier).changeState(number);
  }
}

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
    return ListTile(
      onTap: press,
      title: Row(
        children: [
          Icon(iconData, color: UIColors.bgColor),
          const SizedBox(width: UIColors.defaultPadding),
          Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
