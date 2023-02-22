// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_school/core/constants/enums/cache_enum.dart';
import 'package:flutter_school/core/product/router/nav_route.dart';
import 'package:flutter_school/core/product/router/router.dart';
import 'package:flutter_school/core/product/view_model/home/menu/menu_view_model.dart';
import 'package:flutter_school/core/service/cache/locale_management.dart';
import 'package:flutter_school/core/widgets/home/drawer_listtile_widget.dart';

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
                }),
            DrawerListTile(
                iconData: Icons.article_rounded,
                title: "Sınav Sonuçları",
                press: () {
                  changePage(ref, 1);
                }),
            DrawerListTile(
                iconData: Icons.pattern,
                title: "Ödevler",
                press: () {
                  changePage(ref, 2);
                }),
            DrawerListTile(
                iconData: Icons.add_alert_rounded,
                title: "Duyurular",
                press: () {
                  changePage(ref, 3);
                }),
            DrawerListTile(
                iconData: Icons.settings,
                title: "Ayarlar",
                press: () {
                  changePage(ref, 4);
                }),
            DrawerListTile(
              iconData: Icons.logout_rounded,
              title: "Çıkış Yap",
              press: () async {
                viewModel.deleteRememberMeDataFromCache();
                await FirebaseAuth.instance.signOut();
                LocalManagement.instance
                    .deleteAuth(SharedPreferencesKeys.CACHE_AUTH);
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
