import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shopping_app/gen/assets.gen.dart';
import 'package:shopping_app/gen/fonts.gen.dart';
import 'package:shopping_app/l10n/l10n.dart';
import 'package:shopping_app/model/catalog.dart';
import 'package:shopping_app/style/widget_style.dart';

part 'search_page.dart';

final List<Catalog> _catalogList = [
  Catalog(
    imageAsset: Assets.images.catalog.cake.path,
    title: L10n.current.cake,
  ),
  Catalog(
    imageAsset: Assets.images.catalog.breakfast.path,
    title: L10n.current.breakfast,
  ),
  Catalog(
    imageAsset: Assets.images.catalog.dinner.path,
    title: L10n.current.dinner,
  ),
  Catalog(
    imageAsset: Assets.images.catalog.fruit.path,
    title: L10n.current.fruit,
  ),
  Catalog(
    imageAsset: Assets.images.catalog.desert.path,
    title: L10n.current.desert,
  ),
  Catalog(
    imageAsset: Assets.images.catalog.food.path,
    title: L10n.current.food,
  ),
  Catalog(
    imageAsset: Assets.images.catalog.drink.path,
    title: L10n.current.drink,
  ),
  Catalog(
    imageAsset: Assets.images.catalog.bread.path,
    title: L10n.current.bread,
  ),
  Catalog(
    imageAsset: Assets.images.catalog.chineseFood.path,
    title: L10n.current.chineseFood,
  ),
  Catalog(
    imageAsset: Assets.images.catalog.japaneseFood.path,
    title: L10n.current.japaneseFood,
  ),
  Catalog(
    imageAsset: Assets.images.catalog.fastFood.path,
    title: L10n.current.fastFood,
  ),
];
