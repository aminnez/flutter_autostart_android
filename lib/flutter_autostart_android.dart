import 'package:flutter/services.dart';

class FlutterAutostartAndroid {
  FlutterAutostartAndroid._();

  /// Checks whether the autostart permission is present in the manufacturer and supported by the library
  ///
  /// @param onlyIfSupported if true, the method will only return true if the screen is supported by the library.
  ///          If false, the method will return true as long as the permission exist even if the screen is not supported
  ///          by the library.
  ///
  /// @return true if autostart permission is present in the manufacturer and supported by the library, false otherwise
  static Future<bool> isAutoStartPermissionAvailable(
    bool onlyIfSupported,
  ) async {
    final methodChannel = const MethodChannel('flutter_autostart_android');

    final check = await methodChannel.invokeMethod<bool>(
      'isAutoStartPermissionAvailable',
      {"onlyIfSupported": onlyIfSupported},
    );
    return check ?? false;
  }

  /// It will attempt to open the specific manufacturer settings screen with the autostart permission
  ///
  /// @return true if the activity was opened, false otherwise
  static Future<bool> requestAutoStartPermission() async {
    final methodChannel = const MethodChannel('flutter_autostart_android');

    final request = await methodChannel.invokeMethod<bool>('requestAutoStart');
    return request ?? false;
  }
}
