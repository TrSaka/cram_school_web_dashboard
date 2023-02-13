import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_school/core/product/view/auth/login_view.dart';
import 'package:flutter_school/core/product/view/splash/splash_view.dart';
import 'package:flutter_school/core/product/view/home/menu/menu_view.dart';
part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashView, initial: true, path: "/loading"),
    AutoRoute(page: LoginView, initial: false, path: "/login"),
    AutoRoute(page: MenuView, initial: false, path: "/dashboard"),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
