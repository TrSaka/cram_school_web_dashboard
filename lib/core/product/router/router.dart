import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_school/core/product/view/login_view.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LoginView, initial: true),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
