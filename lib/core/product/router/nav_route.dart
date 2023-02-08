import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

class NavRoute {
  final PageRouteInfo route;

  NavRoute(this.route);

  toPush(BuildContext context) {
    context.router.push(route);
  }

  toPushReplecement(BuildContext context) {
    context.router.replace(route);
  }
}
