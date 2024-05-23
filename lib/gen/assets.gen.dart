/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/ad
  $AssetsImagesAdGen get ad => const $AssetsImagesAdGen();

  /// Directory path: assets/images/catalog
  $AssetsImagesCatalogGen get catalog => const $AssetsImagesCatalogGen();

  /// File path: assets/images/contact_less.png
  AssetGenImage get contactLess =>
      const AssetGenImage('assets/images/contact_less.png');

  /// Directory path: assets/images/guide
  $AssetsImagesGuideGen get guide => const $AssetsImagesGuideGen();

  /// File path: assets/images/mastercard.png
  AssetGenImage get mastercard =>
      const AssetGenImage('assets/images/mastercard.png');

  /// Directory path: assets/images/product
  $AssetsImagesProductGen get product => const $AssetsImagesProductGen();

  /// List of all assets
  List<AssetGenImage> get values => [contactLess, mastercard];
}

class $AssetsImagesAdGen {
  const $AssetsImagesAdGen();

  /// File path: assets/images/ad/ad1.jpg
  AssetGenImage get ad1 => const AssetGenImage('assets/images/ad/ad1.jpg');

  /// File path: assets/images/ad/ad2.jpg
  AssetGenImage get ad2 => const AssetGenImage('assets/images/ad/ad2.jpg');

  /// File path: assets/images/ad/ad3.jpg
  AssetGenImage get ad3 => const AssetGenImage('assets/images/ad/ad3.jpg');

  /// File path: assets/images/ad/ad4.jpg
  AssetGenImage get ad4 => const AssetGenImage('assets/images/ad/ad4.jpg');

  /// File path: assets/images/ad/ad5.jpg
  AssetGenImage get ad5 => const AssetGenImage('assets/images/ad/ad5.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [ad1, ad2, ad3, ad4, ad5];
}

class $AssetsImagesCatalogGen {
  const $AssetsImagesCatalogGen();

  /// File path: assets/images/catalog/bread.jpeg
  AssetGenImage get bread =>
      const AssetGenImage('assets/images/catalog/bread.jpeg');

  /// File path: assets/images/catalog/breakfast.jpeg
  AssetGenImage get breakfast =>
      const AssetGenImage('assets/images/catalog/breakfast.jpeg');

  /// File path: assets/images/catalog/cake.jpeg
  AssetGenImage get cake =>
      const AssetGenImage('assets/images/catalog/cake.jpeg');

  /// File path: assets/images/catalog/chinese_food.jpeg
  AssetGenImage get chineseFood =>
      const AssetGenImage('assets/images/catalog/chinese_food.jpeg');

  /// File path: assets/images/catalog/desert.jpeg
  AssetGenImage get desert =>
      const AssetGenImage('assets/images/catalog/desert.jpeg');

  /// File path: assets/images/catalog/dinner.jpeg
  AssetGenImage get dinner =>
      const AssetGenImage('assets/images/catalog/dinner.jpeg');

  /// File path: assets/images/catalog/drink.jpeg
  AssetGenImage get drink =>
      const AssetGenImage('assets/images/catalog/drink.jpeg');

  /// File path: assets/images/catalog/fast_food.jpeg
  AssetGenImage get fastFood =>
      const AssetGenImage('assets/images/catalog/fast_food.jpeg');

  /// File path: assets/images/catalog/food.jpeg
  AssetGenImage get food =>
      const AssetGenImage('assets/images/catalog/food.jpeg');

  /// File path: assets/images/catalog/fruit.jpeg
  AssetGenImage get fruit =>
      const AssetGenImage('assets/images/catalog/fruit.jpeg');

  /// File path: assets/images/catalog/japanese_food.jpeg
  AssetGenImage get japaneseFood =>
      const AssetGenImage('assets/images/catalog/japanese_food.jpeg');

  /// List of all assets
  List<AssetGenImage> get values => [
        bread,
        breakfast,
        cake,
        chineseFood,
        desert,
        dinner,
        drink,
        fastFood,
        food,
        fruit,
        japaneseFood
      ];
}

class $AssetsImagesGuideGen {
  const $AssetsImagesGuideGen();

  /// File path: assets/images/guide/fast.png
  AssetGenImage get fast => const AssetGenImage('assets/images/guide/fast.png');

  /// File path: assets/images/guide/puzzle.png
  AssetGenImage get puzzle =>
      const AssetGenImage('assets/images/guide/puzzle.png');

  /// File path: assets/images/guide/saving.png
  AssetGenImage get saving =>
      const AssetGenImage('assets/images/guide/saving.png');

  /// List of all assets
  List<AssetGenImage> get values => [fast, puzzle, saving];
}

class $AssetsImagesProductGen {
  const $AssetsImagesProductGen();

  /// File path: assets/images/product/pd1.jpg
  AssetGenImage get pd1 => const AssetGenImage('assets/images/product/pd1.jpg');

  /// File path: assets/images/product/pd2.jpg
  AssetGenImage get pd2 => const AssetGenImage('assets/images/product/pd2.jpg');

  /// File path: assets/images/product/pd3.jpg
  AssetGenImage get pd3 => const AssetGenImage('assets/images/product/pd3.jpg');

  /// File path: assets/images/product/pd4.jpg
  AssetGenImage get pd4 => const AssetGenImage('assets/images/product/pd4.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [pd1, pd2, pd3, pd4];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  final Size? size;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
