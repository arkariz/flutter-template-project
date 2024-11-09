part of 'fl_responsive.dart';

enum FLDeviceType { android, ios, fuchsia, web, windows, mac, linux }

enum FLScreenType { mobile, tablet, desktop }

class Device {
  static late BoxConstraints boxConstraints;

  static late Orientation orientation;

  static late FLDeviceType deviceType;

  static late FLScreenType screenType;

  static late double blockHorizontal;

  static late double blockVertical;

  static late double height;

  static late double width;

  static late double aspectRatio;

  static late double pixelRatio;

  static void setScreenSize(
    BuildContext context,
    BoxConstraints constraints,
    Orientation currentOrientation,
  ) {
    boxConstraints = constraints;
    orientation = currentOrientation;

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    aspectRatio = constraints.constrainDimensions(width, height).aspectRatio;
    pixelRatio = _ambiguate(WidgetsBinding.instance)!.window.devicePixelRatio;

    blockHorizontal = boxConstraints.maxWidth / 100;
    blockVertical = boxConstraints.maxHeight / 100;

    if (kIsWeb) {
      deviceType = FLDeviceType.web;
    } else {
      switch (defaultTargetPlatform) {
        case TargetPlatform.android:
          deviceType = FLDeviceType.android;
          break;
        case TargetPlatform.iOS:
          deviceType = FLDeviceType.ios;
          break;
        case TargetPlatform.windows:
          deviceType = FLDeviceType.windows;
          break;
        case TargetPlatform.macOS:
          deviceType = FLDeviceType.mac;
          break;
        case TargetPlatform.linux:
          deviceType = FLDeviceType.linux;
          break;
        case TargetPlatform.fuchsia:
          deviceType = FLDeviceType.fuchsia;
          break;
      }
    }

    if (width >= 1300) {
      screenType = FLScreenType.desktop;
    } else if (width < 1300 && width >= 650) {
      screenType = FLScreenType.tablet;
    } else {
      screenType = FLScreenType.mobile;
    }
  }

  static isLandscape(BuildContext context) {
    return (MediaQuery.of(context).orientation == Orientation.landscape);
  }

  static T? _ambiguate<T>(T? value) => value;
}
