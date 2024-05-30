import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shopping_app/configs.dart';
import 'package:shopping_app/gen/fonts.gen.dart';
import 'package:shopping_app/hook/hook_animation.dart';
import 'package:shopping_app/l10n/l10n.dart';
import 'package:shopping_app/router/app_router.dart';
import 'package:shopping_app/utils/regex_util.dart';
import 'package:shopping_app/widget/keyboard_dismisses.dart';
import 'package:shopping_app/widget/sheet.dart';
import 'package:shopping_app/widget/twice_pop_scope.dart';
import 'package:url_launcher/url_launcher_string.dart';

@RoutePage()
class LoginPage extends HookWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TwicePopScope(
      child: KeyboardDismisses(
        child: Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  Configs.appName,
                                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                        fontFamily: FontFamily.teko,
                                      ),
                                ),
                                SizedBox(
                                  height: 36,
                                  child: DefaultTextStyle(
                                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                          color: Colors.grey,
                                          fontFamily: FontFamily.questrial,
                                        ),
                                    child: AnimatedTextKit(
                                      pause: const Duration(seconds: 5),
                                      repeatForever: true,
                                      animatedTexts: [
                                        TypewriterAnimatedText(
                                          L10n.current.everythingYouWant,
                                          speed: const Duration(milliseconds: 100),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Sheet(
                            child: Column(
                              children: [
                                const _EmailTextField(),
                                const SizedBox(
                                  height: 16,
                                ),
                                const _PasswordTextField(),
                                const SizedBox(
                                  height: 8,
                                ),
                                const _SignInButton(),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Align(
                                  alignment: Alignment.topRight,
                                  child: _ForgotPasswordText(),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    const Expanded(
                                      child: Divider(),
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Text(L10n.current.or),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    const Expanded(
                                      child: Divider(),
                                    ),
                                  ],
                                ),
                                const _SignUpButton(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    onPressed: () => context.router.push(const AboutRoute()),
                    icon: const Icon(Icons.info_outline),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EmailTextField extends HookWidget {
  const _EmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();

    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.next,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegexUtil.emailRangeRegex),
      ],
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email),
        labelText: L10n.current.email,
      ),
    );
  }
}

class _PasswordTextField extends HookWidget {
  const _PasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();

    final isObscureText = useState(true);

    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.done,
      obscureText: isObscureText.value,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegexUtil.passwordRangeRegex),
      ],
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: const Icon(Icons.visibility),
        labelText: L10n.current.password,
      ),
    );
  }
}

class _SignInButton extends HookWidget {
  const _SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => context.router.replace(const HomeRoute()),
        child: Text(
          L10n.current.signIn,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
      ),
    );
  }
}

class _ForgotPasswordText extends HookWidget {
  const _ForgotPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    final onTap = useCallback(() => launchUrlString(Configs.githubUrl));

    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
        children: [
          TextSpan(
            text: L10n.current.forgotPassword,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                  decoration: TextDecoration.underline,
                ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () => context.router.push(const CreateAccountRoute()),
        child: Text(
          L10n.current.signUp,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
