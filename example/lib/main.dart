import 'package:flutter/material.dart';
import 'package:flutter_autostart_android/flutter_autostart_android.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final result =
                      await FlutterAutostartAndroid.requestAutoStartPermission();
                  print('Request autostart permission: $result');
                },
                child: const Text('Request autostart permission'),
              ),
              ElevatedButton(
                onPressed: () async {
                  final result =
                      await FlutterAutostartAndroid.isAutoStartPermissionAvailable(
                        false,
                      );
                  print('Check autostart permission: $result');
                },
                child: const Text('Check autostart permission'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
