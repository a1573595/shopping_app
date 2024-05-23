import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shopping_app/configs.dart';
import 'package:shopping_app/gen/fonts.gen.dart';
import 'package:shopping_app/l10n/l10n.dart';
import 'package:shopping_app/router/app_router.dart';
import 'package:shopping_app/style/widget_style.dart';

void main() => runApp(const ShoppingApp());

class ShoppingApp extends HookWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = useMemoized(() => AppRouter());

    return MaterialApp.router(
      title: Configs.appName,
      routerConfig: appRouter.config(),
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          titleTextStyle: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontFamily: FontFamily.teko,
              ),
        ),
        cardTheme: const CardTheme(
          elevation: 4,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: WidgetStyle.textFieldRadius,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: WidgetStyle.textFieldRadius,
            ),
          ),
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.linux: CupertinoPageTransitionsBuilder(),
            TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
            TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.fuchsia: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
    );
  }
}
