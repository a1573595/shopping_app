import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shopping_app/gen/fonts.gen.dart';
import 'package:shopping_app/l10n/l10n.dart';
import 'package:shopping_app/style/widget_style.dart';
import 'package:shopping_app/widget/animated_credit_card.dart';

@RoutePage()
class PaymentPage extends HookWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: WidgetStyle.screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: kToolbarHeight,
          ),
          Center(
            child: Text(
              L10n.current.howWouldYouLikeToPay,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontFamily: FontFamily.teko,
                  ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Stack(
            children: [
              const AnimatedCreditCard(
                cardBackgroundColor: Colors.black,
                cardNumber: "1234 5678 9012 3456",
                expiryDate: "MM/YY",
                cardHolderName: "SOMEONE",
                cvvCode: "XXX",
              ),
              Banner(
                color: Theme.of(context).colorScheme.primary,
                message: L10n.current.main,
                location: BannerLocation.topStart,
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          const AnimatedCreditCard(
            cardBackgroundColor: Colors.blueAccent,
            cardNumber: "1234 5678 9012 3456",
            expiryDate: "MM/YY",
            cardHolderName: "SOMEONE",
            cvvCode: "XXX",
          ),
          const SizedBox(
            height: 32,
          ),
          const AnimatedCreditCard(
            cardBackgroundColor: Colors.green,
            cardNumber: "1234 5678 9012 3456",
            expiryDate: "MM/YY",
            cardHolderName: "SOMEONE",
            cvvCode: "XXX",
          ),
        ],
      ),
    );
  }
}
