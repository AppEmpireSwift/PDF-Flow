import 'dart:ui';

class CommonConfig {
  final String appName;

  final Size figmaDesignSize;

  final String appId;

  final String appHudKey;

  final String supportEmail;

  CommonConfig({
    required this.appName,
    required this.figmaDesignSize,
    required this.appId,
    required this.appHudKey,
    required this.supportEmail,
  });

  String get appStoreAppLink => 'https://apps.apple.com/app/id$appId';
}
