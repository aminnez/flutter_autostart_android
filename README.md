# Flutter Autostart Android

[![pub package](https://img.shields.io/pub/v/flutter_autostart_android.svg)](https://pub.dev/packages/flutter_autostart_android)
[![license](https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square)](https://opensource.org/licenses/MIT)

A Flutter port of the Android [AutoStarter](https://github.com/judemanutd/AutoStarter/) library that helps bring up the autostart permission manager on various OEM devices.

## About

This package is a Flutter implementation of the original Android AutoStarter library created by [judemanutd](https://github.com/judemanutd). All credit for the core functionality and manufacturer-specific implementations goes to the original project.

## Why this package?

Many Android OEMs with custom UIs (like Xiaomi, Letv, etc.) restrict background processes by default, which can prevent your Flutter app from receiving push notifications or performing background tasks. This package provides a cross-platform way to request autostart permissions on supported devices.

## Features

- Detect if autostart permission is required on the current device
- Open the OEM-specific autostart permission screen
- Supports multiple manufacturers (see list below)
- Simple API that works across platforms (unsupported platforms fail gracefully)

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_autostart_android: ^1.0.0
```

## Usage

Import the package:

```dart
import 'package:flutter_autostart_android/flutter_autostart_android.dart';
```

### Check if autostart is available

```dart
bool isAvailable = await FlutterAutostartAndroid.isAutoStartPermissionAvailable();
```

### Request autostart permission

```dart
bool success = await FlutterAutostartAndroid.requestAutoStartPermission();
```

### Handle the response

```dart
if (!success) {
  // Show instructions to user or fallback behavior
}
```

## Supported Manufacturers

The package currently supports:

1. Xiaomi/Redmi
2. Letv
3. Honor
4. Oppo
5. Vivo
6. Huawei
7. Samsung
8. Asus
9. OnePlus

Note: Some implementations are untested - contributions welcome!

## Platform Notes

- **Android**: Fully supported with OEM-specific implementations (based on original AutoStarter library)
- **iOS**: No-op (returns false) as this concept doesn't exist on iOS
- **Web**: No-op (returns false)

## Related Resources

Original Android library: [AutoStarter](https://github.com/judemanutd/AutoStarter/)

For more background on Android background restrictions:

- [dont-kill-my-app](https://github.com/urbandroid-team/dont-kill-my-app)
- [Background Execution Limits](https://developer.android.com/about/versions/oreo/background)

## Contributing

Contributions are welcome! Please open issues or PRs for:

- New OEM implementations
- Bug fixes
- Test coverage improvements