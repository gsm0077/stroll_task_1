/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsJpgGen {
  const $AssetsJpgGen();

  /// File path: assets/jpg/bg_chat.jpg
  AssetGenImage get bgChat => const AssetGenImage('assets/jpg/bg_chat.jpg');

  /// File path: assets/jpg/sunrise.jpg
  AssetGenImage get sunrise => const AssetGenImage('assets/jpg/sunrise.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [bgChat, sunrise];
}

class $AssetsPngsGen {
  const $AssetsPngsGen();

  /// File path: assets/pngs/Joey.png
  AssetGenImage get joey => const AssetGenImage('assets/pngs/Joey.png');

  /// List of all assets
  List<AssetGenImage> get values => [joey];
}

class $AssetsSvgsGen {
  const $AssetsSvgsGen();

  /// Directory path: assets/svgs/bottom
  $AssetsSvgsBottomGen get bottom => const $AssetsSvgsBottomGen();

  /// Directory path: assets/svgs/dashboard
  $AssetsSvgsDashboardGen get dashboard => const $AssetsSvgsDashboardGen();

  /// Directory path: assets/svgs/flames
  $AssetsSvgsFlamesGen get flames => const $AssetsSvgsFlamesGen();
}

class $AssetsSvgsBottomGen {
  const $AssetsSvgsBottomGen();

  /// File path: assets/svgs/bottom/Card.svg
  String get card => 'assets/svgs/bottom/Card.svg';

  /// File path: assets/svgs/bottom/Chat.svg
  String get chat => 'assets/svgs/bottom/Chat.svg';

  /// File path: assets/svgs/bottom/User.svg
  String get user => 'assets/svgs/bottom/User.svg';

  /// File path: assets/svgs/bottom/bonfire.svg
  String get bonfire => 'assets/svgs/bottom/bonfire.svg';

  /// List of all assets
  List<String> get values => [card, chat, user, bonfire];
}

class $AssetsSvgsDashboardGen {
  const $AssetsSvgsDashboardGen();

  /// File path: assets/svgs/dashboard/clock.svg
  String get clock => 'assets/svgs/dashboard/clock.svg';

  /// File path: assets/svgs/dashboard/fade.svg
  String get fade => 'assets/svgs/dashboard/fade.svg';

  /// File path: assets/svgs/dashboard/user.svg
  String get user => 'assets/svgs/dashboard/user.svg';

  /// List of all assets
  List<String> get values => [clock, fade, user];
}

class $AssetsSvgsFlamesGen {
  const $AssetsSvgsFlamesGen();

  /// File path: assets/svgs/flames/mic.svg
  String get mic => 'assets/svgs/flames/mic.svg';

  /// List of all assets
  List<String> get values => [mic];
}

class Assets {
  const Assets._();

  static const $AssetsJpgGen jpg = $AssetsJpgGen();
  static const $AssetsPngsGen pngs = $AssetsPngsGen();
  static const $AssetsSvgsGen svgs = $AssetsSvgsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
