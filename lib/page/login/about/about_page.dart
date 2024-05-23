import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/configs.dart';
import 'package:shopping_app/gen/fonts.gen.dart';
import 'package:shopping_app/l10n/l10n.dart';
import 'package:shopping_app/router/app_router.dart';
import 'package:shopping_app/style/widget_style.dart';
import 'package:url_launcher/url_launcher_string.dart';

@RoutePage()
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.current.about),
      ),
      body: SingleChildScrollView(
        padding: WidgetStyle.screenPadding,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            FlutterLogo(
              size: MediaQuery.sizeOf(context).width * .4,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              Configs.appName,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontFamily: FontFamily.teko,
                  ),
            ),
            Text(
              L10n.current.appVersion(Configs.versionName),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
            ),
            const SizedBox(
              height: 32,
            ),
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text(L10n.current.termsOfService),
                    onTap: () => launchUrlString(Configs.githubUrl),
                  ),
                  const Divider(),
                  ListTile(
                    title: Text(L10n.current.privacyPolicy),
                    onTap: () => launchUrlString(Configs.githubUrl),
                  ),
                  const Divider(),
                  ListTile(
                    title: Text(L10n.current.license),
                    onTap: () => context.router.push(const LicenseRoute()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
