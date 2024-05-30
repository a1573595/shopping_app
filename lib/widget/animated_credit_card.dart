import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shopping_app/gen/assets.gen.dart';
import 'package:shopping_app/style/widget_style.dart';
import 'package:shopping_app/widget/animated_flip.dart';

class AnimatedCreditCard extends StatefulWidget {
  const AnimatedCreditCard({
    super.key,
    required this.cardBackgroundColor,
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
    required this.cvvCode,
    this.animationDuration = const Duration(milliseconds: 500),
    this.height,
    this.width,
  });

  final Color? cardBackgroundColor;

  /// A string indicating number on the card.
  final String cardNumber;

  /// A string indicating expiry date for the card.
  final String expiryDate;

  /// A string indicating name of the card holder.
  final String cardHolderName;

  /// A String indicating cvv code.
  final String cvvCode;

  /// Duration for flip animation. Defaults to 500 milliseconds.
  final Duration animationDuration;

  /// Sets height of the front and back side of the card.
  final double? height;

  /// Sets width of the front and back side of the card.
  final double? width;

  @override
  State<AnimatedCreditCard> createState() => _AnimatedCreditCardState();
}

class _AnimatedCreditCardState extends State<AnimatedCreditCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _frontRotation;
  late Animation<double> _backRotation;

  bool isFrontVisible = true;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    _updateRotations(false);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildGesture(
          child: AnimatedFlip(
            animation: _frontRotation,
            child: _CreditCardFront(
              cardBackgroundColor: widget.cardBackgroundColor,
              cardNumber: widget.cardNumber,
              expiryDate: widget.expiryDate,
              cardHolderName: widget.cardHolderName,
            ),
          ),
        ),
        _buildGesture(
          child: AnimatedFlip(
            animation: _backRotation,
            child: _CreditCardBack(
              cardBackgroundColor: widget.cardBackgroundColor,
              cvvCode: widget.cvvCode,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  Widget _buildGesture({required Widget child}) {
    double childHalfWidth = 0.0;

    return GestureDetector(
      onTapUp: (details) {
        _toggleSide(
          flipFromRight: details.localPosition.dx > childHalfWidth,
        );
      },
      child: LayoutBuilder(
        builder: (_, BoxConstraints constraints) {
          childHalfWidth = constraints.maxWidth / 2;
          return child;
        },
      ),
    );
  }

  void _toggleSide({required bool flipFromRight}) {
    _updateRotations(flipFromRight);

    if (isFrontVisible) {
      isFrontVisible = false;
      _controller.forward();
    } else {
      isFrontVisible = true;
      _controller.reverse();
    }
  }

  void _updateRotations(bool isRightSwipe) {
    final bool rotateToLeft = (isFrontVisible && !isRightSwipe) || (!isFrontVisible && isRightSwipe);
    final double start = rotateToLeft ? (pi / 2) : (-pi / 2);
    final double end = rotateToLeft ? (-pi / 2) : (pi / 2);

    /// Initialize the Front to back rotation tween sequence.
    _frontRotation = TweenSequence<double>(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: 0.0,
            end: start,
          ).chain(CurveTween(
            curve: Curves.linear,
          )),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(end),
          weight: 50.0,
        ),
      ],
    ).animate(_controller);

    ///Initialize the Back to Front rotation tween sequence.
    _backRotation = TweenSequence<double>(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(start),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: end,
            end: 0.0,
          ).chain(CurveTween(
            curve: Curves.linear,
          )),
          weight: 50.0,
        ),
      ],
    ).animate(_controller);
  }
}

class _CreditCardFront extends StatelessWidget {
  const _CreditCardFront({
    super.key,
    required this.cardBackgroundColor,
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
  });

  final Color? cardBackgroundColor;
  final String cardNumber;
  final String cardHolderName;
  final String expiryDate;

  @override
  Widget build(BuildContext context) {
    final color = cardBackgroundColor ?? Theme.of(context).colorScheme.primary;

    return Container(
      padding: WidgetStyle.screenPadding,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white70),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        gradient: LinearGradient(
          colors: [
            color,
            color.withOpacity(.8),
            color.withOpacity(.6),
            color.withOpacity(.5),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                Assets.images.contactLess.path,
                height: 24,
              ),
              Image.asset(
                Assets.images.mastercard.path,
                height: 48,
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
            cardNumber,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                ),
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "CARD HOLDER",
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontSize: 8,
                          color: Colors.white,
                        ),
                  ),
                  Text(
                    cardHolderName,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "VALID THRU",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontSize: 8,
                          color: Colors.white,
                        ),
                  ),
                  Text(
                    expiryDate,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
              const SizedBox(
                width: 16,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}

class _CreditCardBack extends StatelessWidget {
  const _CreditCardBack({
    super.key,
    required this.cardBackgroundColor,
    required this.cvvCode,
  });

  final Color? cardBackgroundColor;
  final String cvvCode;

  @override
  Widget build(BuildContext context) {
    final color = cardBackgroundColor ?? Theme.of(context).colorScheme.primary;

    return Container(
      padding: WidgetStyle.screenVerticalPadding,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white70),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        gradient: LinearGradient(
          colors: [
            color.withOpacity(.5),
            color.withOpacity(.6),
            color.withOpacity(.8),
            color,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: Colors.black,
            width: double.infinity,
            height: 48,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.grey,
                  width: double.infinity,
                  height: 36,
                ),
              ),
              Container(
                color: Colors.white,
                width: 72,
                height: 24,
                child: Text(
                  cvvCode,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 88,
          ),
        ],
      ),
    );
  }
}
