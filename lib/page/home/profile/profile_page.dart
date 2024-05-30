import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/configs.dart';
import 'package:shopping_app/gen/fonts.gen.dart';
import 'package:shopping_app/l10n/l10n.dart';
import 'package:shopping_app/router/app_router.dart';
import 'package:shopping_app/style/widget_style.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: WidgetStyle.screenPadding,
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: (MediaQuery.sizeOf(context).width / 12).roundToDouble(),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: Text(
                    "VIS",
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: Theme.of(context).colorScheme.surface,
                          fontFamily: FontFamily.teko,
                        ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Flexible(
                  child: Text(
                    L10n.current.visitor,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontFamily: FontFamily.questrial,
                        ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Icon(
                                Icons.notifications,
                                color: Colors.yellow,
                              ),
                              Icon(Icons.notifications_none_outlined),
                              Badge(),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(L10n.current.notifications),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Icon(Icons.person),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(L10n.current.profile),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                      onTap: () => const LoginRoute().push(context),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Icon(Icons.login),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(L10n.current.signOut),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Card(
              child: ListTile(
                title: Text(L10n.current.news),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(L10n.current.coupon),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Row(
                  children: [
                    Text(L10n.current.shareCode),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        L10n.current.new_,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ],
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: Text(
                L10n.current.currentVersion(Configs.versionCode, Configs.versionName),
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
