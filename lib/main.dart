// ignore_for_file: depend_on_referenced_packages

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_school/core/constants/enums/cache_enum.dart';
import 'package:flutter_school/core/initalize/theme/app_theme_light.dart';
import 'package:flutter_school/core/product/router/nav_route.dart';
import 'package:flutter_school/core/riverpod/firebase_riverpod.dart';
import 'package:flutter_school/core/service/cache/locale_management.dart';
import 'core/product/router/router.dart';
import 'firebase_options.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;

void main() async {
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };
  WidgetsFlutterBinding.ensureInitialized();
  await LocalManagement.prefrencesInit(); //Shared Preferences initalized
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  final _appRouter = AppRouter();

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    

    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      theme: AppThemeLight.theme, //app theme is our light theme
    );
  }
}
