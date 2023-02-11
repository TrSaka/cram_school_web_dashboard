import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_school/core/product/view/auth/login_view.dart';
import 'package:flutter_school/core/product/view/splash/splash_view.dart';
import 'package:flutter_school/view2/screens/main/main_screen.dart';
part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashView,initial: true,path: "/loading"),
    AutoRoute(page: LoginView, initial: false, path: "/login"),
    AutoRoute(page: MainView , initial :false,path: "/dashboard"),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
