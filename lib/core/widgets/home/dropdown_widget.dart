// ignore_for_file: use_build_context_synchronously

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_school/core/product/router/nav_route.dart';
import 'package:flutter_school/core/product/router/router.dart';
import 'package:flutter_school/core/product/view_model/auth/login_view_model.dart';
import 'package:flutter_school/core/product/view_model/home/menu/menu_view_model.dart';
import 'package:flutter_school/core/riverpod/firebase_riverpod.dart';
import '../../constants/enums/cache_enum.dart';
import '../../service/cache/locale_management.dart';

class DropDownButton extends ConsumerWidget {
  const DropDownButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MenuViewModel _viewModel = MenuViewModel();

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                customButton: Icon(
                  Icons.menu,
                  size: 46,
                  color: Theme.of(context).primaryColor,
                ),
                items: [
                  ...MenuItems.firstItems.map(
                    (item) => DropdownMenuItem<MenuItem>(
                      value: item,
                      child: MenuItems.buildItem(item),
                    ),
                  ),
                  const DropdownMenuItem<Divider>(
                      enabled: false, child: Divider()),
                  ...MenuItems.secondItems.map(
                    (item) => DropdownMenuItem<MenuItem>(
                      value: item,
                      child: MenuItems.buildItem(item),
                    ),
                  ),
                ],
                onChanged: (value) {
                  MenuItems.onChanged(
                      context, value as MenuItem, _viewModel, ref);
                },
                itemHeight: 30,
                itemPadding: const EdgeInsets.only(left: 16, right: 16),
                dropdownWidth: 160,
                dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
                dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Theme.of(context).primaryColor),
                dropdownElevation: 8,
                offset: const Offset(0, 8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MenuItem {
  final String text;
  final IconData icon;

  const MenuItem({
    required this.text,
    required this.icon,
  });
}

class MenuItems {
  static const List<MenuItem> firstItems = [home];
  static const List<MenuItem> secondItems = [logout];

  static const home =
      MenuItem(text: 'Profil', icon: Icons.account_circle_rounded);

  static const logout = MenuItem(text: 'Çıkış Yap', icon: Icons.logout);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: Colors.white, size: 22),
        const SizedBox(width: 10),
        Text(
          item.text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  static onChanged(
      BuildContext context, MenuItem item, _viewModel, WidgetRef ref) async {
    switch (item) {
      case MenuItems.home:
        break;
      case MenuItems.logout:
        _viewModel.deleteRememberMeDataFromCache();
        await ref.read(authProvider).signOut();
       await LocalManagement.instance.deleteAuth(SharedPreferencesKeys.CACHE_AUTH);
        NavRoute(const LoginRoute()).toPushReplecement(context);
        //
        break;
    }
  }
}
