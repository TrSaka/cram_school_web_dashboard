import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_school/core/base/view/base_view.dart';
import 'package:flutter_school/core/utils/responsive/app_responsive_sizes.dart';
import 'package:flutter_school/core/widgets/global/header.dart';
import '../../../../widgets/home/dashboard_screen.dart';
import '../../../../widgets/global/drawer/drawer.dart';
import '../../../view_model/home/menu/menu_view_model.dart';

class MenuView extends ConsumerStatefulWidget {
  const MenuView({super.key});

  @override
  ConsumerState<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends ConsumerState<MenuView> {
  MenuViewModel viewModel = MenuViewModel();

  @override
  Widget build(BuildContext context) {
    int pageNumber = ref.watch(pageChangeProvider);

    return BaseView(
      viewModel: viewModel,
      onPageBuilder: (context, value) {
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          drawer: const Drawer(),
          body: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(flex: 1, child: DrawerMenu()),
                Expanded(
                  flex: 5,
                  child: dashboardView(pageNumber),
                ),
              ],
            ),
          ),
        );
      },
      onModelReady: (model) {
        viewModel.checkUserLoggedProtectUrl(ref, context);
        viewModel = model;
      },
    );
  }

  DashboardScreen dashboardView(int pageNumber) {
    return DashboardScreen(
      scaffold: Scaffold(
        body: Column(
          children: [
            const SizedBox(
                height: DefaultResponsiveSizes.defaultResponsiveSizes / 2),
            const Header(),
            Expanded(child: viewModel.pages[pageNumber]),
          ],
        ),
      ),
    );
  }
}
