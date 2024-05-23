import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shopping_app/configs.dart';
import 'package:shopping_app/gen/fonts.gen.dart';
import 'package:shopping_app/l10n/l10n.dart';
import 'package:shopping_app/utils/regex_util.dart';
import 'package:shopping_app/widget/keyboard_dismisses.dart';
import 'package:shopping_app/widget/sheet.dart';
import 'package:url_launcher/url_launcher_string.dart';

@RoutePage()
class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisses(
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: OverflowBox(
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            DefaultTextStyle(
                              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                                    fontFamily: FontFamily.teko,
                                  ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(L10n.current.whoYouAre),
                                  AnimatedTextKit(
                                    pause: Duration.zero,
                                    repeatForever: true,
                                    animatedTexts: [
                                      TypewriterAnimatedText(
                                        "",
                                        speed: const Duration(milliseconds: 500),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Sheet(
                    child: Column(
                      children: [
                        _NameTextField(),
                        SizedBox(
                          height: 16,
                        ),
                        _EmailTextField(),
                        SizedBox(
                          height: 16,
                        ),
                        _PasswordTextField(),
                        SizedBox(
                          height: 16,
                        ),
                        _SignUpButton(),
                        _HyperLinkText(),
                      ],
                    ),
                  ),
                ],
              ),
              const Positioned(
                left: 4,
                child: BackButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NameTextField extends HookWidget {
  const _NameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();

    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.person),
        labelText: L10n.current.name,
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

class _HyperLinkText extends HookWidget {
  const _HyperLinkText({super.key});

  @override
  Widget build(BuildContext context) {
    final onTermsClick = useCallback(() => launchUrlString(Configs.githubUrl));

    final onPrivacyClick = useCallback(() => launchUrlString(Configs.githubUrl));

    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
        children: [
          TextSpan(
            text: L10n.current.partOfTermsAndPrivacy1,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          TextSpan(
            text: L10n.current.partOfTermsAndPrivacy2,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                  decoration: TextDecoration.underline,
                ),
            recognizer: TapGestureRecognizer()..onTap = onTermsClick,
          ),
          TextSpan(
            text: L10n.current.partOfTermsAndPrivacy3,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          TextSpan(
            text: L10n.current.partOfTermsAndPrivacy4,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                  decoration: TextDecoration.underline,
                ),
            recognizer: TapGestureRecognizer()..onTap = onPrivacyClick,
          ),
          TextSpan(
            text: L10n.current.partOfTermsAndPrivacy5,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

class _SignUpButton extends HookWidget {
  const _SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => launchUrlString(Configs.githubUrl),
        child: Text(
          L10n.current.signUp,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
      ),
    );
  }
}
